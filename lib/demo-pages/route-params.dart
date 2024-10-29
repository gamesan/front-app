// ignore_for_file: file_names

import 'package:flutter/material.dart';


class RouteParams extends StatefulWidget {
  final String title;
  // ignore: prefer_typing_uninitialized_variables
  final arguments;
  
  const RouteParams({Key? key, this.title = '测试路由传参', this.arguments}) : super(key: key);

  @override
  State<RouteParams> createState() => _MidState();
}

class _MidState extends State<RouteParams> {

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Text('返回'),
        onPressed:() {
          Navigator.pop(context);
        },
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('姓名：${widget.arguments['name']}'),
          Text('年龄：${widget.arguments['age']}'),
        ],
      ),
    );
  }
}