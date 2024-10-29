// ignore_for_file: file_names

import 'package:flutter/material.dart';

class FullImage {
  BuildContext context;
  String url;

  FullImage({required this.url, required this.context});

  void build() {
    showDialog(
        context: context,
        builder: (context) {
          // InkWell 外面必须有 Scaffold 之类组件包裹
          return Scaffold(
            backgroundColor: const Color.fromARGB(126, 58, 58, 58),
            body: InkWell(
              child: ConstrainedBox(
                constraints: const BoxConstraints.expand(),
                child: Image.network(
                  url,
                  fit: BoxFit.fitWidth,
                ),
              ),
              onDoubleTap: () {
                Navigator.pop(context);
              },
            ),
          );

          // 拖拽组件
          // return Draggable(
          //     child: ConstrainedBox(
          //       constraints: const BoxConstraints.expand(),
          //       child: Image.network(
          //         url,
          //         fit: BoxFit.fitWidth,
          //       ),
          //     ),
          //     feedback: ConstrainedBox(
          //       constraints: const BoxConstraints.expand(),
          //       child: Image.network(
          //         url,
          //         fit: BoxFit.fitWidth,
          //       ),
          //     ));
        });
  }
}
