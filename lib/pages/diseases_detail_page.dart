import 'package:flutter/material.dart';
import 'package:jala_test/modules/diseases/domain/entity/disease_entity.dart';
import 'package:jala_test/shared/constants/api_url.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DiseasesDetailPage extends StatelessWidget {
  final DiseaseEntity _disease;

  const DiseasesDetailPage({
    super.key,
    required disease,
  }) : _disease = disease;

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
      ..loadRequest(Uri.parse("${API_URL.WEBVIEW}/diseases/${_disease.id}"));

    return Scaffold(
      appBar: AppBar(
        title: const Text("Info Penyakit"),
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}
