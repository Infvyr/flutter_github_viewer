// ignore_for_file: prefer_const_constructors

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_github_viewer/src/core/presentation/assets/media.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage()
class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 48.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: SvgPicture.asset(AppAssets.mark, width: 128.0),
            ),
            const SizedBox(height: 32.0),
            LinearProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
