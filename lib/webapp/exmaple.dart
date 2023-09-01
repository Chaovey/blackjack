// import 'package:flutter/material.dart';
// import 'package:appsflyer_sdk/appsflyer_sdk.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Appsflyer Flutter Demo',
//       theme: ThemeData(primarySwatch: Colors.blue),
//       home: HomeScreen(),
//     );
//   }
// }

// class HomeScreen extends StatefulWidget {
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   final AppsflyerSdk appsflyerSdk = AppsflyerSdk({
//     "afDevKey": "PLJEd8nmT9JBdNP9SqNehh",
//     "afAppId": "YOUR_APP_ID",
//     "isDebug": true,
//   });

//   @override
//   void initState() {
//     super.initState();

//     appsflyerSdk.initSdk(
//       registerConversionDataCallback: true,
//       registerOnAppOpenAttributionCallback: true,
//     );

//     appsflyerSdk.onInstallConversionData((data) {
//       if (data['payload']["af_status"] == "Organic") {
//         Navigator.of(context).pushReplacement(
//             MaterialPageRoute(builder: (context) => GamePage()));
//       } else {
//         Navigator.of(context).pushReplacement(
//             MaterialPageRoute(builder: (context) => WebPage()));
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(child: CircularProgressIndicator()),
//     );
//   }
// }

// class GamePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Game Page")),
//       body: Center(child: Text("Welcome to the Game")),
//     );
//   }
// }

// class WebPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Web Page")),
//       body: Center(child: Text("Welcome to the Website")),
//     );
//   }
// }
