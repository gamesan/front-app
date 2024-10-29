import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:webview_flutter/webview_flutter.dart';
// ignore: unused_import
import 'package:flutter/services.dart';


class HoWebview extends StatefulWidget {
  const HoWebview({Key? key, this.url = "https://cn.bing.com/", this.title = '必应'})
      : super(key: key);

  final String url;
  final String title;

  @override
  State<HoWebview> createState() => _MidState();
}

class _MidState extends State<HoWebview> {

  @override
  // ignore: override_on_non_overriding_member
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title)
      ),
      body: WebView(
        initialUrl: widget.url,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }

  @override
  // ignore: override_on_non_overriding_member
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }
}
