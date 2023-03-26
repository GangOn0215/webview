import 'package:flutter/material.dart';
import 'package:webview_windows/webview_windows.dart';

class CustomWindowWebview extends StatefulWidget {
  const CustomWindowWebview({super.key});

  @override
  State<CustomWindowWebview> createState() => _CustomWindowWebviewState();
}

class _CustomWindowWebviewState extends State<CustomWindowWebview> {
  final WebviewController _webViewController = WebviewController();

  Future<void> initPlatformState() async {
    await _webViewController.initialize();

    await _webViewController.loadUrl('');
  }

  @override
  void initState() {
    super.initState();

    initPlatformState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Webview(_webViewController),
    );
  }
}
