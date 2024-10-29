import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';

class Ceiling extends StatefulWidget {
  const Ceiling({Key? key}) : super(key: key);

  @override
  State<Ceiling> createState() => _MidState();
}

class _MidState extends State<Ceiling> with SingleTickerProviderStateMixin {
  late ScrollController _scrollViewController;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _scrollViewController = ScrollController(initialScrollOffset: 0.0);
    _tabController = TabController(vsync: this, length: 3);
  }

  @override
  void dispose() {
    super.dispose();
    _scrollViewController.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text('吸顶效果'),backgroundColor: Colors.red,),
      body: NestedScrollView(
        controller: _scrollViewController,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              pinned: true,
              floating: true,
              expandedHeight: 300, // 滚动高度多少之后，下面部分处于吸附状态
              foregroundColor: Colors.white, // 返回按钮颜色
              backgroundColor: Colors.red, // 滚动吸顶颜色
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.pin,
                background: Container(
                  //头部整个背景颜色
                  height: double.infinity,
                  color: Colors.white,
                  child: Column(
                    children: <Widget>[
                      _buildBanner(),
                      _buildButtons(),
                      _buildTabBarBg(),
                    ],
                  ),
                ),
              ),
              bottom: TabBar(
                controller: _tabController,
                labelColor: Colors.white,
                indicatorColor: Colors.white,
                unselectedLabelColor: Colors.black87,
                tabs: const [
                  Tab(text: "aaa"),
                  Tab(text: "bbb"),
                  Tab(text: "ccc"),
                ],
              ),
            )
          ];
        },
        body: TabBarView(
          controller: _tabController,
          children: [
            _buildListView("aaa:"),
            _buildListView("bbb:"),
            _buildListView("ccc:"),
          ],
        ),
      ),
    );
  }

  Widget _buildBanner() {
    return Container(
      margin: const EdgeInsets.only(left: 0.0, right: 0.0, top: 0.0),
      height: 180,
      child: Swiper(
        //第三方的banner库：flutter_swiper
        itemBuilder: (BuildContext context, int index) {
          return SizedBox(
            width: double.infinity,
            height: 180,
            child: Image.network(
              "https://img.zcool.cn/community/0108e55c8cae00a801214168a20753.jpg@1280w_1l_2o_100sh.jpg",
              height: double.infinity,
              fit: BoxFit.fill,
            ),
          );
        },
        itemCount: 3,
        scale: 0.9,
        pagination: const SwiperPagination(),
      ),
    );
  }

  //banner下面的按钮
  Widget _buildButtons() {
    return Expanded(
      child: Row(
        children: <Widget>[
          _buildButtonItem(Icons.chat, "xxxx"),
          _buildButtonItem(Icons.pages, "xxxx"),
          _buildButtonItem(Icons.phone_android, "xxxx"),
          _buildButtonItem(Icons.print, "xxxx"),
        ],
      ),
    );
  }

  Widget _buildButtonItem(IconData icon, String text) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(icon, size: 28.0),
          Container(
            margin: const EdgeInsets.only(top: 8.0),
            child: Text(
              text,
              style: const TextStyle(
                color: Color(0xff999999),
                fontSize: 12,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildTabBarBg() {
    return SizedBox(
      //TabBar圆角背景颜色
      height: 50,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(0),
          topRight: Radius.circular(0),
        ),
        child: Container(
          color: const Color.fromARGB(255, 86, 56, 236),
        ),
      ),
    );
  }

  Widget _buildListView(String s) {
    return ListView.separated(
      itemCount: 20,
      separatorBuilder: (BuildContext context, int index) => const Divider(
        color: Colors.grey,
        height: 1,
      ),
      itemBuilder: (BuildContext context, int index) {
        return Container(
          color: Colors.white,
          child: ListTile(
            title: Text("$s第$index 个条目"),
          ),
        );
      },
    );
  }
}
