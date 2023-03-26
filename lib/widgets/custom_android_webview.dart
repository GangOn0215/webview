import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CustomAndroidWebview extends StatefulWidget {
  final String url;

  const CustomAndroidWebview({
    super.key,
    required this.url,
  });

  @override
  State<CustomAndroidWebview> createState() => _CustomAndroidWebviewState();
}

class _CustomAndroidWebviewState extends State<CustomAndroidWebview> {
  WebViewController? _webViewController;

  @override
  void initState() {
    super.initState();

    _webViewController = WebViewController()
      ..loadRequest(Uri.parse(widget.url))
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
                  builder: (context) => AlertDialog(
                    title: const Text('EXIT'),
                    content: const Text('종료 하시겠습니까?'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          SystemNavigator.pop();
                        },
                        child: const Text('예'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('아니오'),
                      ),
                    ],
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
