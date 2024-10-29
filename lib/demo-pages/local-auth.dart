// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth_android/local_auth_android.dart';
import 'package:local_auth_ios/local_auth_ios.dart';

import '../components/m-widget.dart';

class LocalAuth extends StatefulWidget {
  const LocalAuth({Key? key}) : super(key: key);

  @override
  State<LocalAuth> createState() => _MidState();
}

class _MidState extends State<LocalAuth> {
  final LocalAuthentication auth = LocalAuthentication();
  _SupportState _supportState = _SupportState.unknown;
  bool? _canCheckBiometrics;
  List<BiometricType>? _availableBiometrics;
  String _authorized = '没有授权';
  bool _isAuthenticating = false;

  @override
  void initState() {
    super.initState();
    auth.isDeviceSupported().then((bool isSupported) {
      // print(isSupported);
      setState(() {
        _supportState =
            isSupported ? _SupportState.supported : _SupportState.unsupported;
      });
    });
  }

  // 检查生物特征
  Future<void> _checkBiometrics() async {
    late bool canCheckBiometrics;
    try {
      canCheckBiometrics = await auth.canCheckBiometrics;
    } on PlatformException catch (e) {
      canCheckBiometrics = false;
      // ignore: avoid_print
      print(e);
    }
    if (!mounted) {
      return;
    }
    setState(() {
      _canCheckBiometrics = canCheckBiometrics;
    });
  }

  // 获取可用生物特征
  Future<void> _getAvailableBiometrics() async {
    late List<BiometricType> availableBiometrics;
    try {
      availableBiometrics = await auth.getAvailableBiometrics();
    } on PlatformException catch (e) {
      availableBiometrics = <BiometricType>[];
      // ignore: avoid_print
      print(e);
    }
    if (!mounted) {
      return;
    }
    setState(() {
      _availableBiometrics = availableBiometrics;
    });
  }

  // 验证
  Future<void> _authenticate() async {
    bool authenticated = false;
    try {
      setState(() {
        _isAuthenticating = true;
        _authorized = '验证身份中';
      });
      authenticated = await auth.authenticate(
        localizedReason: '系统确定身份方法',
        authMessages: const <AuthMessages>[
          AndroidAuthMessages(
            signInTitle: '请验证指纹',
            biometricHint: '指纹识别',
            cancelButton: '取消',
          ),
          IOSAuthMessages(
            cancelButton: '取消',
          )
        ],
        options: const AuthenticationOptions(
          useErrorDialogs: true,
          stickyAuth: true,
        ),
      );
      setState(() {
        _isAuthenticating = false;
      });
    } on PlatformException catch (e) {
      // ignore: avoid_print
      print(e);
      setState(() {
        _isAuthenticating = false;
        _authorized = '失败——${e.message}';
      });
      return;
    }
    if (!mounted) {
      return;
    }
    setState(() {
      _authorized = authenticated ? '授权成功' : '没有授权';
    });
  }

  Future<void> _authenticateWithBiometrics() async {
    bool authenticated = false;
    try {
      setState(() {
        _isAuthenticating = true;
        _authorized = '验证身份中';
      });
      authenticated = await auth.authenticate(
        localizedReason: '扫描您的指纹（或面部或其他）以进行身份验证',
        authMessages: const <AuthMessages>[
          AndroidAuthMessages(
            signInTitle: '请验证指纹',
            biometricHint: '指纹识别',
            cancelButton: '取消',
          ),
          IOSAuthMessages(
            cancelButton: '取消',
          )
        ],
        options: const AuthenticationOptions(
          useErrorDialogs: true,
          stickyAuth: true,
          biometricOnly: true,
        ),
      );
      setState(() {
        _isAuthenticating = false;
        _authorized = '验证身份中';
      });
    } on PlatformException catch (e) {
      // ignore: avoid_print
      print(e);
      setState(() {
        _isAuthenticating = false;
        _authorized = '失败——${e.message}';
      });
      return;
    }
    if (!mounted) {
      return;
    }

    final String message = authenticated ? '授权' : '没授权';
    setState(() {
      _authorized = message;
    });
  }

  Future<void> _cancelAuthentication() async {
    await auth.stopAuthentication();
    setState(() => _isAuthenticating = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('指纹识别')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (_supportState == _SupportState.unknown)
            const CircularProgressIndicator()
          else if (_supportState == _SupportState.supported)
            const Text(
              '设备支持生物识别',
              style: TextStyle(
                fontSize: 20,
              ),
            )
          else
            const Text(
              '设备不支持生物识别',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          const Divider(height: 10),
          MWidget.textButton('检测是否支持生物识别', pressedCallbak: () {
            _checkBiometrics();
          }),
          Text(
            '检测是否支持生物识别：$_canCheckBiometrics',
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
          const Divider(height: 10),
          MWidget.textButton('获取可用生物特征', pressedCallbak: () {
            _getAvailableBiometrics();
          }),
          Text(
            '获取可用生物特征：$_availableBiometrics',
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
          const Divider(height: 10),
          if (_isAuthenticating)
            ElevatedButton(
              onPressed: _cancelAuthentication,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const <Widget>[
                  Text('取消身份验证'),
                  Icon(Icons.cancel),
                ],
              ),
            )
          else
            Column(
              children: <Widget>[
                ElevatedButton(
                  onPressed: _authenticate,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const <Widget>[
                      Text('身份认证'),
                      Icon(Icons.perm_device_information),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: _authenticateWithBiometrics,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(_isAuthenticating ? '取消' : '身份验证：仅生物识别'),
                      const Icon(Icons.fingerprint),
                    ],
                  ),
                ),
              ],
            ),
          Text(
            '当前状态：$_authorized',
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}

enum _SupportState {
  unknown,
  supported,
  unsupported,
}
