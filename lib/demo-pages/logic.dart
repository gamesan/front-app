// ignore_for_file: file_names, deprecated_member_use

import 'package:flutter/material.dart';

// class类的arguments 是 key: value 型，且写在构造函数中 ； class类中的方法有返回值，方法中的 arguments 如果不是Map类型，可以不写key: value

class Logic extends StatefulWidget {
  final String title;

  const Logic({Key? key, this.title = '逻辑页面'}) : super(key: key);

  @override
  State<Logic> createState() => _MidState();
}

class _MidState extends State<Logic> {
  bool _bool = true;

  void _changeBool() {
    setState(() {
      _bool = !_bool;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),

      //弹性布局，居中分布
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlatButton(
              onPressed: _changeBool,
              child: Text(_bool ? '转换成状态二' : '转换成状态一'),
              color: const Color.fromRGBO(176, 174, 180, 1),
            ),
            // Container组件相当于div标签
            Container(
              margin: const EdgeInsets.fromLTRB(20, 20, 20, 20),
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              width: 150,
              // height: 70,
              // color: Colors.yellow,  // color 属性和 decoration 属性不能同时出现
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(width: 2, color: Colors.blue),
                borderRadius: const BorderRadius.all(Radius.circular(20)),
              ),
              child: _bool
                  ? const Text(
                      '状态一',
                      style: TextStyle(
                        color: Color.fromRGBO(12, 12, 12, 1),
                        fontSize: 30,
                        height: 1.5,
                        wordSpacing: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  : const Text(
                      '状态二',
                      style: TextStyle(
                        color: Color.fromRGBO(200, 43, 43, 1),
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
