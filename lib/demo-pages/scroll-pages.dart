// ignore_for_file: file_names, deprecated_member_use

import 'package:flutter/material.dart';

class ScrollPage extends StatefulWidget {
  final String title;

  const ScrollPage({Key? key, this.title = '滚动页面'})
      : super(key: key);

  // @override
  // State<StatefulWidget> createState() {
  //   throw UnimplementedError();
  // }
  @override
  State<ScrollPage> createState() => _MidState();
}

class _MidState extends State<ScrollPage> {
  // @override
  // Widget build(BuildContext context) {
  //   throw UnimplementedError();
  // }
  int _num = 0;

  late ScrollController _hoScrollController;
  late ScrollController _veScrollController;

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

    _hoScrollController = ScrollController();
    _veScrollController = ScrollController();

    _hoScrollController.addListener(() {
      // ignore: avoid_print
      print('_hoScrollController:${_hoScrollController.offset}');
    });

    _veScrollController.addListener(() {
      // ignore: avoid_print
      print('_veScrollController:${_veScrollController.offset}');
    });
  }

  @override
  void dispose() {
    // ignore: avoid_print
    print("销毁 dispose");
    super.dispose();

    _hoScrollController.dispose();
    _veScrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: SizedBox(
        width: double.infinity, // 占满全屏
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(1),
          controller: _veScrollController,
          child: Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal, // 横向滚动 Axis.horizontal ； 纵向滚动 Axis.vertical
                // reverse: true, // true 时 可视区显示最后面的
                controller: _hoScrollController,
                child: Row(
                  children: [
                    '1',
                    '2',
                    '3',
                    '4',
                    '5',
                    '6',
                    '7',
                    '8',
                    '9',
                    '10',
                    '11'
                  ].map((item) {
                    return TextButton(child: Text(item), onPressed: () {});
                  }).toList(),
                ),
              ),
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
              Container(
                height: 2000,
                color: Colors.grey[300],
              ),
              const Text('到底了'),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _hoScrollController.jumpTo(_hoScrollController.position.minScrollExtent);
          _veScrollController.jumpTo(_veScrollController.position.minScrollExtent);
        },
        tooltip: 'Increment',
        child: const Icon(Icons.arrow_upward),
      ),
    );
  }
}
