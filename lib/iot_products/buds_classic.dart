import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Buds_Classic extends StatefulWidget {
  const Buds_Classic({Key? key}) : super(key: key);

  @override
  State<Buds_Classic> createState() => _Buds_ClassicState();
}

class _Buds_ClassicState extends State<Buds_Classic> {
  WebViewController? _controller;
  double webProgress = 0;

  @override
  void initState() {
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (progress) => setState(() {
            this.webProgress = progress / 100;
          }),
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.realme.com/bd/realme-buds-classic')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse('https://www.realme.com/bd/realme-buds-classic'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("realme Buds Classic"),
          backgroundColor: Colors.yellow,
        ),
        body: Column(
          children: [
            webProgress < 1 ? SizedBox(
              height: 7,
              child: LinearProgressIndicator(
                value: webProgress,
                color: Colors.red,
                backgroundColor: Colors.black,
              ),
            ) : SizedBox(),
            Expanded(

                child: WebViewWidget(controller: _controller!)),
          ],

        ));

  }
}