// ignore_for_file: file_names, deprecated_member_use

import 'package:flutter/material.dart';

class StateWidgetComplex extends StatelessWidget {
  const StateWidgetComplex({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const _MidWidget(title: 'state-widget');
  }
}

class _MidWidget extends StatefulWidget {
  final String title;

  const _MidWidget({Key? key, required this.title}) : super(key: key);

  @override
  State<_MidWidget> createState() => _MidState();
}

class _MidState extends State<_MidWidget> {
  int _num = 0;

  void _addNum() {
    setState(() {
      var num = _num + 1;
      _num = num;
    });
  }

  void _reduceNum() {
    setState(() {
      var num = _num - 1;
      if (num < 0) num = 0;
      _num = num;
    });
  }

  @override
  void initState() {
    super.initState();
    // ignore: avoid_print
    print("初始化 initState");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),

      // 弹性布局，从上往下布局
      // body: Column(
      //   children: [
      //     Text(
      //       '$_num',
      //       style: const TextStyle(
      //         color: Color.fromRGBO(12, 12, 12, 1),
      //         fontSize: 30,
      //         fontWeight: FontWeight.bold,
      //       ),
      //     ),
      //     FlatButton(
      //       onPressed: _addNum,
      //       child: const Icon(
      //         Icons.add,
      //         color: Color.fromRGBO(227, 5, 5, 1),
      //       ),
      //       color: const Color.fromRGBO(33, 7, 99, 1),
      //     ),
      //     FlatButton(
      //       onPressed: _reduceNum,
      //       child: const Icon(
      //         Icons.remove,
      //         color: Color.fromRGBO(1, 1, 1, 1),
      //       ),
      //       color: const Color.fromRGBO(45, 224, 78, 1),
      //     ),
      //   ],
      // ),

      //弹性布局，居中分布
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$_num',
              style: const TextStyle(
                color: Color.fromRGBO(12, 12, 12, 1),
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            FlatButton(
              onPressed: _addNum,
              child: const Icon(
                Icons.add,
                color: Color.fromRGBO(227, 5, 5, 1),
              ),
              color: const Color.fromRGBO(33, 7, 99, 1),
            ),
            FlatButton(
              onPressed: _reduceNum,
              child: const Icon(
                Icons.remove,
                color: Color.fromRGBO(1, 1, 1, 1),
              ),
              color: const Color.fromRGBO(45, 224, 78, 1),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // ignore: avoid_print
    print("销毁 dispose");

    super.dispose();
  }
}
