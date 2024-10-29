// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:qr_flutter/qr_flutter.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:ui' as ui;
import 'package:barcode_scan2/barcode_scan2.dart';

import '/components/m-widget.dart';
import '/utils/utils.dart';
import '/components/webview.dart';

class QrCode extends StatefulWidget {
  final String title;

  const QrCode({Key? key, this.title = '二维码'}) : super(key: key);

  @override
  State<QrCode> createState() => _MidState();
}

class _MidState extends State<QrCode> {
  final GlobalKey _globalKey = GlobalKey();

  //现在的时间
  final _currentTime = DateTime.now().hour;
  var _scanMsg = '';
  //控制闪光灯
  bool? flashLigh = true;

  @override
  void initState() {
    super.initState();
    //如果早上7至晚上19点，闪光灯默认关闭
    if (_currentTime >= 7 && _currentTime <= 19) {
      setState(() {
        flashLigh = false;
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(widget.title)),
        body: Scrollbar(
          // ignore: sized_box_for_whitespace
          child: Container(
            // double.infinity 占满屏幕
            width: double.infinity,
            child: SingleChildScrollView(
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('普通二维码'),
                    QrImage(
                      data: 'This is a simple QR code',
                      version: QrVersions.auto,
                      size: 120,
                      gapless: false,
                    ),
                    const Text('带中间loge的二维码，并且可以下载'),
                    MWidget.textButton('下载', pressedCallbak: () async {
                      //检查是否有存储权限
                      var status = await Permission.storage.status;
                      if (!status.isGranted) {
                        status = await Permission.storage.request();
                        Utils.showToast("没有保存图片权限");
                        return;
                      }

                      RenderRepaintBoundary? boundary =
                          _globalKey.currentContext?.findRenderObject()!
                              as RenderRepaintBoundary;
                      ui.Image image = await boundary.toImage(pixelRatio: 3.0);
                      ByteData? byteData = await image.toByteData(
                          format: ui.ImageByteFormat.png);
                      final result = await ImageGallerySaver.saveImage(
                          byteData!.buffer.asUint8List(),
                          quality: 100,
                          name: 'boss_Image' +
                              DateTime.now().toString() +
                              '.jpeg');
                      if (result['isSuccess']) {
                        Utils.showToast("保存成功");
                      } else {
                        Utils.showToast("保存失败");
                      }
                    }),
                    RepaintBoundary(
                      key: _globalKey,
                      // 生成二维码图片外面需要包一个 Container，否则无法下载
                      child: Container(
                          color: Colors.white,
                          width: 120,
                          height: 120,
                          child: QrImage(
                            data: 'https://weixin.qq.com/',
                            version: QrVersions.auto,
                            size: 120,
                            gapless: false,
                            embeddedImage: const AssetImage('assets/images/wx.png'),
                            embeddedImageStyle: QrEmbeddedImageStyle(
                              size: const Size(40, 40),
                              color: Colors.green,
                            ),
                          )),
                    ),
                    MWidget.textButton("扫描二维码", pressedCallbak: () async {
                      //ScanOptions设置闪光灯和前后摄像头
                      var options = ScanOptions(
                          autoEnableFlash: flashLigh!,
                          strings: {
                            'cancel': '取消',
                            'flash_on': '闪光灯开/关',
                            'flash_off': '闪光灯开/关'
                          });
                      //返回扫描的参数
                      var result = await BarcodeScanner.scan(options: options);
                      //扫描返回值的类型
                      // print(result.type);
                      // //返回参数
                      // print(result.rawContent);
                      // //格式
                      // print(result.format);
                      setState(() {
                        _scanMsg =
                            '扫描返回值的类型:${result.type},返回参数:${result.rawContent},格式:${result.format},';
                      });
                      // 如果返回的参数是http,https的网站，则用webview打开
                      if (result.rawContent.startsWith('http://') ||
                          result.rawContent.startsWith('https://')) {
                        Navigator.push(context,
                            CupertinoPageRoute(builder: (context) {
                          return WebviewBox(
                              title: result.rawContent, url: result.rawContent);
                        }));
                      }
                    }),
                    Text('扫描结果$_scanMsg')
                  ],
                )),
          ),
        ));
  }
}
