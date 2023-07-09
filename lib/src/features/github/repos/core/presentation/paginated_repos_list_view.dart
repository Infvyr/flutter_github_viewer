import 'package:flutter/material.dart';
import 'package:flutter_github_viewer/src/core/presentation/toasts.dart';
import 'package:flutter_github_viewer/src/features/github/core/presentation/no_results.dart';
import 'package:flutter_github_viewer/src/features/github/repos/core/application/paginated_repos_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

import 'failure_repo_tile.dart';
import 'loading_repo_tile.dart';
import 'repo_tile.dart';

class PaginatedReposListView extends StatefulWidget {
  const PaginatedReposListView({
    super.key,
    required this.paginatedReposNotifierProvider,
    required this.getNextPage,
    required this.noResultMessage,
  });

  final AutoDisposeStateNotifierProvider<PaginatedReposNotifier,
      PaginatedReposState> paginatedReposNotifierProvider;
  final void Function(WidgetRef ref) getNextPage;
  final String noResultMessage;

  @override
  State<PaginatedReposListView> createState() => _PaginatedReposListViewState();
}

class _PaginatedReposListViewState extends State<PaginatedReposListView> {
  bool canLoadNextPage = false;
  bool hasAlreadyShownNoConnectionToast = false;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final state = ref.watch(widget.paginatedReposNotifierProvider);
        ref.listen<PaginatedReposState>(
          widget.paginatedReposNotifierProvider,
          (_, state) {
            state.map(
              initial: (_) => canLoadNextPage = true,
              loadInProgress: (_) => canLoadNextPage = false,
              loadSuccess: (_) {
                if (!_.repos.isFresh && !hasAlreadyShownNoConnectionToast) {
                  hasAlreadyShownNoConnectionToast = true;
                  showNoConnectionToast(
                    context,
                    "You're offline. Some information may be outdated.",
                  );
                }
                canLoadNextPage = _.isNextPageAvailable;
              },
              loadFailure: (_) => canLoadNextPage = false,
            );
          },
        );

        return NotificationListener<ScrollNotification>(
          onNotification: (notification) {
            final metrics = notification.metrics;
            final limit =
                metrics.maxScrollExtent - metrics.viewportDimension / 3;
            if (canLoadNextPage && metrics.pixels >= limit) {
              canLoadNextPage = false;
              widget.getNextPage(ref);
            }
            return false;
          },
          child: state.maybeWhen(
            loadSuccess: (repos, _) => repos.entity.isEmpty,
            orElse: () => false,
          )
              ? NoResultDisplay(message: widget.noResultMessage)
              : _PaginatedListView(state: state),
        );
      },
    );
  }
}

class _PaginatedListView extends StatelessWidget {
  const _PaginatedListView({Key? key, required this.state}) : super(key: key);

  final PaginatedReposState state;

  @override
  Widget build(BuildContext context) {
    final fsb = FloatingSearchBar.of(context)?.widget;
    final topPadding = fsb?.height;
    final safeAreaPadding = MediaQuery.of(context).padding.top;

    return ListView.builder(
      padding: fsb == null
          ? EdgeInsets.zero
          : EdgeInsets.only(
              top: topPadding! + safeAreaPadding + 10.0,
            ),
      itemCount: state.map(
        initial: (_) => 0,
        loadInProgress: (_) => _.repos.entity.length + _.itemsPerPage,
        loadSuccess: (_) => _.repos.entity.length,
        loadFailure: (_) => _.repos.entity.length + 1,
      ),
      itemBuilder: (context, index) {
        return state.map(
          initial: (_) => const SizedBox(),
          loadInProgress: (_) {
            if (index < _.repos.entity.length) {
              return RepoTile(repo: _.repos.entity[index]);
            } else {
              return const LoadingRepoTile();
            }
          },
          loadSuccess: (_) => RepoTile(repo: _.repos.entity[index]),
          loadFailure: (_) => FailureRepoTile(failure: _.failure),
        );
      },
    );
  }
}
