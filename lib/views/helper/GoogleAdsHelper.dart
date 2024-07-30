import 'dart:developer';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class GoogleAdsHelper {
  GoogleAdsHelper._();

  static final GoogleAdsHelper googleAdsHelper = GoogleAdsHelper._();

  BannerAd? bannerAd; // For Banner Ad
  InterstitialAd? interstitialAd; // For Interstitial Ad
  AppOpenAd? appOpenAd; // For AppOpen Ad
  bool isAdLoaded = false; // Track if ads are loaded

  // Show Banner Ad
  void showBannerAd() {
    bannerAd = BannerAd(
      size: AdSize.banner,
      adUnitId: "ca-app-pub-3940256099942544/6300978111", // Your Banner ID
      listener: BannerAdListener(
        onAdLoaded: (Ad ad) {
          log("Banner Ad Loaded");
          isAdLoaded = true;
        },
        onAdFailedToLoad: (Ad ad, LoadAdError error) {
          log("Banner Ad Failed to Load: $error");
          ad.dispose();
          isAdLoaded = false;
        },
        onAdOpened: (Ad ad) => log("Banner Ad Opened"),
        onAdClosed: (Ad ad) {
          log("Banner Ad Closed");
          ad.dispose();
          isAdLoaded = false;
        },
      ),
      request: const AdRequest(),
    );

    bannerAd?.load();
  }

  // Show Interstitial Ad
  void showInterstitialAd() {
    InterstitialAd.load(
      adUnitId: "ca-app-pub-3940256099942544/1033173712", // Your Interstitial ID
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (InterstitialAd ad) {
          log("Interstitial Ad Loaded");
          interstitialAd = ad;
          isAdLoaded = true;
          interstitialAd?.show();
        },
        onAdFailedToLoad: (LoadAdError error) {
          log("Interstitial Ad Failed to Load: $error");
          isAdLoaded = false;
        },
      ),
    );
  }

  // Load AppOpen Ad
  void loadAppOpenAd() {
    AppOpenAd.load(
      adUnitId: "ca-app-pub-3940256099942544/9257395921", // Your AppOpen ID
      request: const AdRequest(),
      adLoadCallback: AppOpenAdLoadCallback(
        onAdLoaded: (ad) {
          log("AppOpen Ad Loaded");
          appOpenAd = ad;
          isAdLoaded = true;
          appOpenAd?.show();
        },
        onAdFailedToLoad: (LoadAdError error) {
          log("AppOpen Ad Failed to Load: $error");
          isAdLoaded = false;
        },
      ),
    );
  }

  // Dispose all ads when not needed to avoid memory leaks
  void disposeAds() {
    bannerAd?.dispose();
    interstitialAd?.dispose();
    appOpenAd?.dispose();
    isAdLoaded = false;
  }
}
