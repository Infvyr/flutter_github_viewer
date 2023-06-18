import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_github_viewer/src/features/auth/shared/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class StarredReposPage extends ConsumerWidget {
  const StarredReposPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
              child: Text(
                'Starred Repos',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                ref.read(authNotifierProvider.notifier).signOut();
              },
              child: const Text('Sign Out'),
            ),
          ],
        ),
      ),
    );
  }
}
