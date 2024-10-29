import 'package:flutter/material.dart';
import '../components/m-widget.dart';

class TabBox extends StatefulWidget {
  const TabBox({Key? key}) : super(key: key);

  @override
  State<TabBox> createState() => _MidState();
}

class _MidState extends State<TabBox> with TickerProviderStateMixin {
  late TabController _tabController;
  List _tabs = [
    '北京',
    '上海',
    '深圳',
    '湖南',
    '广东',
  ];
  List<Widget> _tabPage = [
    // ignore: sized_box_for_whitespace
    Column(
      children: const [
        Text(
          '北京页',
          style: TextStyle(
            fontSize: 30,
          ),
        ),
      ],
    ),
    const SizedBox(
      child: Text(
        '上海页',
        style: TextStyle(
          fontSize: 30,
        ),
      ),
    ),
    const SizedBox(
      child: Text(
        '深圳页',
        style: TextStyle(
          fontSize: 30,
        ),
      ),
    ),
    const SizedBox(
      child: Text(
        '湖南页',
        style: TextStyle(
          fontSize: 30,
        ),
      ),
    ),
    const SizedBox(
      child: Text(
        '广东页',
        style: TextStyle(
          fontSize: 30,
        ),
      ),
    ),
  ];

  @override
  void initState() {
    super.initState();

    _tabController = TabController(
      length: _tabs.length,
      vsync: this,
      initialIndex: 0,
    );

    _tabController.addListener(() {
      //点击tab回调一次，滑动切换tab不会回调
      if (_tabController.indexIsChanging) {
        // ignore: avoid_print
        // print("滑动切换页面：${_tabController.index}");
      }

      //点击tab时或滑动tab回调一次
      if (_tabController.index.toDouble() == _tabController.animation?.value) {
        // ignore: avoid_print
        // print("tab切换页面：${_tabController.index}");
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('tab页面'),
      ),
      body: Column(
        children: [
          MWidget.textButton(
            '更新tabbar个数',
            pressedCallbak: () {
              setState(() {
                _tabs = ['北京', '上海', '深圳'];
                _tabPage = [
                  const Center(child: Text('北京页')),
                  const Center(child: Text('上海页')),
                  const Center(child: Text('深圳页')),
                ];
                _tabController = TabController(
                  length: _tabs.length,
                  vsync: this,
                );
                _tabController.animateTo(0);
              });
            },
          ),
          TabBar(
            controller: _tabController,
            isScrollable: true,
            tabs: _tabs.map((e) {
              return Center(
                child: Text(
                  e,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                  ),
                ),
              );
            }).toList(),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: _tabPage.map((e) {
                return e;
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
