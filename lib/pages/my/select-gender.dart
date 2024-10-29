// ignore_for_file: file_names

import 'package:flutter/material.dart';

class SelectGender extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final arguments;
  const SelectGender({Key? key, this.arguments}) : super(key: key);

  @override
  State<SelectGender> createState() => _MidState();
}

class _MidState extends State<SelectGender> {
  String type = '';

  @override
  void initState() {
    super.initState();
    setState(() {
      type = widget.arguments['type'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('选择性别')),
      body: Container(
        margin: const EdgeInsets.fromLTRB(14, 16, 14, 16),
        child: Column(children: [
          RadioListTile(
            value: '1',
            groupValue: type,
            onChanged: (value) {
              setState(() {
                type = value.toString();
              });
            },
            title: const Text('男'),
            selected: type == '1',
          ),
          RadioListTile(
            value: '2',
            groupValue: type,
            onChanged: (value) {
              setState(() {
                type = value.toString();
              });
            },
            title: const Text('女'),
            selected: type == '2',
          ),
          Container(
            margin: const EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width,
            child: TextButton(
              onPressed: () {
                String text = '';
                if (type == '1') {
                  text = '男';
                } else if (type == '2') {
                  text = '女';
                }
                Map data = {'text': text, 'type': type};
                Navigator.pop(context, data);
              },
              child: const Text(
                '保存',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  height: 1.2,
                ),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith((states) {
                  if (states.contains(MaterialState.pressed)) {
                    return const Color.fromARGB(255, 15, 1, 106);
                  }
                  return Colors.blue;
                }),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20))),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
