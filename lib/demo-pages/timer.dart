import 'package:flutter/material.dart';
import 'dart:async';
import '../components/m-widget.dart';
import '../utils/utils.dart';

class DemoTimer extends StatefulWidget {
  const DemoTimer({Key? key}) : super(key: key);

  @override
  State<DemoTimer> createState() => _MidState();
}

class _MidState extends State<DemoTimer> {
  var _timeout1 = '';
  var _timeout2 = '';

  var _moretime1 = '';
  var _moretime2 = '';
  // ignore: prefer_typing_uninitialized_variables
  var _timeControl1;
  // ignore: prefer_typing_uninitialized_variables
  var _timeControl2;

  var _time = '0';

  var _countDownText = '倒计时按钮';
  int _countDownTime = 60;
  bool _countDownDisable = false;

  @override
  void dispose() {
    super.dispose();
    // 销毁定时器
    if (_timeControl1 != null) {
      _timeControl1.cancel();
      _timeControl1 = null;
    }
    if (_timeControl2 != null) {
      _timeControl2.cancel();
      _timeControl2 = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('使用定时器')),
      body: SizedBox(
        width: double.infinity, // 占满全屏
        child: Scrollbar(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                MWidget.textButton('定时器回调只用一次', pressedCallbak: () {
                  const timeout = Duration(milliseconds: 3000);
                  setState(() {
                    _timeout1 = DateTime.now().toString();
                  });
                  Timer(timeout, () {
                    setState(() {
                      _timeout2 = DateTime.now().toString();
                    });
                  });
                }),
                Text('按钮点击时间：$_timeout1'),
                Text('按钮点击时间：$_timeout2'),
                const Divider(),
                Container(
                  color: Colors.grey[300],
                  height: 8,
                ),
                MWidget.textButton('定时器回调使用多次', pressedCallbak: () {
                  const timeout = Duration(milliseconds: 2000);
                  setState(() {
                    _moretime1 = DateTime.now().toString();
                  });
                  Timer.periodic(timeout, (timer) {
                    _timeControl1 = timer;
                    setState(() {
                      _moretime2 = DateTime.now().toString();
                    });
                  });
                }),
                MWidget.textButton('关闭定时器', pressedCallbak: () {
                  if (_timeControl1 != null) {
                    _timeControl1.cancel();
                    // 关闭定时器后，将定期器对应的变量设置为null
                    _timeControl1 = null;
                  }
                }),
                Text('按钮点击时间：$_moretime1'),
                Text('按钮点击时间：$_moretime2'),
                const Divider(),
                Container(
                  color: Colors.grey[300],
                  height: 8,
                ),
                MWidget.textButton('开始计时', pressedCallbak: () {
                  if (_timeControl2 != null) {
                    _timeControl2.cancel();
                    _timeControl2 = null;
                  }
                  const duration = Duration(seconds: 1);
                  Timer.periodic(duration, (timer) {
                    _timeControl2 = timer;
                    int num = int.parse(_time) + 1;
                    setState(() {
                      _time = num.toString();
                    });
                  });
                }),
                MWidget.textButton('暂停计时', pressedCallbak: () {
                  if (_timeControl2 != null) {
                    _timeControl2.cancel();
                    _timeControl2 = null;
                  }
                }),
                MWidget.textButton('重新计时', pressedCallbak: () {
                  if (_timeControl2 != null) {
                    _timeControl2.cancel();
                    _timeControl2 = null;
                  }
                  setState(() {
                    _time = '0';
                  });
                  const duration = Duration(seconds: 1);
                  Timer.periodic(duration, (timer) {
                    _timeControl2 = timer;
                    int num = int.parse(_time) + 1;
                    setState(() {
                      _time = num.toString();
                    });
                  });
                }),
                Text('计时时间：$_time'),
                const Divider(),
                Container(
                  color: Colors.grey[300],
                  height: 8,
                ),
                MWidget.textButton(_countDownText, disable: _countDownDisable,
                    pressedCallbak: () {
                  Utils.showToast('开始倒计时');
                  const duration = Duration(seconds: 1);
                  Timer.periodic(duration, (timer) {
                    if (_countDownTime > 0) {
                      _countDownTime = _countDownTime - 1;
                      setState(() {
                        _countDownText = '还剩${_countDownTime.toString()}秒';
                        _countDownDisable = true;
                      });
                    } else {
                      _countDownTime = 60;
                      setState(() {
                        _countDownText = '倒计时按钮';
                        _countDownDisable = false;
                      });
                      timer.cancel();
                    }
                  });
                }),
                const Divider(),
                Container(
                  color: Colors.grey[300],
                  height: 380,
                ),
                const Text('到底了'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
