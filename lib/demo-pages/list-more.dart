// ignore_for_file: file_names

import 'package:flutter/material.dart';
import '../http/apis/demo.dart';

class ListMore extends StatefulWidget {
  const ListMore({Key? key}) : super(key: key);

  @override
  State<ListMore> createState() => _MidState();
}

class _MidState extends State<ListMore> {
  // 当前页数
  late int _page = 1;

  // 页面数据
  final List _list = [];

  // 是否还有
  bool _hasMore = true;

  // 滚动控制器
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    _getData();

    _scrollController.addListener(() {
      // 获取滚动条下拉的距离
      // ignore: avoid_print
      // print(_scrollController.position.pixels);
      // 获取整个页面的高度
      // ignore: avoid_print
      // print(_scrollController.position.maxScrollExtent);
      if (_scrollController.position.pixels >
          _scrollController.position.maxScrollExtent - 20) {
        _getData();
      }
    });
  }

  // 数据指定类型后面加 ? 表示该值可以为 null;
  void _getData({bool isRefresh = false}) async {
    if (_hasMore) {
      var result = await DemoApi.getAppapi(_page);
      var list = result['result'];
      // ignore: avoid_print
      // print(list);
      setState(() {
        if (isRefresh) {
          _list.insertAll(0, list);
        } else {
          _list.addAll(list);
        }
        _page++;
      });

      if (list.length < 20) {
        setState(() {
          _hasMore = false;
        });
      }
    }
  }

  // 下拉刷新
  Future<void> _onRefresh() async {
    // 持续一秒
    await Future.delayed(const Duration(milliseconds: 1000), () {
      _getData(isRefresh: true);
    });
  }

  // 加载动画
  Widget _getMoreWidget() {
    if (_hasMore) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Text(
                '加载中',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black45,
                ),
              ),
              SizedBox(
                width: 15,
              ),
              SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 1,
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return const Center(
        child: Text('没有更多了...'),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('列表刷新加载'),
      ),
      // ignore: prefer_is_empty
      body: _list.length == 0
          ? _getMoreWidget()
          : RefreshIndicator(
              onRefresh: _onRefresh,
              child: ListView.builder(
                controller: _scrollController,
                itemCount: _list.length,
                itemBuilder: (context, index) {
                  Widget tip = const Text('');
                  if (index == _list.length - 1) {
                    tip = _getMoreWidget();
                  }
                  return Column(
                    children: [
                      ListTile(
                        title: Text(
                          '${_list[index]["title"]}',
                          maxLines: 2,
                        ),
                      ),
                      const Divider(),
                      tip,
                    ],
                  );
                },
              ),
            ),
    );
  }
}
