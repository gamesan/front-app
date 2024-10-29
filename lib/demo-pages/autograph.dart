import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:signature/signature.dart';
import '../components/m-widget.dart';

class Autograph extends StatefulWidget {
  const Autograph({Key? key}) : super(key: key);

  @override
  State<Autograph> createState() => _MidState();
}

class _MidState extends State<Autograph> {
  final SignatureController _signatureController = SignatureController(
    penStrokeWidth: 8.0, // 线条宽度
    penColor: Colors.black, // 线条颜色
    exportBackgroundColor: Colors.transparent, // 导出图片颜色
  );

  late bool isEmpty;
  late bool landScape = false;
  // late Uint8List _signData;
  dynamic _signData;

  @override
  void initState() {
    super.initState();

    if (_signatureController.value.isNotEmpty) {
      isEmpty = false;
    } else {
      isEmpty = true;
    }

    // 监听画板
    _signatureController.addListener(() {
      bool tmpIsEmpty = true;
      if (_signatureController.value.isNotEmpty) {
        tmpIsEmpty = false;
      } else {
        tmpIsEmpty = true;
      }

      if (isEmpty != tmpIsEmpty) {
        if (mounted) {
          setState(() {
            isEmpty = tmpIsEmpty;
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('签名')),
      body: RotatedBox(
        quarterTurns: landScape ? 1 : 0,
        child: Stack(
          children: [
            _signData == null
                ? Signature(
                    controller: _signatureController,
                    width: 690,
                    height: 370,
                    backgroundColor: Colors.black12,
                  )
                : Image.memory(
                    _signData,
                    width: 300,
                    fit: BoxFit.fill,
                  ),
            Offstage(
              offstage: isEmpty ? false : false,
              child: const Text(
                '签名',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.black45,
                ),
              ),
            ),
            Positioned(
              top: 10,
              right: landScape ? 0 : 10,
              child: Offstage(
                offstage: landScape ? true : false,
                child: MWidget.textButton('横屏', pressedCallbak: () {
                  setState(() {
                    landScape = true;
                  });
                }),
              ),
            ),
            Positioned(
              bottom: 10,
              right: landScape ? 0 : 10,
              child: Row(
                children: [
                  Offstage(
                    offstage: isEmpty ? true : false,
                    child: MWidget.textButton('清空', pressedCallbak: () {
                      _signatureController.clear();
                      setState(() {
                        _signData = null;
                      });
                    }),
                  ),
                  Offstage(
                    offstage: landScape ? false : true,
                    child: MWidget.textButton('竖屏', pressedCallbak: () {
                      setState(() {
                        landScape = false;
                      });
                    }),
                  ),
                  Offstage(
                    offstage: isEmpty ? true : false,
                    child: MWidget.textButton('保存', pressedCallbak: () async {
                      // _signatureController.toImage();
                      final Uint8List? data =
                          await _signatureController.toPngBytes();
                      final imageEncoded = base64.encode(data!);
                      setState(() {
                        _signData = base64Decode(imageEncoded);
                        // print(_signData);
                      });
                    }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
