// ignore_for_file: file_names, deprecated_member_use

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../utils/utils.dart';


class UrlLauncher extends StatefulWidget {
  final String title;

  const UrlLauncher({Key? key, this.title = 'url_launcher使用'}) : super(key: key);

  @override
  State<UrlLauncher> createState() => _MidState();
}

class _MidState extends State<UrlLauncher> {
  // @override
  // void initState() {
  //   super.initState();
  //   // ignore: avoid_print
  //   print("初始化 initState");
  // }

  void _call() {
    final Uri _url = Uri(
      scheme: 'tel',
      path: '10010',
    );
    launchUrl(_url);
  }

  void _message() {
    final Uri _url = Uri(
      scheme: 'sms',
      path: '15600206716',
      queryParameters: <String, String>{
        // 'body': Uri.encodeComponent('来自flutter的测试短信'),
        'body': '来自flutter的测试短信'
      },
    );
    launchUrl(_url);
  }

  void _email() {
    String? encodeQueryParameters(Map<String, String> params) {
      return params.entries
          .map((MapEntry<String, String> e) =>
              '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
          .join('&');
    }

    final Uri _url = Uri(
      scheme: 'mailto',
      path: 'gamesan@163.com',
      query: encodeQueryParameters(<String, String>{
        'subject': '来自flutter的测试邮件',
        'body': '来自flutter的测试邮件'
      }),
    );
    launchUrl(_url);
  }

  // 参考文档
  // https://www.jianshu.com/p/197d25b1df3c
  // 高德地图获取经纬度
  // https://lbs.amap.com/demo/javascript-api/example/map/click-to-get-lnglat
  void _openMapApp() async {
    dynamic latitude = 109.962361;
    dynamic longitude = 27.506608;
    final Uri _url = Uri.parse('${Platform.isAndroid ? 'android' : 'ios'}amap://navi?sourceApplication=amap&lat=$latitude&lon=$longitude&dev=0&style=2');
    // Future<bool> Future 和 async-await 介绍： https://dart.cn/tutorials/language/futures
    bool _bool = await launchUrl(_url);
    if (!_bool) {
      // throw '$_url 无法打开高德地图';
      Utils.showToast('$_url 无法打开高德地图');
    }
  }

  void _openBrower() async {
    final Uri _url = Uri.parse('https://flutter.cn');
    // Future<bool> Future 和 async-await 介绍： https://dart.cn/tutorials/language/futures
    bool _bool = await launchUrl(_url);
    if (!_bool) {
      // throw '$_url 无法加载';
      Utils.showToast('$_url 无法加载');
    }
  }

  void _openOtherApp(url) async {
    final Uri _url = Uri.parse(url);
    // Future<bool> Future 和 async-await 介绍： https://dart.cn/tutorials/language/futures
    bool _bool = await launchUrl(_url);
    if (!_bool) {
      // throw '$_url 无法打开该app';
      Utils.showToast('$_url 无法打开该app');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlatButton(
                onPressed: _call,
                color: const Color.fromARGB(255, 23, 219, 124),
                child: const Text("打电话")),
            const SizedBox(height: 20),
            FlatButton(
              onPressed: _message,
              child: const Text("发短信"),
              color: const Color.fromARGB(255, 23, 219, 124),
            ),
            FlatButton(
              onPressed: _email,
              child: const Text("发邮件"),
              color: const Color.fromARGB(255, 23, 219, 124),
            ),
            FlatButton(
              onPressed: _openMapApp,
              child: const Text("打开高德地图定位"),
              color: const Color.fromARGB(255, 23, 219, 124),
            ),
            FlatButton(
              onPressed: _openBrower,
              child: const Text("打开外部浏览器"),
              color: const Color.fromARGB(255, 23, 219, 124),
            ),
            // 常见第三方app的链接： https://zhuanlan.zhihu.com/p/399646856
            FlatButton(
              onPressed: () {
                _openOtherApp('weixin://');
              },
              child: const Text("打开微信"),
              color: const Color.fromARGB(255, 23, 219, 124),
            ),
            FlatButton(
              onPressed: () {
                _openOtherApp('alipays://');
              },
              child: const Text("打开支付宝"),
              color: const Color.fromARGB(255, 23, 219, 124),
            ),
            FlatButton(
              onPressed: () {
                _openOtherApp('alipayqr://platformapi/startapp?saId=10000007');
              },
              child: const Text("打开支付宝扫码"),
              color: const Color.fromARGB(255, 23, 219, 124),
            ),
          ],
        ),
      ),
    );
  }

  // @override
  // void dispose() {
  //   // ignore: avoid_print
  //   print("销毁 dispose");

  //   super.dispose();
  // }
}
