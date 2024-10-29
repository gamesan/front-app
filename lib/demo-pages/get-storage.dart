// ignore_for_file: file_names


import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../components/m-widget.dart';
import '../utils/utils.dart';

class GetStorage extends StatefulWidget {
  const GetStorage({Key? key}) : super(key: key);

  @override
  State<GetStorage> createState() => _MidState();
}

class _MidState extends State<GetStorage> {
  dynamic _str;
  dynamic _counter;
  dynamic _bool;

  dynamic _name;
  dynamic _age;

  Future<void> _getStore(Function callback) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    callback(prefs);
  }

  @override
  void initState() {
    super.initState();

    _getStore((prefs) {
      setState(() {
        _str = prefs.getString('string');
        _counter = prefs.getInt('counter');
        _bool = prefs.getBool('bool');
      });
    });

    // Map data = Utils.readData() as Map;
    // // ignore: avoid_print
    // print(data);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('获取存储数据')),
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text('存储的字符串是：$_str，数据类型：${_str.runtimeType}'),
              Text(
                  '存储的数字是：${_counter.toString()}，数据类型：${_counter.runtimeType}'),
              Text('存储的bool值是：${_bool.toString()}，数据类型：${_bool.runtimeType}'),
              MWidget.textButton('获取user_info数据', pressedCallbak: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                String? str = prefs.getString('user_info');
                if (str == null) {
                  Utils.showToast('user_info数据为空');
                  return;
                }
                Map map = json.decode(str);
                Utils.showToast('user_info字符串是：$str；username是；${map["username"]}；mobile是；${map["mobile"]}');
              }),
              MWidget.textButton('删除存储数据', pressedCallbak: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.remove('string');
                prefs.remove('counter');
                prefs.remove('bool');
                prefs.remove('user_info');
              }),
              MWidget.textButton('获取文件数据', pressedCallbak: () {
                Utils.readData((data) {
                  // print(data);
                  setState(() {
                    _name = data['name'];
                    _age = data['age'];
                  });
                });
              }),
              Text('姓名：$_name；年龄：$_age')
            ],
          ),
        ),
      ),
    );
  }
}
