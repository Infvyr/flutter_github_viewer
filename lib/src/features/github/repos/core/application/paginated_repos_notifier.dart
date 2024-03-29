import 'package:dartz/dartz.dart';
import 'package:flutter_github_viewer/src/core/domain/fresh.dart';
import 'package:flutter_github_viewer/src/features/github/core/domain/github_failure.dart';
import 'package:flutter_github_viewer/src/features/github/core/domain/github_repo.dart';
import 'package:flutter_github_viewer/src/features/github/core/infrastructure/pagination_config.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'paginated_repos_notifier.freezed.dart';

typedef RepositoryGetter
    = Future<Either<GithubFailure, Fresh<List<GithubRepo>>>> Function(int page);

@freezed
class PaginatedReposState with _$PaginatedReposState {
  const PaginatedReposState._();
  const factory PaginatedReposState.initial(Fresh<List<GithubRepo>> repos) =
      _Initial;
  const factory PaginatedReposState.loadInProgress(
    Fresh<List<GithubRepo>> repos,
    int itemsPerPage,
  ) = _LoadInProgress;
  const factory PaginatedReposState.loadSuccess(Fresh<List<GithubRepo>> repos,
      {required bool isNextPageAvailable}) = _LoadSuccess;
  const factory PaginatedReposState.loadFailure(
    GithubFailure failure,
    Fresh<List<GithubRepo>> repos,
  ) = _LoadFailure;
}

class PaginatedReposNotifier extends StateNotifier<PaginatedReposState> {
  PaginatedReposNotifier() : super(PaginatedReposState.initial(Fresh.yes([])));

  int _page = 1;

  @protected
  void resetState() {
    _page = 1;
    state = PaginatedReposState.initial(Fresh.yes([]));
  }

  @protected
  Future<void> getNextPage(RepositoryGetter getter) async {
    state = PaginatedReposState.loadInProgress(
      state.repos,
      PaginationConfig.itemsPerPage,
    );

    final failureOrRepos = await getter(_page);
    state = failureOrRepos.fold(
      (f) => PaginatedReposState.loadFailure(f, state.repos),
      (r) {
        _page++;
        return PaginatedReposState.loadSuccess(
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
