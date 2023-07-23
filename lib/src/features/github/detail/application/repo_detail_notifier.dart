import 'package:flutter_github_viewer/src/core/domain/fresh.dart';
import 'package:flutter_github_viewer/src/features/github/core/domain/github_failure.dart';
import 'package:flutter_github_viewer/src/features/github/detail/domain/github_repo_detail.dart';
import 'package:flutter_github_viewer/src/features/github/detail/infrastructure/repo_detail_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'repo_detail_notifier.freezed.dart';

@freezed
class RepoDetailState with _$RepoDetailState {
  const factory RepoDetailState.initial({
    @Default(false) hasStarredStatusChanged,
  }) = _Initial;
  const factory RepoDetailState.loadInProgress({
    @Default(false) hasStarredStatusChanged,
  }) = _LoadInProgress;
  const factory RepoDetailState.loadSuccess(
    Fresh<GithubRepoDetail?> repoDetail, {
    @Default(false) hasStarredStatusChanged,
  }) = _LoadSuccess;
  const factory RepoDetailState.loadFailure(
    GithubFailure failure, {
    @Default(false) hasStarredStatusChanged,
  }) = _LoadFailure;
}

class RepoDetailNotifier extends StateNotifier<RepoDetailState> {
  RepoDetailNotifier(this._repository) : super(const RepoDetailState.initial());

  final RepoDetailRepository _repository;

  Future<void> getRepoDetail(String fullRepoName) async {
    state = const RepoDetailState.loadInProgress();
    final failureOrRepoDetail = await _repository.getRepoDetail(fullRepoName);
    state = failureOrRepoDetail.fold(
      (l) => RepoDetailState.loadFailure(l),
      (r) => RepoDetailState.loadSuccess(r),
    );
  }

  Future<void> switchStarredStatus(GithubRepoDetail repoDetail) async {
    state.maybeMap(
      orElse: () {},
      loadSuccess: (successState) async {
        final stateCopy = successState.copyWith();
        final repoDetail = successState.repoDetail.entity;
        if (repoDetail != null) {
          state = successState.copyWith.repoDetail(
            entity: repoDetail.copyWith(
              starred: !repoDetail.starred,
            ),
          );
          final failureOrSuccess = await _repository.switchStarredStatus(repoDetail);
          failureOrSuccess.fold(
            (l) => state = stateCopy,
            (r) => r == null ? state = stateCopy : state = state.copyWith(hasStarredStatusChanged: true),
          );
        }
      },
    );
  }
}
