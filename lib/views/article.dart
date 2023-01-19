import 'dart:async';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleView extends StatefulWidget {
  final String Url;
  const ArticleView({super.key, required this.Url});

  @override
  State<ArticleView> createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {
  final Completer<WebViewController> _completer =
      Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'I',
              style: TextStyle(color: Colors.deepOrange),
            ),
            Text(
              'N',
              style: TextStyle(color: Colors.white),
            ),
            Text(
              'D',
              style: TextStyle(color: Colors.green),
            ),
            Text('News'),
          ],
        ),
      ),
      body: SafeArea(
        child: Expanded(
          child: WebView(
            initialUrl: widget.Url,
            onWebViewCreated: ((WebViewController webViewController) {
              _completer.complete(webViewController);
            }),
          ),
        ),
      ),
    );
  }
}
