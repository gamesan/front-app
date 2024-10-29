import 'package:flutter/material.dart';
import '../components/bottom-dialog.dart';

class MyDialog extends StatefulWidget {
  const MyDialog({Key? key}) : super(key: key);

  // @override
  // State<StatefulWidget> createState() {
  //   throw UnimplementedError();
  // }

  @override
  State<MyDialog> createState() => _MidState();
}

class _MidState extends State<MyDialog> {
  // @override
  // Widget build(BuildContext context) {
  //   throw UnimplementedError();
  // }

  var _resultMessage = '';
  var _resultMessage2 = '';

  final _textController = TextEditingController();

  // ignore: non_constant_identifier_names
  Widget _TextButton(String text, Function callback) {
    return TextButton(
      onPressed: () {
        callback();
      },
      child: Text(
        text,
        style: const TextStyle(color: Colors.white, fontSize: 18),
      ),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.pressed)) {
          return const Color.fromARGB(255, 15, 1, 106);
        }
        return Colors.blue;
      })),
    );
  }

  // 初始化赋值不能使用引用型，有引用型须在 initState 中赋值
  late List<DialogList> dialogLists;
  late List<DialogList> dialogLists2;

  @override
  void initState() {
    super.initState();

    _textController.text = '';

    dialogLists = [
      DialogList(
          title: "微信",
          imgPath: "assets/images/wx.png",
          onTap: () {
            setState(() {
              _resultMessage = "微信";
            });
          }),
      DialogList(
          title: "支付宝",
          imgPath: "assets/images/zfb.png",
          onTap: () {
            setState(() {
              _resultMessage = "支付宝";
            });
          }),
    ];

    dialogLists2 = [
      DialogList(
          title: "微信支付",
          imgPath: "assets/images/wx.png",
          onTap: () {
            setState(() {
              _resultMessage2 = "微信支付";
            });
          }),
      DialogList(
          title: "支付宝支付",
          imgPath: "assets/images/zfb.png",
          onTap: () {
            setState(() {
              _resultMessage2 = "支付宝支付";
            });
          }),
    ];
  }

  @override
  void dispose() {
    _textController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("弹框")),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _TextButton('底部弹框', () {
              ShowBottomDialog(items: dialogLists, context: context).build();
            }),
            Text('选择值：$_resultMessage'),
            _TextButton('全屏底部弹框', () {
              return ShowBottomDialog(
                      items: dialogLists2, context: context, isFullScreen: true)
                  .build();
            }),
            Text('选择值：$_resultMessage2'),
            // 屏幕高度
            Text("屏幕高度是：${MediaQuery.of(context).size.height.toString()}"),
            // 屏幕宽度
            Text("屏幕宽度是：${MediaQuery.of(context).size.width.toString()}"),
            _TextButton('输入框弹框', () {
              return showDialog(
                  context: context,
                  barrierDismissible: false, // 默认为 true， 控制是否点击空白区域是否关闭弹窗
                  builder: (context) {
                    return AlertDialog(
                      title: const Text("请输入"),
                      content: TextField(
                        // 绑定控制器
                        controller: _textController,
                        // 输入改变以后的事件
                        onChanged: (String value) async {
                          setState(() {
                            _textController.text = value;
                            // 每次修改内容需要手动修改selection，否则光标会回到最前面
                            _textController.selection =
                                TextSelection.fromPosition(TextPosition(
                                    offset: _textController.text.length));
                          });

                          // _textController.text = value;
                          // // 每次修改内容需要手动修改selection，否则光标会回到最前面
                          // _textController.selection =
                          //     TextSelection.fromPosition(TextPosition(
                          //         offset: _textController.text.length));
                        },
                        decoration: const InputDecoration(
                            hintText: "请输入单行文本", border: OutlineInputBorder()),
                      ),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text("确定")),
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text("取消")),
                      ],
                    );
                  });
            }),
            Text("对话框输入的值是：${_textController.text}")
          ],
        )));
  }
}
