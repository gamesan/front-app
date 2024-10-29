// ignore_for_file: file_names

import 'package:flutter/material.dart';

class MWidget {
  const MWidget({Key? key});
  // 自定义按钮组件
  static Widget textButton(String text, {Function? pressedCallbak, bool disable = false}) {
    return TextButton(
      onPressed: () {
        if (pressedCallbak != null && !disable) {
          pressedCallbak();
        }
      },
      child: Text(
        text,
        style: TextStyle(color: disable ? const Color.fromARGB(255, 34, 34, 34) : Colors.white),
      ),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.pressed)) {
          return disable ? Colors.grey[300] : const Color.fromARGB(255, 15, 1, 106);
        }
        return disable ? Colors.grey[300] : Colors.blue;
      })),
    );
  }
}
