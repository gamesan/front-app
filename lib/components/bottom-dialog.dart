// ignore_for_file: file_names

import 'package:flutter/material.dart';
import '/utils/utils.dart';

class DialogList {
  final String title;
  final String imgPath;
  final Function onTap;

  const DialogList(
      {required this.title, required this.imgPath, required this.onTap});
}

class ShowBottomDialog {
  List<DialogList> items;
  BuildContext context;
  bool isFullScreen;

  ShowBottomDialog(
      {required this.items, required this.context, this.isFullScreen = false});

  Widget _buildItem(String title, String imagePath, {required Function onTap}) {
    //添加点击事件
    return InkWell(
      //点击回调
      onTap: () {
        //关闭弹框
        Navigator.of(context).pop();
        //外部回调
        onTap();
      },
      child: SizedBox(
        height: 40,
        //左右排开的线性布局
        child: Row(
          //所有的子Widget 水平方向居中
          mainAxisAlignment: MainAxisAlignment.center,
          //所有的子Widget 竖直方向居中
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              width: 20,
              height: 20,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(title)
          ],
        ),
      ),
    );
  }

  List<Widget> _buildChildren() {
    List<Widget> _childrenList = [];

    // 如果是全屏弹框，腾出头部时间日期的状态栏高度
    if (isFullScreen) {
      _childrenList.add(Utils.topStatusbar());
    }

    for (var i = 0; i < items.length; i++) {
      _childrenList.add(
          _buildItem(items[i].title, items[i].imgPath, onTap: items[i].onTap));
      if (i < items.length - 1) {
        //分割线
        _childrenList.add(const Divider());
      }
    }

    _childrenList.add(Container(
      color: Colors.grey[300],
      height: 8,
    ));

    //取消按钮
    //添加个点击事件
    _childrenList.add(InkWell(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: Container(
        child: const Text(
          "取消",
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
        height: 50,
        alignment: Alignment.center,
      ),
    ));

    return _childrenList;
  }

  void build() {
    // 是否全屏
    if (isFullScreen) {
      showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (context) {
            return Column(children: _buildChildren());
          });
    } else {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Column(
                // 自适应内容高度
                mainAxisSize: MainAxisSize.min,
                children: _buildChildren());
          });
    }
  }
}
