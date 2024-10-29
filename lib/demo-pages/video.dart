import 'dart:io';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:image_picker/image_picker.dart';
import '../components/m-widget.dart';

class Video extends StatefulWidget {
  const Video({Key? key}) : super(key: key);

  @override
  State<Video> createState() => _MidState();
}

class _MidState extends State<Video> {
  late VideoPlayerController _controller;
  bool isLoadVideo = false;

  final ImagePicker _picker = ImagePicker();
  dynamic _videoController;

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.network(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4')
      ..initialize().then((_) => {
            setState(() {
              isLoadVideo = true;
            })
          });
  }

  @override
  void dispose() {
    super.dispose();

    _controller.dispose();
    if (_videoController != null) {
      _videoController.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('视频')),
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              isLoadVideo
                  ? AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: VideoPlayer(_controller),
                    )
                  : Container(),
              isLoadVideo
                  ? IconButton(
                      onPressed: () {
                        setState(() {
                          _controller.value.isPlaying
                              ? _controller.pause()
                              : _controller.play();
                        });
                      },
                      icon: Icon(_controller.value.isPlaying
                          ? Icons.pause
                          : Icons.play_arrow))
                  : Container(),
              Container(
                color: Colors.grey[300],
                height: 10,
              ),
              MWidget.textButton('本地视频', pressedCallbak: () async {
                final XFile? video =
                    await _picker.pickVideo(source: ImageSource.gallery);
                setState(() {
                  _videoController =
                      VideoPlayerController.file(File(video!.path))
                        ..initialize().then((value) {});
                });
              }),
              MWidget.textButton('拍摄视频', pressedCallbak: () async {
                final XFile? video =
                    await _picker.pickVideo(source: ImageSource.camera);
                setState(() {
                  _videoController =
                      VideoPlayerController.file(File(video!.path))
                        ..initialize().then((value) {});
                });
              }),
              _videoController != null
                  ? AspectRatio(
                      aspectRatio: _videoController.value.aspectRatio,
                      child: VideoPlayer(_videoController),
                    )
                  : Container(),
              _videoController != null
                  ? IconButton(
                      onPressed: () {
                        setState(() {
                          _videoController.value.isPlaying
                              ? _videoController.pause()
                              : _videoController.play();
                        });
                      },
                      icon: Icon(_videoController.value.isPlaying
                          ? Icons.pause
                          : Icons.play_arrow))
                  : Container(),
              Container(
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
