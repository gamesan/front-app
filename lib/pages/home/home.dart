// ignore_for_file: file_names, deprecated_member_use

import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:card_swiper/card_swiper.dart';

// 显示底部栏插件（隐藏顶部状态栏）
// import 'package:flutter/services.dart';

import '/components/webview.dart';
import '/utils/utils.dart';

class Home extends StatefulWidget {
  final String title;

  const Home({Key? key, this.title = '首页2'}) : super(key: key);

  @override
  State<Home> createState() => _MidState();
}

class _MidState extends State<Home> {
  final _conMargin = 10.0;
  final double _with = MediaQueryData.fromWindow(window).size.width;
  final double _height = MediaQueryData.fromWindow(window).size.height;
  late double _windowWidth;

  void _showNetType() {
    Connectivity().onConnectivityChanged.listen((event) {
      String type = '';
      if (event == ConnectivityResult.mobile) {
        type = '移动网络';
      } else if (event == ConnectivityResult.wifi) {
        type = 'wifi网络';
      } else {
        type = '无网络';
      }
      Utils.showToast('链接网络为：$type');
    });
  }

  @override
  void initState() {
    super.initState();

    _showNetType();
    _windowWidth = [_with, _height].reduce(min);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // 显示底部栏（隐藏顶部状态栏）
    // SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);

    // 显示顶部栏（隐藏底部栏）
    // SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top]);

    // 隐藏顶部底部栏
    // SystemChrome.setEnabledSystemUIOverlays([]);

    // 轮播列表
    List<Map> bannerList = [
      {
        "img":
            "https://img.alicdn.com/simba/img/TB1lUZLJVXXXXXtXFXXSutbFXXX.jpg",
        "url":
            "https://pages.tmall.com/wow/a/act/tmall/dailygroup/431/wupr?spm=875.7931836.0.0.66144265CX1geg&wh_pid=daily-198298"
      },
      {
        "img":
            "https://img.alicdn.com/simba/img/TB1lUZLJVXXXXXtXFXXSutbFXXX.jpg",
        "url":
            "https://alimarket.tmall.com/markets/alimama/mingdian?ali_trackid=19_a4dbb2fda0f350cb55c9c33d998fe18f&spm=875.7931836.0.0"
      },
      {
        "img":
            "https://img.alicdn.com/imgextra/i4/6000000004047/O1CN01Y8A3Cu1flZaFyZZft_!!6000000004047-0-alimamazszw.jpg",
        "url":
            "https://alimarket.tmall.com/markets/alimama/mingdian?ali_trackid=19_b525f6d70a41cc12bafc86840987356b&spm=875.7931836.0.0"
      }
    ];

    // 饼型导航列表
    List<Map> pieList1 = [
      {
        "img": "https://m.hao123.com/static/img/logo/logo-2.0.png",
        "color": const Color.fromARGB(255, 47, 217, 118),
        "url": "https://m.hao123.com/"
      },
      {
        "img": "https://hao1.qhimg.com/t015bbdf4bd68f4ed1b.png",
        "color": const Color.fromARGB(255, 9, 207, 92),
        "url": "https://hao.360.com/2022.html"
      },
      {
        "img": "https://upd10.sogoucdn.com/static/sogou/images/logo.png",
        "color": const Color.fromARGB(255, 193, 239, 86),
        "url": "https://123.sogou.com/"
      },
      {
        "img": "https://upd13.sogoucdn.com/static/haoqq/images/logo.png",
        "color": const Color.fromARGB(255, 113, 154, 224),
        "url": "https://hao.qq.com/"
      },
      {
        "img": "https://hao1.qhimg.com/t015bbdf4bd68f4ed1b.png",
        "color": const Color.fromARGB(255, 9, 207, 92),
        "url": "https://hao.360.com/2022.html"
      },
    ];
    List<Map> pieList2 = [
      {
        "img":
            "http://1-im.guokr.com/AmRDJDzcF6DRheBSdzQOVIJiZ2NnSlU9VcSZyjORYDHkAAAAbAAAAFBO.png",
        "color": const Color.fromARGB(255, 180, 211, 89),
        "url": "https://www.guokr.com/"
      },
      {
        "img": "http://guozhivip.com/images/logo.png",
        "color": const Color.fromARGB(255, 220, 220, 97),
        "url": "http://guozhivip.com/"
      },
      {
        "img":
            "https://www-stream.2345cdn.net/dhrest/upload/2022/789fcd784008563cafcaf0b845ccdca8.png",
        "color": const Color.fromARGB(255, 141, 136, 230),
        "url": "https://www.2345.com/"
      },
      {
        "img":
            "https://www.2484.cn/zb_users/theme/suiranx_nav/image/darklogo.png",
        "color": const Color.fromARGB(255, 113, 126, 219),
        "url": "https://www.2484.cn/flurl/wzzx/"
      },
      {
        "img": "http://guozhivip.com/images/logo.png",
        "color": const Color.fromARGB(255, 220, 220, 97),
        "url": "http://guozhivip.com/"
      },
    ];

    Widget _pieItemWidget(String img, Color color, String url) {
      final _pieLineNum = pieList1.length;
      dynamic _pieItemWidth =
          (_windowWidth - (_pieLineNum + 1) * _conMargin) / _pieLineNum;
      return Align(
        alignment: Alignment.center,
        child: InkWell(
          onTap: () {
            Navigator.push(context, CupertinoPageRoute(builder: (context) {
              return WebviewBox(url: url);
            }));
          },
          child: Container(
            width: _pieItemWidth,
            height: _pieItemWidth,
            margin: const EdgeInsets.fromLTRB(0, 0, 10, 6),
            decoration: BoxDecoration(
              // color: Color.fromARGB(255, 15, 137, 66),
              color: color,
              borderRadius:
                  BorderRadius.all(Radius.circular(_pieItemWidth / 2)),
            ),
            child: Center(
              child: Image.network(
                img,
                width: _pieItemWidth * 0.7,
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
        ),
      );
    }

    // 新闻列表
    List<Map> newsList = [
      {
        'imgUrl':
            'https://p6.itc.cn/q_70,c_thumb,w_228,h_148,g_face/images03/20221022/809df8420bcb4faeb8d119dc09d52124.jpg',
        'webUrl':
            'https://m.sohu.com/a/594446116_465270?scm=9010.739864348004122624.0.0.0&spm=smwp.home.fd-onlyu.11.1666401325531m7jUtvv',
        'newCont': '深夜突发！美联储官员发话，美股一夜暴涨750点！黄金大涨，中概股“嗨了”：这家公司暴涨57%',
        'time': '1小时前',
        'nums': '0跟帖',
        'btnUrl': 'https://m.sohu.com/',
      },
      {
        'imgUrl':
            'https://p6.itc.cn/q_70,c_thumb,w_228,h_148,g_face/images03/20221022/809df8420bcb4faeb8d119dc09d52124.jpg',
        'webUrl':
            'https://m.sohu.com/a/594446116_465270?scm=9010.739864348004122624.0.0.0&spm=smwp.home.fd-onlyu.11.1666401325531m7jUtvv',
        'newCont': '深夜突发！美联储官员发话，美股一夜暴涨750点！黄金大涨，中概股“嗨了”：这家公司暴涨57%',
        'time': '1小时前',
        'nums': '0跟帖',
        'btnUrl': 'https://m.sohu.com/',
      },
      {
        'imgUrl':
            'https://p6.itc.cn/q_70,c_thumb,w_228,h_148,g_face/images03/20221022/809df8420bcb4faeb8d119dc09d52124.jpg',
        'webUrl':
            'https://m.sohu.com/a/594446116_465270?scm=9010.739864348004122624.0.0.0&spm=smwp.home.fd-onlyu.11.1666401325531m7jUtvv',
        'newCont': '深夜突发！美联储官员发话，美股一夜暴涨750点！黄金大涨，中概股“嗨了”：这家公司暴涨57%',
        'time': '1小时前',
        'nums': '0跟帖',
        'btnUrl': 'https://m.sohu.com/',
      },
      {
        'imgUrl':
            'https://p6.itc.cn/q_70,c_thumb,w_228,h_148,g_face/images03/20221022/809df8420bcb4faeb8d119dc09d52124.jpg',
        'webUrl':
            'https://m.sohu.com/a/594446116_465270?scm=9010.739864348004122624.0.0.0&spm=smwp.home.fd-onlyu.11.1666401325531m7jUtvv',
        'newCont': '深夜突发！美联储官员发话，美股一夜暴涨750点！黄金大涨，中概股“嗨了”：这家公司暴涨57%',
        'time': '1小时前',
        'nums': '0跟帖',
        'btnUrl': 'https://m.sohu.com/',
      },
      {
        'imgUrl':
            'https://p6.itc.cn/q_70,c_thumb,w_228,h_148,g_face/images03/20221022/809df8420bcb4faeb8d119dc09d52124.jpg',
        'webUrl':
            'https://m.sohu.com/a/594446116_465270?scm=9010.739864348004122624.0.0.0&spm=smwp.home.fd-onlyu.11.1666401325531m7jUtvv',
        'newCont': '深夜突发！美联储官员发话，美股一夜暴涨750点！黄金大涨，中概股“嗨了”：这家公司暴涨57%',
        'time': '1小时前',
        'nums': '0跟帖',
        'btnUrl': 'https://m.sohu.com/',
      },
      {
        'imgUrl':
            'https://p6.itc.cn/q_70,c_thumb,w_228,h_148,g_face/images03/20221022/809df8420bcb4faeb8d119dc09d52124.jpg',
        'webUrl':
            'https://m.sohu.com/a/594446116_465270?scm=9010.739864348004122624.0.0.0&spm=smwp.home.fd-onlyu.11.1666401325531m7jUtvv',
        'newCont': '深夜突发！美联储官员发话，美股一夜暴涨750点！黄金大涨，中概股“嗨了”：这家公司暴涨57%',
        'time': '1小时前',
        'nums': '0跟帖',
        'btnUrl': 'https://m.sohu.com/',
      },
    ];

    Widget _newsItemWidget(webUrl, imgUrl, newCont, time, nums, btnUrl) {
      return InkWell(
        onTap: () {
          Navigator.push(context, CupertinoPageRoute(builder: (context) {
            return WebviewBox(url: webUrl);
          }));
        },
        child: Container(
          margin: EdgeInsets.fromLTRB(_conMargin, 0, _conMargin, 10),
          child: Flex(
            direction: Axis.horizontal,
            children: [
              Expanded(
                flex: 3,
                child: Column(
                  children: [
                    Text(
                      newCont,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 18,
                        height: 1.4,
                      ),
                    ),
                    Flex(
                      direction: Axis.horizontal,
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Text(
                                time,
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                              Container(
                                width: 10,
                              ),
                              Text(
                                nums,
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              )
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(context,
                                CupertinoPageRoute(builder: (context) {
                              return WebviewBox(url: btnUrl);
                            }));
                          },
                          child: Container(
                            padding: const EdgeInsets.fromLTRB(4, 0, 4, 0),
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 1,
                                color: Colors.red,
                              ),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(9),
                              ),
                            ),
                            child: const Text(
                              '点一下',
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: Image.network(imgUrl),
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: const Color.fromARGB(255, 37, 98, 220),
      ),
      body: SingleChildScrollView(
        // 流式布局
        child: Wrap(
          children: [
            // 轮播图  https://www.jianshu.com/p/77166e9236bc
            AspectRatio(
              // 轮播图的宽高比
              aspectRatio: 16 / 9,
              child: Swiper(
                itemBuilder: (BuildContext context, int index) {
                  // 配置图片地址
                  return Image.network(
                    bannerList[index]["img"],
                    fit: BoxFit.fill,
                  );
                },
                // 配置图片数量
                itemCount: bannerList.length,
                // 底部分页器
                pagination: const SwiperPagination(
                  margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),
                  builder: DotSwiperPaginationBuilder(
                      color: Colors.white24,
                      activeColor: Colors.white,
                      size: 8.0,
                      activeSize: 8.0),
                ),
                // 左右箭头
                // control: const SwiperControl(),
                // 无限循环
                loop: true,
                // 自动轮播
                autoplay: true,
                // 间隔时间
                autoplayDelay: 5000,
                // 渐变时间
                duration: 500,
                onTap: (index) {
                  // Utils.showToast('点击第${index + 1}张图片');
                  Navigator.push(context,
                      CupertinoPageRoute(builder: (context) {
                    return WebviewBox(url: bannerList[index]["url"]);
                  }));
                },
              ),
            ),
            // 弹性布局实现多个入口
            Container(
              padding: EdgeInsets.fromLTRB(_conMargin, 20, 0, _conMargin),
              child: const Text(
                '导航栏',
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 20,
                ),
              ),
            ),
            // 弹性布局
            Container(
              margin: EdgeInsets.fromLTRB(_conMargin, 0, 0, 0),
              child: Flex(
                mainAxisSize: MainAxisSize.max,
                direction: Axis.horizontal, // 默认水平方向，vertical 为垂直方向
                children: pieList1.map((e) {
                  return Expanded(
                    flex: 1,
                    child: _pieItemWidget(
                      e['img'],
                      e['color'],
                      e['url'],
                    ),
                  );
                }).toList(),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(_conMargin, 0, 0, 0),
              child: Flex(
                mainAxisSize: MainAxisSize.max,
                direction: Axis.horizontal, // 默认水平方向，vertical 为垂直方向
                children: pieList2.map((e) {
                  return Expanded(
                    flex: 1,
                    child: _pieItemWidget(
                      e['img'],
                      e['color'],
                      e['url'],
                    ),
                  );
                }).toList(),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(_conMargin, 18, _conMargin, 5),
              color: Colors.transparent,
              child: const Text(
                '新闻列表',
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 20,
                ),
              ),
            ),
            Column(
              children: newsList.map(
                (e) {
                  return _newsItemWidget(e['webUrl'], e['imgUrl'], e['newCont'],
                      e['time'], e['nums'], e['btnUrl']);
                },
              ).toList(),
            ),
            /*
            InkWell(
              onTap: () {
                Navigator.push(context, CupertinoPageRoute(builder: (context) {
                  return const WebviewBox(
                      url: 'https://3g.163.com/touch/news/');
                }));
              },
              child: Container(
                margin: EdgeInsets.fromLTRB(_conMargin, 0, _conMargin, 10),
                child: Flex(
                  direction: Axis.horizontal,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Column(
                        children: [
                          const Text(
                            '俄将改变"特别军事行动"性质?俄专家:赫尔松绝对有恶战;俄将改变"特别军事行动"性质?俄专家:赫尔松绝对有恶战;俄将改变"特别军事行动"性质?俄专家:赫尔松绝对有恶战',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 18,
                              height: 1.8,
                            ),
                          ),
                          Flex(
                            direction: Axis.horizontal,
                            children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    const Text(
                                      '1小时前',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    Container(
                                      width: 10,
                                    ),
                                    const Text(
                                      '0跟帖',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(context,
                                      CupertinoPageRoute(builder: (context) {
                                    return const WebviewBox(
                                        url:
                                            'https://www.jianshu.com/p/67b76f417497');
                                  }));
                                },
                                child: Container(
                                  padding:
                                      const EdgeInsets.fromLTRB(4, 0, 4, 0),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 1,
                                      color: Colors.red,
                                    ),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(9),
                                    ),
                                  ),
                                  child: const Text(
                                    '点一下',
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: Image.network(
                            'https://nimg.ws.126.net/?url=http%3A%2F%2Fcms-bucket.ws.126.net%2F2022%2F1020%2Fb5d39f05p00rk1o3i001ec0009c0070c.png&thumbnail=234x146&quality=85&type=png'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            */
            Container(
              height: 20,
            ),
            // Text(
            //   '_windowWidth值：$_windowWidth；_with值：$_with；_height值：$_height；',
            // ),
          ],
        ),
      ),
    );
  }
}
