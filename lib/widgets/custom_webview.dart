import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_test/widgets/custom_android_webview.dart';
import 'package:webview_test/widgets/custom_window_webview.dart';

class CustomWebview extends StatefulWidget {
  const CustomWebview({super.key});

  @override
  State<CustomWebview> createState() => _CustomWebviewState();
}

class _CustomWebviewState extends State<CustomWebview> {
  Widget? platformWebview;

  @override
  void initState() {
    super.initState();

    if (Platform.isAndroid) {
      platformWebview = const CustomAndroidWebview();
    } else if (Platform.isWindows) {
      platformWebview = const CustomWindowWebview();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: platformWebview,
    );
  }
}
