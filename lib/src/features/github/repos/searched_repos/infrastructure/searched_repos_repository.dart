import 'package:dartz/dartz.dart';
import 'package:flutter_github_viewer/src/core/domain/fresh.dart';
import 'package:flutter_github_viewer/src/core/infrastructure/network_exceptions.dart';
import 'package:flutter_github_viewer/src/features/github/core/domain/github_failure.dart';
import 'package:flutter_github_viewer/src/features/github/core/domain/github_repo.dart';
import 'package:flutter_github_viewer/src/features/github/repos/core/infrastructure/extensions.dart';
import 'package:flutter_github_viewer/src/features/github/repos/searched_repos/infrastructure/searched_repos_remote_service.dart';

class SearchedReposRepository {
  const SearchedReposRepository(this._remoteService);

  final SearchedReposRemoteService _remoteService;

  Future<Either<GithubFailure, Fresh<List<GithubRepo>>>> getSearchedReposPage(
    String query,
    int page,
  ) async {
    try {
      final remotePageItems =
          await _remoteService.getSearchedReposPage(query, page);
      return right(
        await remotePageItems.maybeWhen(
          withNewData: (data, maxPage) => Fresh.yes(
            data.toDomain(),
            isNextPageAvailable: page < maxPage,
          ),
          orElse: () => Fresh.no([], isNextPageAvailable: false),
        ),
      );
    } on RestApiException catch (e) {
      return left(GithubFailure.api(e.errorCode));
    }
  }
}
