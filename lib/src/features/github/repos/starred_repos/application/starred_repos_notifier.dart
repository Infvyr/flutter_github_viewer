import 'package:flutter_github_viewer/src/core/domain/fresh.dart';
import 'package:flutter_github_viewer/src/features/github/core/domain/github_failure.dart';
import 'package:flutter_github_viewer/src/features/github/core/domain/github_repo.dart';
import 'package:flutter_github_viewer/src/features/github/core/infrastructure/pagination_config.dart';
import 'package:flutter_github_viewer/src/features/github/repos/starred_repos/infrastructure/starred_repos_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'starred_repos_notifier.freezed.dart';

@freezed
class StarredReposState with _$StarredReposState {
  const StarredReposState._();
  const factory StarredReposState.initial(Fresh<List<GithubRepo>> repos) =
      _Initial;
  const factory StarredReposState.loadInProgress(
    Fresh<List<GithubRepo>> repos,
    int itemsPerPage,
  ) = _LoadInProgress;
  const factory StarredReposState.loadSuccess(Fresh<List<GithubRepo>> repos,
      {required bool isNextPageAvailable}) = _LoadSuccess;
  const factory StarredReposState.loadFailure(
    GithubFailure failure,
    Fresh<List<GithubRepo>> repos,
  ) = _LoadFailure;
}

class StarredReposNotifier extends StateNotifier<StarredReposState> {
  StarredReposNotifier(this._repository)
      : super(StarredReposState.initial(Fresh.yes([])));

  final StarredReposRepository _repository;

  int _page = 1;

  Future<void> getNextStarredReposPage() async {
    state = StarredReposState.loadInProgress(
      state.repos,
      PaginationConfig.itemsPerPage,
    );

    final failureOrRepos = await _repository.getStarredReposPage(_page);
    state = failureOrRepos.fold(
      (f) => StarredReposState.loadFailure(f, state.repos),
      (r) {
        _page++;
        return StarredReposState.loadSuccess(
          r.copyWith(
            entity: [
              ...state.repos.entity,
              ...r.entity,
            ],
          ),
          isNextPageAvailable: r.isNextPageAvailable ?? false,
        );
      },
    );
  }
}
