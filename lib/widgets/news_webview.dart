import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../utils/appcolors.dart';
import 'apptext.dart';

class NewsWebviewApp extends StatefulWidget {
  final String newsURL;
  const NewsWebviewApp({super.key, required this.newsURL});

  @override
  State<NewsWebviewApp> createState() => _NewsWebviewAppState();
}

class _NewsWebviewAppState extends State<NewsWebviewApp> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..loadRequest(
        Uri.parse(widget.newsURL),

      )..setJavaScriptMode(JavaScriptMode.unrestricted);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        leading: IconButton(
          icon: const Icon(Icons.chevron_left), onPressed: () {
            Navigator.pop(context);
        },
        ),
        title: const AppText(
          text: "H I G H L I G H T S",
          fontSize: 18.0,
          color: AppColors.blackColor,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      body: WebViewWidget(
        controller: controller,
      ),
    );
  }
}