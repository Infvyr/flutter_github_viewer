import 'package:flutter_github_viewer/src/core/shared/providers.dart';
import 'package:flutter_github_viewer/src/features/github/core/infrastructure/github_headers_cache.dart';
import 'package:flutter_github_viewer/src/features/github/repos/starred_repos/application/starred_repos_notifier.dart';
import 'package:flutter_github_viewer/src/features/github/repos/starred_repos/infrastructure/starred_repos_local_service.dart';
import 'package:flutter_github_viewer/src/features/github/repos/starred_repos/infrastructure/starred_repos_remote_service.dart';
import 'package:flutter_github_viewer/src/features/github/repos/starred_repos/infrastructure/starred_repos_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final githubHeadersCacheProvider = Provider(
  (ref) => GithubHeadersCache(ref.watch(sembastProvider)),
);

final starredReposLocalServiceProvider = Provider(
  (ref) => StarredReposLocalService(ref.watch(sembastProvider)),
);

final starredReposRemoteServiceProvider = Provider(
  (ref) => StarredReposRemoteService(
    ref.watch(dioProvider),
    ref.watch(githubHeadersCacheProvider),
  ),
);

final starredReposRepositoryProvider = Provider(
  (ref) => StarredReposRepository(
    ref.watch(starredReposRemoteServiceProvider),
    ref.watch(starredReposLocalServiceProvider),
  ),
);

final starredReposNotifierProvider =
    StateNotifierProvider.autoDispose<StarredReposNotifier, StarredReposState>(
  (ref) => StarredReposNotifier(
    ref.watch(starredReposRepositoryProvider),
  ),
);
