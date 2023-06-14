import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_github_viewer/src/core/presentation/assets/media.dart';
import 'package:flutter_github_viewer/src/core/presentation/routes/app_router.gr.dart';
import 'package:flutter_github_viewer/src/features/auth/shared/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage()
class SignInPage extends ConsumerWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 48),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(AppAssets.mark, width: 150),
                  const SizedBox(height: 16),
                  AutoSizeText(
                    'Welcome to\nRepo Viewer',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 32),
                  ElevatedButton(
                    onPressed: () {
                      ref
                          .read(authNotifierProvider.notifier)
                          .signIn((authorizationUrl) {
                        final completer = Completer<Uri>();
                        AutoRouter.of(context).push(
                          AuthorizationRoute(
                            authorizationUrl: authorizationUrl,
                            onAuthorizationCodeRedirectAttempt:
                                (redirectedUri) =>
                                    completer.complete(redirectedUri),
                          ),
                        );
                        return completer.future;
                      });
                    },
                    child: const AutoSizeText('Sign In', minFontSize: 16),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
