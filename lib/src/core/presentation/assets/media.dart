import 'package:flutter_svg/flutter_svg.dart';

class AppAssets {
  static const logo = 'assets/images/GitHub_Logo.png';
  static const logoWhite = 'assets/images/GitHub_Logo_White.png';
  static const mark = 'assets/images/github-mark.svg';
  static const markWhite = 'assets/images/github-mark-white.svg';

/* Only SVGs images */
  static const imagesAssets = [
    mark,
    markWhite,
  ];

  static Future<void> preloadSVGs() async {
    for (final asset in imagesAssets) {
      final loader = SvgAssetLoader(asset);
      await svg.cache
          .putIfAbsent(loader.cacheKey(null), () => loader.loadBytes(null));
    }
  }
}
