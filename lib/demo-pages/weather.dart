// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import '../http/apis/weather-apis.dart';


class Weather extends StatefulWidget {
  final String title;
  
  const Weather({Key? key, this.title = '获取天气'}) : super(key: key);

  @override
  State<Weather> createState() => _MidState();
}

// State 中可以改变状态，_weathInfo，可以使用 setState 方法
class _MidState extends State<Weather> {
  String _weathInfobj = '';
  String _weathInfohh = '';

  void _getWeatherHH() {
    WeatherApis.getWeatherByCode('101251201').then((data) {
      String info = '';
      if (data is String) {
        info = data;
      } else {
        info = data.toString();
      }
      setState(() {
        _weathInfohh = info;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    WeatherApis.getWeather().then((data) {
      String info = '';
      if (data is String) {
        info = data;
      } else {
        info = data.toString();
      }
      setState(() {
        _weathInfobj = info;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ignore: prefer_const_constructors
      appBar: AppBar(
        title: Text(widget.title),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Text('返回'),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('北京天气信息:$_weathInfobj'),
            RaisedButton(
              child: const Text('获取怀化天气'),
              onPressed: _getWeatherHH,
            ),
            Text('怀化天气信息:$_weathInfohh'),
          ],
        ),
      ),
    );
  }
}
