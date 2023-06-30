import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_github_viewer/src/features/auth/shared/providers.dart';
import 'package:flutter_github_viewer/src/features/github/core/shared/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'paginated_repos_list_view.dart';

@RoutePage()
class StarredReposPage extends ConsumerStatefulWidget {
  const StarredReposPage({super.key});

  @override
  ConsumerState<StarredReposPage> createState() => _StarredReposPageState();
}

class _StarredReposPageState extends ConsumerState<StarredReposPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => ref
          .read(starredReposNotifierProvider.notifier)
          .getNextStarredReposPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Starred Repos'),
          actions: [
            IconButton(
              onPressed: () {
                ref.read(authNotifierProvider.notifier).signOut();
              },
              icon: const Icon(Icons.logout),
            ),
          ],
        ),
        body: const PaginatedReposListView(),
      ),
    );
  }
}
