import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import '../components/m-widget.dart';
import '../utils/utils.dart';

class BlueDemo extends StatefulWidget {
  const BlueDemo({Key? key}) : super(key: key);

  @override
  State<BlueDemo> createState() => _MidState();
}

class _MidState extends State<BlueDemo> {
  FlutterBlue flutterBlue = FlutterBlue.instance;
  bool isBlueOn = false;
  List scanResultList = [];

  @override
  void initState() {
    super.initState();
    // 监听蓝牙状态
    flutterBlue.state.listen((state) {
      bool _isBlueOn;
      if (state == BluetoothState.on) {
        _isBlueOn = true;
      } else {
        _isBlueOn = false;
      }
      setState(() {
        isBlueOn = _isBlueOn;
      });
    });

    // 监听扫描结果
    flutterBlue.scanResults.listen((results) {
      Utils.showToast(results.toString());
      Utils.showToast(results.length.toString());
      for (ScanResult r in results) {
        if (!scanResultList.contains(r)) {
          setState(() {
            scanResultList.add(r);
          });
        }
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    flutterBlue.stopScan();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('蓝牙')),
      body: Column(
        children: [
          Text('蓝牙状态${isBlueOn ? "开启" : "关闭"}'),
          // MWidget.textButton('扫描', pressedCallbak: () {
          //   if (isBlueOn) {
          //     // 开始扫描
          //     flutterBlue.startScan(timeout: const Duration(seconds: 4));
          //   }
          // }),
          StreamBuilder<List<ScanResult>>(
            stream: FlutterBlue.instance.scanResults,
            initialData: const [],
            builder: (c, snapshot) {
              Utils.showToast(snapshot.toString());
              return Column(
                children: snapshot.data!.map((e) {
                  return InkWell(
                    child: Text(e.device.name),
                    onTap: () {},
                  );
                }).toList(),
              );
            },
          ),
          Column(
            children: scanResultList.map((e) {
              return InkWell(
                child: Text(
                    'name:${e.device.name};rssi:${e.rssi};address:${e.device.id}'),
                onTap: () {},
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
