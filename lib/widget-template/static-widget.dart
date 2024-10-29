// ignore_for_file: file_names

import 'package:flutter/material.dart';

class StaticWidget extends StatelessWidget {
  const StaticWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('static-widget')),

      // 弹性布局，从上往下布局
      body: Column(
        children: const [],
      ),

      //弹性布局，居中分布
      // body: Center(
      //   child: Column(
      //     children: const [],
      //   ),
      // ),
    );
  }
}