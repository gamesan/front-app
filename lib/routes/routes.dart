import 'package:flutter/cupertino.dart';
// ignore: unnecessary_import
import 'package:flutter/material.dart';

import 'dart:io';

import '/pages/home/home.dart';
import '/pages/my/person-info.dart';
import '/pages/my/select-gender.dart';

import '/demo-pages/route-params.dart';
import '../demo-pages/scroll-pages.dart';
import '/demo-pages/demo-page.dart';
import '/demo-pages/weather.dart';
import '/demo-pages/state-page.dart';
import '/demo-pages/static-page.dart';
import '/demo-pages/logic.dart';
import '/demo-pages/list-page.dart';
import '/components/webview.dart';
import '/demo-pages/horizontal.dart';
import '/demo-pages/url-launcher.dart';
import '/demo-pages/dialog.dart';
import '/demo-pages/qr-code.dart';
import '/demo-pages/timer.dart';
import '/demo-pages/device.dart';
import '../demo-pages/image-opt.dart';
import '../demo-pages/video.dart';
import '../demo-pages/set-storage.dart';
import '../demo-pages/get-storage.dart';
import '../demo-pages/tab.dart';
import '../demo-pages/list-more.dart';
import '../demo-pages/ceiling.dart';
import '../demo-pages/pdf-file.dart';
import '../demo-pages/photo-zoom.dart';
import '../demo-pages/autograph.dart';
import '../demo-pages/local-auth.dart';
import '../demo-pages/blue.dart';

class Routes {
  static String _getAssetsPath(String path) {
    if (Platform.isAndroid) {
      return 'file:///android_asset/flutter_assets/' + path;
    } else if (Platform.isIOS) {
      return 'file://Frameworks/App.framework/flutter_assets/' + path;
    }
    return '';
  }

  static Map<String, Function> _getRoutes() {
    return {
      '/home': (context) => const Home(),
      '/my/person-info': (context) => const PersonInfo(),
      '/my/select-gender': (context, {arguments}) =>
          SelectGender(arguments: arguments),

      // 带路由参数的方式
      '/demo/route-params': (context, {arguments}) =>
          RouteParams(arguments: arguments),
      '/demo/scroll-page': (context) => const ScrollPage(),
      '/demo/demo-page': (context) => const DemoPage(),
      '/demo/weather': (context) => const Weather(),
      '/demo/state-page': (context) => const StatePage(title: 'state-widget'),
      '/demo/static-page': (context) => const StaticPage(),
      '/demo/logic': (context) => const Logic(),
      '/demo/list-page': (context) => const ListPage(),
      '/demo/local-html': (context) => WebviewBox(
            title: "调试",
            url: _getAssetsPath('assets/web/index.html'),
            showAppBar: false,
            setStorage: true,
          ),
      '/demo/web-juej': (context) => const WebviewBox(
            title: "掘金",
            url: 'https://juejin.cn/',
          ),
      '/demo/ho-web': (context) => const HoWebview(),
      '/demo/url-launcher': (context) => const UrlLauncher(),
      '/demo/dialog': (context) => const MyDialog(),
      '/demo/qr-code': (context) => const QrCode(),
      '/demo/timer': (context) => const DemoTimer(),
      '/demo/device': (context) => const DeviceDemo(),
      '/demo/image-opt': (context) => const ImageOpt(),
      '/demo/video': (context) => const Video(),
      '/demo/set-storage': (context) => const SetStorage(),
      '/demo/get-storage': (context) => const GetStorage(),
      '/demo/tab-page': (context) => const TabBox(),
      '/demo/list-more': (context) => const ListMore(),
      '/demo/ceiling': (context) => const Ceiling(),
      '/demo/pdf-file': (context) => const OpenPdfFile(),
      '/demo/photo-zoom': (context) => const PhotoZoom(),
      '/demo/autograph': (context) => const Autograph(),
      '/demo/local-auth': (context) => const LocalAuth(),
      '/demo/blue': (context) => const BlueDemo(),
    };
  }

  static generateRoute(RouteSettings settings) {
    final String? name = settings.name;
    // ignore: unused_local_variable
    final Function pageContentBuilder = _getRoutes()[name] as Function;
    //如果方法不为空
    if (settings.arguments != null) {
      final Route route = CupertinoPageRoute(
          builder: (context) =>
              pageContentBuilder(context, arguments: settings.arguments));
      //放回路由组件对象
      return route;
    } else {
      final Route route =
          CupertinoPageRoute(builder: (context) => pageContentBuilder(context));
      return route;
    }
  }
}
