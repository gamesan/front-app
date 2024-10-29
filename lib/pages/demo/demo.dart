// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Demo extends StatefulWidget {
  final String title;

  const Demo({Key? key, this.title = '案例'}) : super(key: key);

  @override
  State<Demo> createState() => _MidState();
}

// Flutter -滚动Widget
// https://www.jianshu.com/p/d044e6550180

// Flutter 组件之 ListTile 详解
// https://www.jianshu.com/p/50ebc8f5ec6c
class _MidState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            leading: const Icon(Icons.adb, size: 20),
            title: const Text("旧案例首页"),
            subtitle: const Text(
                "旧案例首页；flutter推荐插件：https://www.jianshu.com/p/d6b95057a5ab"),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.pushNamed(context, '/demo/demo-page');
            },
          ),
          ListTile(
            leading: const Icon(Icons.adb, size: 20),
            title: const Text("滚动页面"),
            subtitle:
                const Text("滚动页面；横向滚动；纵向滚动；页面滚动事件监听，滚动跳转到指定位置；map方式生成列表组件"),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.pushNamed(context, '/demo/scroll-page');
            },
          ),
          ListTile(
            leading: const Icon(Icons.adb, size: 20),
            title: const Text("天气请求接口页面"),
            subtitle: const Text("天气请求接口页面"),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.pushNamed(context, '/demo/weather');
            },
          ),
          ListTile(
            leading: const Icon(Icons.adb, size: 20),
            title: const Text("路由传参"),
            subtitle: const Text("路由传参"),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.pushNamed(context, '/demo/route-params',
                  arguments: {'name': '张三', 'age': 35});
            },
          ),
          ListTile(
            leading: const Icon(Icons.adb, size: 20),
            title: const Text("静态页面"),
            subtitle: const Text("静态页面；头部appBar修改背景颜色、添加actions；对话框功能"),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.pushNamed(context, '/demo/static-page');
            },
          ),
          ListTile(
            leading: const Icon(Icons.adb, size: 20),
            title: const Text("动态交互页面"),
            subtitle: const Text("动态交互页面；定位布局方式；GridView使用，每行固定数量，多列展示网格布局；"),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.pushNamed(context, '/demo/state-page');
            },
          ),
          ListTile(
            leading: const Icon(Icons.adb, size: 20),
            title: const Text("逻辑页面"),
            subtitle: const Text("逻辑页面"),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.pushNamed(context, '/demo/logic');
            },
          ),
          ListTile(
            leading: const Icon(Icons.adb, size: 20),
            title: const Text("列表页面"),
            subtitle: const Text("网络图片。图片列表页面、放大图片、下载图片"),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.pushNamed(context, '/demo/list-page');
            },
          ),
          ListTile(
            leading: const Icon(Icons.adb, size: 20),
            title: const Text("打开本地html"),
            subtitle: const Text(
                "打开本地html；flutter 和 js 之间通信；自动获取 html 中的 title 作为 appbar中的title文案"),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.pushNamed(context, '/demo/local-html');
            },
          ),
          ListTile(
            leading: const Icon(Icons.adb, size: 20),
            title: const Text("打开掘金网站"),
            subtitle: const Text("打开掘金网站"),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.pushNamed(context, '/demo/web-juej');
            },
          ),
          ListTile(
            leading: const Icon(Icons.adb, size: 20),
            title: const Text("可以横屏页面"),
            subtitle: const Text("可以横屏页面"),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.pushNamed(context, '/demo/ho-web');
            },
          ),
          ListTile(
            leading: const Icon(Icons.adb),
            title: const Text("url_launcher使用"),
            subtitle: const Text("打电话、发短信、发邮件、凋起外部浏览器、打开外部app、打开高德地图位置"),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.pushNamed(context, '/demo/url-launcher');
            },
          ),
          ListTile(
            leading: const Icon(Icons.adb),
            title: const Text('弹框页面'),
            subtitle: const Text('中间弹框，底部弹框，弹框输入框；弹框内容中使用循序方式生成相同的widget'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.pushNamed(context, '/demo/dialog');
            },
          ),
          ListTile(
            leading: const Icon(Icons.adb),
            title: const Text('二维码'),
            subtitle: const Text('生成二维码，下载二维码，扫描二维码'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.pushNamed(context, '/demo/qr-code');
            },
          ),
          ListTile(
            leading: const Icon(Icons.adb),
            title: const Text('定时器'),
            subtitle: const Text('定时器的使用类似于js中的setTimeout,setInterval'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.pushNamed(context, '/demo/timer');
            },
          ),
          ListTile(
            leading: const Icon(Icons.adb),
            title: const Text('设备信息'),
            subtitle: const Text('获取设备信息；'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.pushNamed(context, '/demo/device');
            },
          ),
          ListTile(
            leading: const Icon(Icons.adb),
            title: const Text('图片'),
            subtitle: const Text('预览本地图片，摄像图片，上传图片'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.pushNamed(context, '/demo/image-opt');
            },
          ),
          ListTile(
            leading: const Icon(Icons.adb),
            title: const Text('视频'),
            subtitle: const Text('播放网络视频；本地视频、拍摄视频播放；'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.pushNamed(context, '/demo/video');
            },
          ),
          ListTile(
            leading: const Icon(Icons.adb),
            title: const Text('数据存储'),
            subtitle: const Text('存储本地数据字符串、数字、map等'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.pushNamed(context, '/demo/set-storage');
            },
          ),
          ListTile(
            leading: const Icon(Icons.adb),
            title: const Text('获取存储数据'),
            subtitle: const Text('获取本地存储数据字符串、数字、map等'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.pushNamed(context, '/demo/get-storage');
            },
          ),
          ListTile(
            leading: const Icon(Icons.adb),
            title: const Text('tab页面'),
            subtitle: const Text('tabbar、tabview的使用介绍'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.pushNamed(context, '/demo/tab-page');
            },
          ),
          ListTile(
            leading: const Icon(Icons.adb),
            title: const Text('列表刷新加载'),
            subtitle: const Text('下拉刷新，上拉加载更多'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.pushNamed(context, '/demo/list-more');
            },
          ),
          ListTile(
            leading: const Icon(Icons.adb),
            title: const Text('吸顶页面'),
            subtitle: const Text('吸顶效果的页面。第一楼是banner图，第二楼是入口按钮，第三楼是tabbar、tabview；滚动到一定高度，tabbar吸顶。'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.pushNamed(context, '/demo/ceiling');
            },
          ),
          ListTile(
            leading: const Icon(Icons.adb),
            title: const Text('打开pdf文件'),
            subtitle: const Text('打开网络的pdf文件'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.pushNamed(context, '/demo/pdf-file');
            },
          ),
          ListTile(
            leading: const Icon(Icons.adb),
            title: const Text('图片放大'),
            subtitle: const Text('点击图片，打开一个新的navigator展示图片，图片可以缩放；可以显示一组图片'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.pushNamed(context, '/demo/photo-zoom');
            },
          ),
          ListTile(
            leading: const Icon(Icons.adb),
            title: const Text('签名'),
            subtitle: const Text('手动签名，保存签名图片'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.pushNamed(context, '/demo/autograph');
            },
          ),
          ListTile(
            leading: const Icon(Icons.adb),
            title: const Text('生物识别'),
            subtitle: const Text('指纹识别'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.pushNamed(context, '/demo/local-auth');
            },
          ),
          ListTile(
            leading: const Icon(Icons.adb),
            title: const Text('蓝牙'),
            subtitle: const Text('蓝牙功能'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.pushNamed(context, '/demo/blue');
            },
          ),
        ],
      ),
    );
  }
}
