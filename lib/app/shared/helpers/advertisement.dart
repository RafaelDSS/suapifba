import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

class NativeAdItem extends StatefulWidget {
  const NativeAdItem({super.key});

  @override
  State<NativeAdItem> createState() => _NativeAdItemState();
}

class _NativeAdItemState extends State<NativeAdItem> {
  NativeAd? _nativeAd;
  bool _nativeAdIsReady = false;

  @override
  void initState() {
    _createNativeAd();
    super.initState();
  }

  @override
  void dispose() {
    _nativeAd!.dispose();
    super.dispose();
  }

  _createNativeAd() {
    _nativeAd = NativeAd(
        adUnitId: codigoBlocoAnuncios,
        listener: NativeAdListener(
          onAdLoaded: (ad) {
            debugPrint('$NativeAd loaded.');
            setState(() {
              _nativeAdIsReady = true;
            });
          },
          onAdFailedToLoad: (ad, error) {
            // Dispose the ad here to free resources.
            debugPrint('$NativeAd failed to load: $error');
            setState(() {
              _nativeAdIsReady = false;
            });
            ad.dispose();
          },
        ),
        request: const AdRequest(),
        nativeTemplateStyle:
            NativeTemplateStyle(templateType: TemplateType.small)
        // Styling
        // Styling
        )
      ..load();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return _nativeAdIsReady
          ? SizedBox(
              width: double.infinity,
              height: 100,
              child: AdWidget(ad: _nativeAd!),
            )
          : Container();
    });
  }
}
