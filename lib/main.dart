// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'pages/home/home.dart';
import 'pages/my/my.dart';
import 'pages/demo/demo.dart';
import 'package:flutter/services.dart';
import 'routes/routes.dart';

import '/utils/utils.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp, // 竖屏 Portrait 模式
    DeviceOrientation.portraitDown,
    // DeviceOrientation.landscapeLeft, // 横屏 Landscape 模式
    // DeviceOrientation.landscapeRight,
  ]).then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '你好',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // routes: routes, // 路由统一管理
      // 路由统一管理 路由具体操作
      onGenerateRoute: (RouteSettings settings) {
        return Routes.generateRoute(settings);
      },
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // ignore: non_constant_identifier_names, prefer_const_constructors
  var Pages = [Home(), Demo(), My(title: '首页')];
  var currentIndex = 0;
  DateTime? _lastPressedAt;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        // appBar: AppBar(
        //   title: Text(widget.title),
        // ),
        body: Pages[currentIndex],
        backgroundColor: Colors.white10,
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.blue,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "首页"),
            BottomNavigationBarItem(icon: Icon(Icons.telegram), label: "案例"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "我的")
          ],
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
        ),
      ),
      onWillPop: () async {
        if (_lastPressedAt == null ||
            DateTime.now().difference(_lastPressedAt!) >
                const Duration(seconds: 1)) {
          // 两次点击间隔超过1秒则重新计时
          _lastPressedAt = DateTime.now();
          Utils.showToast("再按一次退出");
          return false;
        }
        return true;
      },
    );
  }
}
