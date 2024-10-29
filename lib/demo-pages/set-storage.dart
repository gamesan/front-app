// ignore_for_file: file_names

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../components/m-widget.dart';
import '../utils/utils.dart';

class SetStorage extends StatefulWidget {
  const SetStorage({Key? key}) : super(key: key);

  @override
  State<SetStorage> createState() => _MidState();
}

class _MidState extends State<SetStorage> {
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _nameController.text = '';
    _ageController.text = '';
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('数据存储')),
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              MWidget.textButton('存字符串数据', pressedCallbak: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                await prefs.setString('string', '数字类型');
                Utils.showToast('储存成功');
              }),
              MWidget.textButton('存数字数据', pressedCallbak: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                await prefs.setInt('counter', 10);
                Utils.showToast('储存成功');
              }),
              MWidget.textButton('存bool数据', pressedCallbak: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                await prefs.setBool('bool', true);
                Utils.showToast('储存成功');
              }),
              MWidget.textButton('将Map数据转换成字符串存储', pressedCallbak: () async {
                Map userinfo = {
                  'username': 'aaa',
                  'mobile': '13459483782',
                  'list': [{'num': 1}, {'num': 2}, {'num': 3}]
                };
                SharedPreferences prefs = await SharedPreferences.getInstance();
                await prefs.setString('user_info', json.encode(userinfo));
                Utils.showToast('储存成功');
              }),
              Container(
                color: Colors.grey[300],
                height: 10,
              ),
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(
                    hintText: "请输入姓名：", border: OutlineInputBorder()),
              ),
              TextField(
                controller: _ageController,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly, //数字，只能是整数
                  // FilteringTextInputFormatter.allow(RegExp("[0-9.]")), //数字包括小数
                  // FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]")), //只允许输入字母
                ],
                decoration: const InputDecoration(
                    hintText: "请输入年龄：", border: OutlineInputBorder()),
              ),
              MWidget.textButton('存储文档数据', pressedCallbak: () {
                Map data = {
                  'name': _nameController.text,
                  'age': int.parse(_ageController.text)
                };

                Utils.writeData(data);
                Utils.showToast('储存成功');
              }),
            ],
          ),
        ),
      ),
    );
  }
}
