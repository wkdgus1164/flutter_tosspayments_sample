import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class PreviewView extends StatefulWidget {
  const PreviewView({super.key});

  @override
  State<PreviewView> createState() => _PreviewViewState();
}

class _PreviewViewState extends State<PreviewView> {
  InAppWebViewGroupOptions options = InAppWebViewGroupOptions(
      crossPlatform: InAppWebViewOptions(
        useShouldOverrideUrlLoading: true,
        mediaPlaybackRequiresUserGesture: false,
      ),
      android: AndroidInAppWebViewOptions(
        useHybridComposition: true,
      ),
      ios: IOSInAppWebViewOptions(
        allowsInlineMediaPlayback: true,
      ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("WebView")),
      body: InAppWebView(
        initialOptions: options,
        initialUrlRequest: URLRequest(
            url: Uri.parse('https://fc10-218-236-78-53.ngrok-free.app')),
        onWebViewCreated: (controller) {
          controller.addJavaScriptHandler(
            handlerName: 'handlerName',
            callback: (arguments) {
              print('handlerName: $arguments');
              return {
                'key': 'value',
              };
            },
          );
        },
        onConsoleMessage: (controller, consoleMessage) {
          print("Console: $consoleMessage");
        },
      ),
    );
  }
}
