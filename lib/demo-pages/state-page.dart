// ignore_for_file: file_names, deprecated_member_use

import 'package:flutter/material.dart';
import '../components/gridview.dart';

class StatePage extends StatefulWidget {
  final String title;

  const StatePage({Key? key, required this.title}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<StatePage> createState() => _MidState();
}

class _MidState extends State<StatePage> {
  int _num = 0;

  final List<Map> _gridList = [
    {
      'imgUrl':
          'https://tse1-mm.cn.bing.net/th/id/OIP-C.nfC2tVNM9TgwQ5QuqECd6wHaFj?pid=ImgDet&rs=1',
      'title': '人找车'
    },
    {
      'imgUrl':
          'https://tse1-mm.cn.bing.net/th/id/OIP-C.nfC2tVNM9TgwQ5QuqECd6wHaFj?pid=ImgDet&rs=1',
      'title': '人找车'
    },
    {
      'imgUrl':
          'https://tse1-mm.cn.bing.net/th/id/OIP-C.nfC2tVNM9TgwQ5QuqECd6wHaFj?pid=ImgDet&rs=1',
      'title': '人找车'
    },
    {
      'imgUrl':
          'https://tse1-mm.cn.bing.net/th/id/OIP-C.nfC2tVNM9TgwQ5QuqECd6wHaFj?pid=ImgDet&rs=1',
      'title': '人找车'
    },
  ];

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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: ListView(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
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
          const Divider(
            height: 10,
            indent: 0,
            color: Colors.black54,
          ),
          const Text('定位布局'),
          Stack(
            children: [
              Container(
                height: 200,
                // width: 200,
                color: Colors.yellow,
              ),
              const Positioned(
                child: Icon(Icons.home, size: 40, color: Colors.white),
                left: 0,
                top: 0,
              ),
              const Positioned(
                child: Icon(Icons.search, size: 40, color: Colors.pink),
                left: 0.4,
              ),
              const Positioned(
                child: Icon(Icons.settings, size: 40, color: Colors.blue),
                bottom: 1,
              ),
            ],
            alignment: Alignment.center,
          ),
          const Divider(
            height: 10,
            indent: 0,
            color: Colors.black54,
          ),
          const Text('GridView使用，每行固定数量，多列展示网格布局'),
          SizedBox(
            height: 300,
            width: MediaQuery.of(context).size.width,
            child: MGridView(
                list: _gridList,
                buildGridItem: (context, index) {
                  return SizedBox(
                    // height: 20,
                    // color: Colors.yellow,
                    child: Column(
                      children: [
                        Image.network(
                          _gridList[index]['imgUrl'],
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                        Text(_gridList[index]['title']),
                      ],
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
