// ignore_for_file: file_names

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../components/m-widget.dart';

class ImageOpt extends StatefulWidget {
  const ImageOpt({Key? key}) : super(key: key);

  @override
  State<ImageOpt> createState() => _MidState();
}

class _MidState extends State<ImageOpt> {
  final ImagePicker _picker = ImagePicker();
  //动态数据类型 , 通过 dynamic 关键字定义的变量 , 在 编译时不会管定义的数据类型 , 运行时才处理变量的类型
  dynamic _galleryImg;
  dynamic _cameraImg;
  dynamic _galleryImgs;

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
      appBar: AppBar(title: const Text('视频')),
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(0),
          child: Column(
            children: [
              MWidget.textButton('相册图片', pressedCallbak: () async {
                final XFile? image =
                    await _picker.pickImage(source: ImageSource.gallery);
                setState(() {
                  _galleryImg = File(image!.path);
                });
              }),
              const Text('相册图片'),
              _galleryImg != null
                  ? Image.file(
                      _galleryImg,
                      width: 200,
                    )
                  : Container(),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                color: Colors.grey[300],
                height: 10,
              ),
              MWidget.textButton('拍摄照片', pressedCallbak: () async {
                final XFile? image =
                    await _picker.pickImage(source: ImageSource.camera);
                setState(() {
                  _cameraImg = File(image!.path);
                });
              }),
              const Text('拍摄图片'),
              _cameraImg != null
                  ? Image.file(
                      _cameraImg,
                      width: 200,
                    )
                  : Container(),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                color: Colors.grey[300],
                height: 10,
              ),
              MWidget.textButton('多张图片', pressedCallbak: () async {
                final List<XFile>? images = await _picker.pickMultiImage();
                setState(() {
                  _galleryImgs = images;
                });
              }),
              const Text('多张图片'),
              // 流式布局
              Wrap(
                  spacing: 2, // 主轴上子组件间距
                  runSpacing: 4, // 交叉轴上子组件间距
                  children: _galleryImgs != null
                      ? _galleryImgs.map<Widget>((item) {
                          // map<Widget> : map后面需要加泛型 <Widget>
                          return Image.file(
                            File(item!.path),
                            width: 80,
                            height: 80,
                          );
                        }).toList()
                      : []),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                color: Colors.grey[300],
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
