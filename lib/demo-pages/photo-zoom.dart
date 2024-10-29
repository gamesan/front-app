// ignore_for_file: file_names, unused_element

import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class PhotoZoom extends StatefulWidget {
  const PhotoZoom({Key? key}) : super(key: key);

  @override
  State<PhotoZoom> createState() => _MidState();
}

class _MidState extends State<PhotoZoom> {
  List list = [
    'https://goss.cfp.cn/creative/vcg/veer/800/new/VCG41N667607058.jpg',
    'https://goss1.cfp.cn/creative/vcg/800/new/VCG41N1210205351.jpg',
    'https://goss.cfp.cn/creative/vcg/800/new/VCG211241121526.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('图片放大')),
      body: SingleChildScrollView(
        child: Column(children: [
          const Text(
            '单个图片缩放',
            style: TextStyle(fontSize: 20, height: 2),
          ),
          Column(
            children: list.map((e) {
              return InkWell(
                child: Image.network(e),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return _PhotoViewSimpleScreen(
                      imageProvider: NetworkImage(e),
                    );
                  }));
                },
              );
            }).toList(),
          ),
          const Text(
            '图片列表缩放',
            style: TextStyle(
              fontSize: 20,
              height: 2.0,
              leadingDistribution: TextLeadingDistribution.even,
            ),
          ),
          Column(
            children: list.asMap().keys.map((i) {
              return InkWell(
                child: Image.network(list[i]),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return _PhotoViewListScreen(
                      galleryList: list,
                      defaultIndex: i,
                    );
                  }));
                },
              );
            }).toList(),
          ),
        ]),
      ),
    );
  }
}

// 图片列表
// ignore: must_be_immutable
class _PhotoViewListScreen extends StatefulWidget {
  final List galleryList;
  final int defaultIndex; // 初始化显示第几张图

  const _PhotoViewListScreen({
    Key? key,
    required this.galleryList,
    this.defaultIndex = 1,
  }) : super(key: key);

  @override
  State<_PhotoViewListScreen> createState() => _PhotoMidState();
}

class _PhotoMidState extends State<_PhotoViewListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        child: Container(
          constraints: BoxConstraints.expand(
            height: MediaQuery.of(context).size.height,
          ),
          child: Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                bottom: 0,
                child: PhotoViewGallery.builder(
                  itemCount: widget.galleryList.length,
                  gaplessPlayback: true,
                  backgroundDecoration: const BoxDecoration(color: Colors.white),
                  pageController: PageController(initialPage: widget.defaultIndex),
                  builder: (BuildContext context, int index) {
                    return PhotoViewGalleryPageOptions(
                      imageProvider: NetworkImage(widget.galleryList[index]),
                    );
                  },
                  onPageChanged: (index) {
                    // ignore: avoid_print
                    // print(index);
                  },
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).padding.top,
                right: 10,
                child: IconButton(
                  icon: const Icon(
                    Icons.close,
                    size: 30,
                    color: Colors.black54,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        ),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}

// 单个图片放大
class _PhotoViewSimpleScreen extends StatelessWidget {
  const _PhotoViewSimpleScreen({
    Key? key,
    this.imageProvider, //图片
    this.backgroundDecoration, //背景修饰
    this.minScale, //最大缩放倍数
    this.maxScale, //最小缩放倍数
  }) : super(key: key);

  final ImageProvider? imageProvider;
  final BoxDecoration? backgroundDecoration;
  final dynamic minScale;
  final dynamic maxScale;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          constraints: BoxConstraints.expand(
            height: MediaQuery.of(context).size.height,
          ),
          child: Stack(
            children: <Widget>[
              Positioned(
                top: 0,
                left: 0,
                bottom: 0,
                right: 0,
                child: PhotoView(
                  imageProvider: imageProvider,
                  backgroundDecoration: backgroundDecoration,
                  minScale: minScale,
                  maxScale: maxScale,
                  enableRotation: false, // 图片是否可以旋转
                ),
              ),
              Positioned(
                // 右上角关闭按钮
                right: 10,
                top: MediaQuery.of(context).padding.top,
                child: IconButton(
                  icon: const Icon(
                    Icons.close,
                    size: 30,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
