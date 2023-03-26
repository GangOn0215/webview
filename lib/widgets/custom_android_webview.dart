import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CustomAndroidWebview extends StatefulWidget {
  const CustomAndroidWebview({super.key});

  @override
  State<CustomAndroidWebview> createState() => _CustomAndroidWebviewState();
}

class _CustomAndroidWebviewState extends State<CustomAndroidWebview> {
  WebViewController? _webViewController;

  @override
  void initState() {
    super.initState();

    _webViewController = WebViewController()
      ..loadRequest(Uri.parse(''))
      ..setJavaScriptMode(JavaScriptMode.unrestricted);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        var future = _webViewController!.canGoBack();

        future.then(
          (canGoBack) => {
            if (canGoBack)
              {_webViewController!.goBack()}
            else
              {
                showDialog(
                  context: context,
                  builder: (context) => const AlertDialog(
                    title: Text('EXIT'),
                    content: Text('You Want Exit?'),
                  ),
                )
              }
          },
        );

        return Future.value(false);
      },
      child: SafeArea(
        child: WebViewWidget(
          controller: _webViewController!,
        ),
      ),
    );
  }
}
