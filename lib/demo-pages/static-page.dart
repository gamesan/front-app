// ignore_for_file: file_names

import 'package:flutter/material.dart';

class StaticPage extends StatelessWidget {
  const StaticPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('无状态页面'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 12, 152, 68),
        actions: [
          IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    barrierDismissible: false, // 默认为 true， 控制是否点击空白区域是否关闭弹窗
                    builder: (context) {
                      return AlertDialog(
                        title: const Text("提示"),
                        content: const Text("点击了添加按钮"),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text("关闭"))
                        ],
                      );
                    });
              },
              icon: const Icon(Icons.add)),
          TextButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text("提示"),
                        content: const Text("点击了文字按钮"),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text("关闭"))
                        ],
                      );
                    });
              },
              child: const Text(
                "按钮",
                style: TextStyle(
                    color: Color.fromARGB(255, 254, 254, 254), fontSize: 20),
              ))
        ],
      ),

      //弹性布局，居中分布
      body: Center(
        child: Column(
          children: const [
            Text(
              '不变的页面。AppBar的文案居中，背景颜色改变',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
