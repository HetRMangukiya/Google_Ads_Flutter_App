import 'dart:developer';

import 'package:ads_implement/views/helper/GoogleAdsHelper.dart';
import 'package:ads_implement/views/screens/CounterPage.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MobileAds.instance.initialize();
  try {
    GoogleAdsHelper.googleAdsHelper.loadAppOpenAd();
  } catch (e) {
    log("$e");
  }
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CounterPage(),
    );
  }
}
