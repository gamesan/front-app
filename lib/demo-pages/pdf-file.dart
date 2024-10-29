// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';

class OpenPdfFile extends StatefulWidget {
  const OpenPdfFile({Key? key}) : super(key: key);

  @override
  State<OpenPdfFile> createState() => _MidState();
}

class _MidState extends State<OpenPdfFile> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('打开文件')),
      body: Column(
        children: [
          ElevatedButton(
            child: const Text("Open PDF"),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const PDF(
                    swipeHorizontal: false,
                  ).cachedFromUrl(
                    'https://cdn.syncfusion.com/content/PDFViewer/flutter-succinctly.pdf',
                    placeholder: (progress) => Center(
                      child: Text(
                        '$progress %',
                        style: const TextStyle(
                          color: Colors.black54,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
