import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MGridView extends StatefulWidget {
  // list 的栅格数据
  List<Map> list;
  // buildGridItem 为一个回调函数，返回 widget
  Function buildGridItem;
  
  MGridView({Key? key, required this.list, required this.buildGridItem}) : super(key: key);

  @override
  State<MGridView> createState() => _MidState();
}

class _MidState extends State<MGridView> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: widget.list.length,
      // 去掉自带滚动
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        //Widget Function(BuildContext context, int index)
        return widget.buildGridItem(context, index);
      },

      //SliverGridDelegateWithFixedCrossAxisCount 构建一个横轴固定数量Widget
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        // 横轴元素个数
        crossAxisCount: 3,
        // 纵轴间距
        mainAxisSpacing: 10.0,
        // 横轴间距
        crossAxisSpacing: 10.0,
        // 子组件宽高长度比例
        // childAspectRatio: 1.4,
      ),
    );
  }
}
