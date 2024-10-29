import 'package:flutter/material.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'dart:io';

import '../components/m-widget.dart';

class DeviceDemo extends StatefulWidget {
  const DeviceDemo({Key? key}) : super(key: key);

  @override
  State<DeviceDemo> createState() => _MidState();
}

class _MidState extends State<DeviceDemo> {
  String _deviceID = '';
  String _deviceInfo = '';



  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('设备信息'),
      ),
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MWidget.textButton('获取设备唯一信息', pressedCallbak: () async {
                DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
                // ignore: prefer_typing_uninitialized_variables
                var info;
                // 安卓
                if (Platform.isAndroid) {
                  AndroidDeviceInfo androidInfo =
                      await deviceInfoPlugin.androidInfo;
                  info = androidInfo.toMap();
                }
                // ios
                if (Platform.isIOS) {
                  IosDeviceInfo iosInfo = await deviceInfoPlugin.iosInfo;
                  info = iosInfo.toMap();
                }
                setState(() {
                  _deviceID = info['id'];
                  _deviceInfo = info.toString();
                });
              }),
              Text('设备id是：$_deviceID'),
              Text('设备信息$_deviceInfo'),
            ],
          ),
        ),
      ),
    );
  }
}
