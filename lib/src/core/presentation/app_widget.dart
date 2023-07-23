import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_github_viewer/src/core/presentation/routes/app_router.dart';
import 'package:flutter_github_viewer/src/core/presentation/routes/app_router.gr.dart';
import 'package:flutter_github_viewer/src/core/presentation/theme/style.dart';
import 'package:flutter_github_viewer/src/core/shared/providers.dart';
import 'package:flutter_github_viewer/src/features/auth/application/auth_notifier.dart';
import 'package:flutter_github_viewer/src/features/auth/shared/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final initializationProvider = FutureProvider((ref) async {
  await ref.read(sembastProvider).init();

  ref.read(dioProvider)
    ..options = BaseOptions(
      headers: {
        'Accept': 'application/vnd.github.v3.html+json',
      },
      // validateStatus: (status) =>
      //     status != null && status >= 200 && status < 400,
    )
    ..interceptors.add(ref.read(oAuth2InterceptorProvider));

  final authNotifier = ref.read(authNotifierProvider.notifier);

  /// Todo: Remove this artificial delay
  await Future.delayed(const Duration(seconds: 3));

  await authNotifier.checkAndUpdateAuthStatus();
});

class AppWidget extends ConsumerWidget {
  const AppWidget({super.key});
  static final AppRouter appRouter = AppRouter();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(
      initializationProvider,
      (_, __) {
        debugPrint('Initialization completed');
      },
      onError: (error, stackTrace) {
        debugPrint('Error: $error');
      },
    );

    ref.listen<AuthState>(authNotifierProvider, (_, state) {
      state.maybeMap(
        orElse: () {},
        authenticated: (_) {
          appRouter.pushAndPopUntil(
            const StarredReposRoute(),
            predicate: (route) => false,
          );
        },
        unauthenticated: (_) {
          appRouter.pushAndPopUntil(
            const SignInRoute(),
            predicate: (route) => false,
          );
        },
      );
    });

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Github Repo Viewer',
      routerDelegate: appRouter.delegate(),
      routeInformationParser: appRouter.defaultRouteParser(),
      theme: ThemeStyles.lightTheme,
    );
  }
}
