import 'dart:ui';

import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:webview_flutter/webview_flutter.dart';
import '/utils/utils.dart';

// https://juejin.cn/post/7061867814662963230
// https://book.flutterchina.club/chapter7/willpopscope.html

class WebviewBox extends StatefulWidget {
  final String url;
  final String title;
  final bool showAppBar;
  final bool setStorage;

  const WebviewBox(
      {Key? key, required this.url, this.title = '', this.showAppBar = true, this.setStorage = false})
      : super(key: key);

  @override
  State<WebviewBox> createState() => _MidState();
}

class _MidState extends State<WebviewBox> {
  dynamic _controller;
  dynamic title;

  @override
  void initState() {
    super.initState();
    setState(() {
      title = widget.title;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          appBar: widget.showAppBar
              ? AppBar(
                  title: Text(title),
                  leading: IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      _controller.canGoBack().then((value) {
                        if (value) {
                          _controller.goBack();
                        } else {
                          return Navigator.pop(context);
                        }
                      });
                    },
                  ),
                  actions: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.close),
                    ),
                  ],
                )
              : PreferredSize(
                  preferredSize: Size.fromHeight(
                      MediaQueryData.fromWindow(window).padding.top),
                  child: const SafeArea(
                    child: Offstage(),
                    top: true,
                  ),
                ),
          body: WebView(
            initialUrl: widget.url,
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController controller) {
              _controller = controller;
            },
            onPageFinished: (url) {
              if (widget.showAppBar) {
                _controller.evaluateJavascript("document.title").then((result) {
                  result = result.substring(1, result.length - 1);
                  setState(() {
                    title = result;
                  });
                });
              }

              // 往webview中的localStorage同步数据
              if (widget.setStorage) {
                const authToken = '1234';
                _controller.evaluateJavascript("(function() { try { window.localStorage.setItem('webview_token', '$authToken');} catch (err) { return err; } })();").then((result) {
                  // ignore: avoid_print
                  print(result);
                });
              }

              // 带箭头的里面自能有一个执行语句，且结尾不需要加分号；
              // _controller.evaluateJavascript('document.cookie').then((result) => {
              //   print(result)
              // });
            },
            javascriptChannels: {
              // 提供给js调用的方法 FlutterChannel_sendMsg
              JavascriptChannel(
                name: 'FlutterChannel_sendMsg',
                onMessageReceived: (msg) {
                  String res = msg.message;
                  Utils.showToast(res);
                },
              ),
              // 提供给js调用的方法 FlutterChannel_openPage
              JavascriptChannel(
                name: 'FlutterChannel_openPage',
                onMessageReceived: (msg) {
                  String res = msg.message;
                  Navigator.pushNamed(context, res);
                },
              ),
              // 提供给js调用的方法。通过类型判断，在回调js提供的方法
              JavascriptChannel(
                name: 'FlutterChannel_inte',
                onMessageReceived: (msg) {
                  String res = msg.message;
                  if (res == '1') {
                    // 调用有返回值JS方法，并打印结果
                    _controller
                        .runJavascriptReturningResult(
                      "FlutterCallJs_fn1('Flutter调用了JS，并且有返回值')",
                    )
                        .then((value) {
                      Utils.showToast(value.toString());
                    });
                  }
                  if (res == '2') {
                    // 调用无返回值JS方法
                    _controller.runJavascript(
                      "FlutterCallJs_fn2('Flutter调用了JS，没有返回值')",
                    );
                  }
                },
              ),
            },
          ),
        ),
        onWillPop: () async {
          var canGoback = await _controller.canGoBack();
          // ignore: avoid_print
          // print("canGoback 值是：$canGoback");
          if (canGoback) {
            await _controller.goBack();
            return false;
          } else {
            return true;
          }
        });
  }
}
