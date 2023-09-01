import 'package:blackjack/const/enum_appsflyer.dart';
import 'package:blackjack/services/Appsflyer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class Webapp extends StatefulWidget {
  const Webapp({super.key});

  @override
  State<Webapp> createState() => _WebppState();
}

class _WebppState extends State<Webapp> {
  late InAppWebViewController webviewController;
  bool isConnecsion = false;
  String afpurchase = "purchase";
  String afregister = "register";
  late AppsFlyer appsFlyer;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitDown,
        DeviceOrientation.portraitUp,
      ],
    );
    return Scaffold(
      body: Stack(
        children: [
          InAppWebView(
            initialUrlRequest: URLRequest(url: Uri.parse(name)),
            onWebViewCreated: (InAppWebViewController controller) {
              webviewController = controller;
              controller.addJavaScriptHandler(
                handlerName: afpurchase,
                callback: (arguments) {
                  appsFlyer.logEvent(
                    afpurchase,
                    {
                      "price": arguments[0],
                      "currency": arguments[1],
                    },
                  );
                },
              );
              controller.addJavaScriptHandler(
                handlerName: afregister,
                callback: (arguments) {
                  appsFlyer.logEvent(afregister, {
                    "method": arguments[0],
                  });
                },
              );
            },
            onLoadStart: (controller, url) {
              isConnecsion = false;
              setState(() {
                debugPrint("Started loading : $url");
              });
            },
            onLoadStop: (controller, url) async {
              isConnecsion = true;
              setState(() {
                debugPrint("Finished loading : $url");
              });
            },
            onLoadError: (controller, url, code, message) {
              debugPrint("Controller : $controller");
              debugPrint("Url : $url");
              debugPrint("Code : $code");
              debugPrint("message : $message");
            },
          ),
          isConnecsion == false
              ? const Center(child: CircularProgressIndicator())
              : Container()
        ],
      ),
    );
  }
}
