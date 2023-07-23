import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_github_viewer/src/core/presentation/app_widget.dart';
import 'package:flutter_github_viewer/src/core/presentation/assets/media.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppAssets.preloadSVGs();

  runApp(
    const ProviderScope(
      child: AppWidget(),
    ),
  );
}
