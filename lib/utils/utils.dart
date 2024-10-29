// ignore_for_file: file_names
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// 参考文档
// https://blog.csdn.net/bu_wangchuxin/article/details/124381062

class Utils {
  // 加 static 关键字，外部调用 SaveImageUtils 类下的方法时不需要使用 SaveImageUtils().saveImage(...)，只需要 SaveImageUtils.saveImage(...)
  static Future<void> saveImage(String url, {int quality = 100}) async {
    // 判断有无文件读写权限
    Map<Permission, PermissionStatus> statuses = await [
      Permission.storage,
    ].request();
    final info = statuses[Permission.storage].toString();
    // print(info);
    if (info == 'PermissionStatus.granted') {
      // 有文件读写权限
      var response = await Dio()
          .get(url, options: Options(responseType: ResponseType.bytes));
      final result = await ImageGallerySaver.saveImage(
        Uint8List.fromList(response.data),
        quality: quality,
        // name: 'hello'
      );
      // print(result);
      if (result['isSuccess']) {
        showToast('下载图片成功');
      } else {
        showToast('下载图片失败');
      }
    } else {
      showToast('没有保存图片权限');
    }
  }

  // 吐司
  static void showToast(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        fontSize: 14,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: const Color.fromARGB(255, 202, 203, 203),
        timeInSecForIosWeb: 1,
        textColor: Colors.black);
  }

  // 找到路径
  static Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  // 创建文件，对文件引用
  static Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/storage.txt');
  }

  // 写入数据。加 Future 表示为异步，返回值在 then 内，或者需要加 await；
  static Future<File> writeData(Map data) async {
    final file = await _localFile;
    return file.writeAsString(json.encode(data));
  }

  // 读取数据
  static readData(Function sucback, {Function? errback}) async {
    try {
      final file = await _localFile;
      String contents = await file.readAsString();

      sucback(json.decode(contents));
    } catch (e) {
      if (errback != null) {
        errback(e);
      }
    }
  }

  // 头部时间日期的状态栏高度的组件
  static Widget topStatusbar() {
    return Container(
      color: Colors.transparent,
      height: MediaQueryData.fromWindow(window).padding.top,
    );
  }

  static Future<void> setSharedMapStringData(String key, Map mapData) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString(key, json.encode(mapData));
  }

  static Future<Map> getSharedMapStringData(String key) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? str = pref.getString(key);
    if (str == null) {
      return {};
    }
    return json.decode(str);
  }

  static Future<void> removeSharedMapStringData(String key) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.remove(key);
  }
}
