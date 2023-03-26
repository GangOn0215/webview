import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_test/widgets/custom_android_webview.dart';
import 'package:webview_test/widgets/custom_window_webview.dart';

class CustomWebview extends StatefulWidget {
  final String url;

  const CustomWebview({
    super.key,
    required this.url,
  });

  @override
  State<CustomWebview> createState() => _CustomWebviewState();
}

class _CustomWebviewState extends State<CustomWebview> {
  Widget? platformWebview;

  @override
  void initState() {
    super.initState();

    if (Platform.isAndroid) {
      platformWebview = CustomAndroidWebview(url: widget.url);
    } else if (Platform.isWindows) {
      platformWebview = CustomWindowWebview(url: widget.url);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('test'),
      ),
      body: Container(
        child: platformWebview,
      ),
    );
  }
}
