import 'package:ads_implement/views/helper/GoogleAdsHelper.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class CounterPage extends StatefulWidget {
  @override
  _CounterPageState createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    GoogleAdsHelper.googleAdsHelper.showInterstitialAd();
    GoogleAdsHelper.googleAdsHelper.showBannerAd();
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
    GoogleAdsHelper.googleAdsHelper.interstitialAd!.show();
    GoogleAdsHelper.googleAdsHelper.showInterstitialAd();
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: _decrementCounter,
            tooltip: 'Decrement',
            child: Icon(Icons.remove),
          ),
          SizedBox(width: 10),
          FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
        ],
      ),
      bottomNavigationBar: SizedBox(
        height: 60,
        child: AdWidget(
          ad: GoogleAdsHelper.googleAdsHelper.bannerAd!,
        ),
      ),
    );
  }
}
