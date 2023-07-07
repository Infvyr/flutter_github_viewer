import 'package:dartz/dartz.dart';
import 'package:flutter_github_viewer/src/core/domain/fresh.dart';
import 'package:flutter_github_viewer/src/core/infrastructure/network_exceptions.dart';
import 'package:flutter_github_viewer/src/features/github/core/domain/github_failure.dart';
import 'package:flutter_github_viewer/src/features/github/core/domain/github_repo.dart';
import 'package:flutter_github_viewer/src/features/github/core/infrastructure/github_repo_dto.dart';
import 'package:flutter_github_viewer/src/features/github/repos/starred_repos/infrastructure/starred_repos_local_service.dart';
import 'package:flutter_github_viewer/src/features/github/repos/starred_repos/infrastructure/starred_repos_remote_service.dart';

class StarredReposRepository {
  StarredReposRepository(this._remoteService, this._localService);

  final StarredReposRemoteService _remoteService;
  final StarredReposLocalService _localService;

  Future<Either<GithubFailure, Fresh<List<GithubRepo>>>> getStarredReposPage(
    int page,
  ) async {
    try {
      final remotePageItems = await _remoteService.getStarredReposPage(page);
      return right(
        await remotePageItems.when(
          noConnection: () async => Fresh.no(
            await _localService.getPage(page).then((_) => _.toDomain()),
            isNextPageAvailable: page < await _localService.getLocalPageCount(),
          ),
          notModified: (maxPage) async => Fresh.yes(
            await _localService.getPage(page).then((_) => _.toDomain()),
            isNextPageAvailable: page < maxPage,
          ),
          withNewData: (data, maxPage) async {
            await _localService.upsertPage(data, page);
            return Fresh.yes(
              data.toDomain(),
              isNextPageAvailable: page < maxPage,
            );
          },
        ),
      );
    } on RestApiException catch (e) {
      return left(GithubFailure.api(e.errorCode));
    }
  }
}

extension DTOListToDomainList on List<GithubRepoDTO> {
  List<GithubRepo> toDomain() {
    return map((e) => e.toDomain()).toList();
  }
}
