import 'package:flutter/material.dart';
import 'package:pexels_image/modules/shrimp_news/domain/entity/news_entity.dart';
import 'package:pexels_image/shared/constants/api_url.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ShrimpNewsDetailPage extends StatelessWidget {
  final NewsEntity _news;

  const ShrimpNewsDetailPage({
    super.key,
    required news,
  }) : _news = news;

  @override
  Widget build(BuildContext context) {
    final controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse("${API_URL.WEBVIEW}/posts/${_news.id}"));

    return Scaffold(
      appBar: AppBar(
        title: const Text("Kabar Udang"),
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}
