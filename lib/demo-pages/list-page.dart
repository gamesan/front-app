// ignore_for_file: file_names, deprecated_member_use

import 'package:flutter/material.dart';
import '/utils/utils.dart';
import '/components/full-image.dart';

// class类的arguments 是 key: value 型，且写在构造函数中 ； class类中的方法有返回值，方法中的 arguments 如果不是Map类型，可以不写key: value

class ListPage extends StatefulWidget {
  final String title;

  const ListPage({Key? key, this.title = '列表页面'}) : super(key: key);

  @override
  State<ListPage> createState() => _MidState();
}

class _MidState extends State<ListPage> {
  Widget _itemBuilder(BuildContext context, int index) {
    return Column(children: <Widget>[
      // Image.network(posts[index].url),
      // InkWell 包裹的组件可以添加点击事件
      InkWell(
        child: Image.network(posts[index].url),
        onDoubleTap: () {
          FullImage(url: posts[index].url, context: context).build();
        },
        onLongPress: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text("提示"),
                  content: const Text("是否下载图片"),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Utils.saveImage(posts[index].url);
                          Navigator.pop(context);
                        },
                        child: const Text("确定")),
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text("取消",
                            style: TextStyle(color: Colors.grey)))
                  ],
                );
              });
        },
      ),
      Text(posts[index].title)
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(widget.title)),
        body: ListView.builder(
            itemCount: posts.length, itemBuilder: _itemBuilder));
  }
}

// 列表案例 https://www.jianshu.com/p/460b2cb24a37

class _Post {
  final String title;
  final String url;

  const _Post({required this.title, required this.url});
}

final List<_Post> posts = [
  const _Post(
    title: '疯狂动物城',
    url: 'http://img5.mtime.cn/mt/2018/10/22/104316.77318635_180X260X4.jpg',
  ),
  const _Post(
    title: '中国蓝盔',
    url: 'http://img5.mtime.cn/mt/2018/10/10/112514.30587089_180X260X4.jpg',
  ),
  const _Post(
    title: '克隆人',
    url: 'http://img5.mtime.cn/mt/2018/11/13/093605.61422332_180X260X4.jpg',
  ),
  const _Post(
    title: '龙猫',
    url: 'http://img5.mtime.cn/mt/2018/11/07/092515.55805319_180X260X4.jpg',
  ),
  const _Post(
    title: '恐怖快递',
    url: 'http://img5.mtime.cn/mt/2018/11/21/090246.16772408_135X190X4.jpg',
  ),
];
