import 'package:blackjack/Home/homescreen.dart';
import 'package:blackjack/services/Appsflyer.dart';
import 'package:blackjack/webapp/webapp.dart';
import 'package:flutter/material.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  AppsFlyer appsFlyer = AppsFlyer();
  bool af = AppsFlyer.isAF;
  @override
  void initState() {
    super.initState();
    appsFlyer.appConfig();
    appsFlyer.initAppsFlyer();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: appsFlyer.isOrganicInstall(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return const HomeScreen();
          } else {
            if (af) {
              return const Webapp();
            } else {
              return const Webapp();
            }
          }
        } else {
          return const HomeScreen();
        }
      },
    );
  }
}
