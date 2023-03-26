import 'package:flutter/material.dart';
import 'package:webview_test/widgets/custom_webview.dart';

class WebviewLists extends StatelessWidget {
  final Color _colorNaver = const Color(0XFF04CF5B);
  late Map<String, String> url = {
    'naver': 'https://www.naver.com/',
    'webtoon': 'https://comic.naver.com/',
  };
  WebviewLists({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            commonElevatedButton(
              context,
              'Naver',
              url['naver']!,
              _colorNaver,
            ),
            commonElevatedButton(
              context,
              'Webtoon',
              url['webtoon']!,
              _colorNaver,
            ),
          ],
        )
      ],
    );
  }

  ElevatedButton commonElevatedButton(
    BuildContext context,
    String title,
    String url,
    Color color,
  ) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CustomWebview(
              url: url,
            ),
          ),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
      ),
      child: Text(
        title,
      ),
    );
  }
}
