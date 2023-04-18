import 'package:flutter/material.dart';
import 'package:paymob/constant.dart';
import 'package:webview_flutter/webview_flutter.dart';
class CardView extends StatelessWidget {
  const CardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final WebViewController webViewController = WebViewController()..setJavaScriptMode(JavaScriptMode.unrestricted)
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
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse('https://accept.paymob.com/api/acceptance/iframes/748240?payment_token=$payMobFinalToken'));

    return Scaffold(
      appBar: AppBar(),
      body:WebViewWidget(controller: webViewController,)
    );
  }
}