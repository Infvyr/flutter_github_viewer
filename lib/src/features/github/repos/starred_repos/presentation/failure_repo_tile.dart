import 'package:flutter/material.dart';
import 'package:flutter_github_viewer/src/features/github/core/domain/github_failure.dart';
import 'package:flutter_github_viewer/src/features/github/core/shared/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FailureRepoTile extends ConsumerWidget {
  const FailureRepoTile({super.key, required this.failure});
  final GithubFailure failure;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTileTheme(
      textColor: Theme.of(context).colorScheme.onError,
      iconColor: Theme.of(context).colorScheme.onError,
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        color: Theme.of(context).colorScheme.error,
        child: ListTile(
          title: const Text('An error occurred, please retry!'),
          subtitle: Text(
            failure.map(api: (_) => 'API returned ${_.errorCode}'),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          leading: const SizedBox(
            height: double.infinity,
            child: Icon(Icons.warning),
          ),
          trailing: IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => ref
                .refresh(starredReposNotifierProvider.notifier)
                .getNextStarredReposPage(),
          ),
        ),
      ),
    );
  }
}
