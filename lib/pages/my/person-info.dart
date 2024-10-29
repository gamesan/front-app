// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PersonInfo extends StatefulWidget {
  const PersonInfo({Key? key}) : super(key: key);

  @override
  State<PersonInfo> createState() => _MidState();
}

class _MidState extends State<PersonInfo> {
  final _comController = TextEditingController();
  final _partController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordController2 = TextEditingController();

  String sexText = '';
  String sexType = '';

  Widget _formInputItem(
    String label,
    TextEditingController controller, {
    bool isMust = false,
    String hintText = '',
  }) {
    return Container(
      padding: const EdgeInsets.fromLTRB(14, 16, 14, 16),
      color: Colors.transparent,
      child: Flex(
        direction: Axis.horizontal,
        children: [
          Expanded(
            flex: 2,
            child: Row(
              children: [
                isMust
                    ? const Text(
                        '*',
                        style: TextStyle(
                          color: Colors.red,
                        ),
                      )
                    : const Text(''),
                Text(
                  label,
                  style: const TextStyle(
                    color: Colors.black87,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
          // TextField 必须外面有 Expanded 包裹，或者占一整行。否则使用不了
          Expanded(
            flex: 3,
            child: TextField(
              controller: controller,
              textAlign: TextAlign.end,
              style: const TextStyle(
                color: Colors.black87,
                fontSize: 16,
              ),
              cursorColor: Colors.black54,
              inputFormatters: [LengthLimitingTextInputFormatter(20)],
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                isDense: true,
                hintText: hintText,
                hintStyle: const TextStyle(
                  color: Colors.black38,
                  fontSize: 16,
                ),
                border: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 0,
                  ),
                ),
                // 输入时的边框样式
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 0,
                  ),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 0,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _formSelectItem(String label, String text,
      {bool isMust = false,
      bool selected = false,
      String hintText = '',
      Function? callback}) {
    return Container(
      padding: const EdgeInsets.fromLTRB(14, 16, 14, 16),
      color: Colors.transparent,
      child: Flex(
        direction: Axis.horizontal,
        children: [
          Expanded(
            flex: 2,
            child: Row(
              children: [
                isMust
                    ? const Text(
                        '*',
                        style: TextStyle(
                          color: Colors.red,
                        ),
                      )
                    : const Text(''),
                Text(
                  label,
                  style: const TextStyle(
                    color: Colors.black87,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: InkWell(
              onTap: () {
                if (callback != null) {
                  callback();
                }
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  selected
                      ? Text(
                          text,
                          style: const TextStyle(
                            color: Colors.black87,
                            fontSize: 16,
                          ),
                        )
                      : Text(
                          hintText,
                          style: const TextStyle(
                            color: Colors.black38,
                            fontSize: 16,
                          ),
                        ),
                  const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black45,
                    size: 18,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    _comController.text = '';
    _partController.text = '';
    _phoneController.text = '';
    _emailController.text = '';
    _nameController.text = '';
    _passwordController.text = '';
    _passwordController2.text = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('个人信息')),
      body: Flex(
        direction: Axis.vertical,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 10,
                    color: Colors.grey[300],
                  ),
                  _formInputItem(
                    '所属公司',
                    _comController,
                    isMust: true,
                    hintText: '请输入公司',
                  ),
                  const Divider(
                    color: Colors.black45,
                    height: 0,
                  ),
                  _formInputItem(
                    '所属部门',
                    _partController,
                    hintText: '请输入所属部门',
                  ),
                  Container(
                    height: 10,
                    color: Colors.grey[300],
                  ),
                  _formInputItem(
                    '手机号',
                    _phoneController,
                    isMust: true,
                    hintText: '请输入手机号',
                  ),
                  const Divider(
                    color: Colors.black45,
                    height: 0,
                  ),
                  _formInputItem(
                    '邮箱',
                    _emailController,
                    isMust: true,
                    hintText: '请输入邮箱',
                  ),
                  const Divider(
                    color: Colors.black45,
                    height: 0,
                  ),
                  _formInputItem(
                    '姓名',
                    _nameController,
                    isMust: true,
                    hintText: '请输入姓名',
                  ),
                  const Divider(
                    color: Colors.black45,
                    height: 0,
                  ),
                  _formSelectItem(
                    '性别',
                    sexText,
                    isMust: true,
                    hintText: '请选择性别',
                    selected: sexText != '',
                    callback: () {
                      Navigator.pushNamed(
                        context,
                        '/my/select-gender',
                        arguments: {
                          'text': sexText,
                          'type': sexType,
                        },
                      ).then((data) {
                        // print(data);
                        if (data is Map && data['type'] != '') {
                          setState(() {
                            sexText = data['text'];
                            sexType = data['type'];
                          });
                        }
                      });
                    },
                  ),
                  const Divider(
                    color: Colors.black45,
                    height: 0,
                  ),
                  _formInputItem(
                    '密码',
                    _passwordController,
                    isMust: true,
                    hintText: '请输入密码',
                  ),
                  const Divider(
                    color: Colors.black45,
                    height: 0,
                  ),
                  _formInputItem(
                    '确认密码',
                    _passwordController2,
                    isMust: true,
                    hintText: '请输入密码',
                  ),
                  Container(
                    height: 10,
                    color: Colors.grey[300],
                  ),
                  _formSelectItem(
                    '测试',
                    '',
                    hintText: '测试',
                    selected: false,
                  ),
                  const Divider(
                    color: Colors.black45,
                    height: 0,
                  ),
                  _formSelectItem(
                    '测试',
                    '',
                    hintText: '测试',
                    selected: false,
                  ),
                  const Divider(
                    color: Colors.black45,
                    height: 0,
                  ),
                  _formSelectItem(
                    '测试',
                    '',
                    hintText: '测试',
                    selected: false,
                  ),
                  const Divider(
                    color: Colors.black45,
                    height: 0,
                  ),
                  _formSelectItem(
                    '测试',
                    '',
                    hintText: '测试',
                    selected: false,
                  ),
                  const Divider(
                    color: Colors.black45,
                    height: 0,
                  ),
                  _formSelectItem(
                    '测试',
                    '',
                    hintText: '测试',
                    selected: false,
                  ),
                  const Divider(
                    color: Colors.black45,
                    height: 0,
                  ),
                  Container(
                    height: 50,
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            padding: const EdgeInsets.fromLTRB(14, 10, 14, 10),
            child: TextButton(
              onPressed: () {
                Navigator.pop(context);
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
        ],
      ),
    );
  }
}

