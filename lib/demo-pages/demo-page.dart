// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: deprecated_member_use, file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'weather.dart';
import 'route-params.dart';
import 'state-page.dart';
import 'static-page.dart';
import 'logic.dart';

class DemoPage extends StatelessWidget {
  const DemoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const _MidWidget(title: '案例');
  }
}

class _MidWidget extends StatefulWidget {
  final String title;

  const _MidWidget({Key? key, required this.title}) : super(key: key);

  @override
  State<_MidWidget> createState() => _MidState();
}

class _MidState extends State<_MidWidget> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            RaisedButton(
              child: const Text('天气请求接口页面'),
              color: const Color.fromRGBO(14, 184, 48, 1),
              onPressed: () {
                Navigator.push(
                  context,

                  // 底部滑入切换路由
                  // MaterialPageRoute(builder: (context) => const Weather()),

                  // 右侧滑入切换路由
                  CupertinoPageRoute(builder: (context) => const Weather()),
                );
              },
            ),
            FlatButton(
              onPressed: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(builder: (context) {
                    var params = {'name': '张三', 'age': 35};
                    return RouteParams(arguments: params);
                  }),
                );
              },
              color: const Color.fromRGBO(249, 29, 161, 1),
              child: const Text('路由传参'),
            ),
            FlatButton(
              onPressed: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(builder: (context) => const StaticPage()),
                );
              },
              color: const Color.fromRGBO(249, 29, 161, 1),
              child: const Text('静态页面'),
            ),
            FlatButton(
              onPressed: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(builder: (context) => const StatePage(title: 'state-widget')),
                );
              },
              color: const Color.fromRGBO(249, 29, 161, 1),
              child: const Text('动态交互页面'),
            ),
            FlatButton(
              onPressed: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(builder: (context) => const Logic()),
                );
              },
              color: const Color.fromRGBO(249, 29, 161, 1),
              child: const Text('逻辑页面'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
