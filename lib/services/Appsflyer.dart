// ignore_for_file: file_names, avoid_web_libraries_in_flutter
import 'dart:ui';
import 'package:appsflyer_sdk/appsflyer_sdk.dart';
import 'package:blackjack/const/enum_appsflyer.dart';

class AppsFlyer {
  late AppsflyerSdk appsflyerSdk;
  static bool isAF = false;
  String getData = '';
  void appConfig() {
    AppsFlyerOptions options = AppsFlyerOptions(
      afDevKey: "PLJEd8nmT9JBdNP9SqNehh",
      appId: "APP_ID",
      showDebug: true,
      timeToWaitForATTUserAuthorization: 15,
    );
    appsflyerSdk = AppsflyerSdk(options);
  }

  void initAppsFlyer() {
    appsflyerSdk.initSdk(
      registerConversionDataCallback: registerConversionDataCallback,
      registerOnAppOpenAttributionCallback:
          registerOnAppOpenAttributionCallback,
      registerOnDeepLinkingCallback: registerOnDeepLinkingCallback,
    );
  }

  Future<void> isOrganicInstall() async {
    appsflyerSdk.onInstallConversionData((data) async {
      getData = await data['payload']['af_status'];
      if (!(getData == "Organic")) {
        isAF = true;
      } else {
        isAF = false;
      }
    });
  }

  String getlanuage() {
    String lanuage = window.locale.languageCode;
    return lanuage;
  }

  Future<bool?> logEvent(String eventName, Map eventValues) {
    return appsflyerSdk.logEvent(eventName, eventValues);
  }
}
