import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_github_viewer/src/core/presentation/toasts.dart';
import 'package:flutter_github_viewer/src/features/github/core/domain/github_repo.dart';
import 'package:flutter_github_viewer/src/features/github/core/shared/providers.dart';
import 'package:flutter_github_viewer/src/features/github/detail/application/repo_detail_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shimmer/shimmer.dart';

@RoutePage()
class RepoDetailPage extends ConsumerStatefulWidget {
  const RepoDetailPage({super.key, required this.repo});

  final GithubRepo repo;

  @override
  ConsumerState<RepoDetailPage> createState() => _RepoDetailPageState();
}

class _RepoDetailPageState extends ConsumerState<RepoDetailPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(repoDetailNotifierProvider.notifier).getRepoDetail(widget.repo.fullName);
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(repoDetailNotifierProvider);
    ref.listen<RepoDetailState>(repoDetailNotifierProvider, (prevState, nextState) {
      state.maybeMap(
          orElse: () {},
          loadSuccess: (state) {
            if (!state.repoDetail.isFresh) {
              showNoConnectionToast(context, "You're now offline. Some information may be outdated.");
            }
          });
    });

    return WillPopScope(
      onWillPop: () async {
        if (state.hasStarredStatusChanged) {
          ref.read(starredReposNotifierProvider.notifier).getFirstStarredReposPage();
        }
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey[100],
          elevation: 5,
          title: Row(
            children: [
              Hero(
                tag: widget.repo.fullName,
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  backgroundImage: CachedNetworkImageProvider(widget.repo.owner.avatarUrlSmall),
                  radius: 16,
                ),
              ),
              const SizedBox(width: 8),
              Flexible(child: Text(widget.repo.owner.name)),
            ],
          ),
          actions: [
            state.maybeMap(
              orElse: () => Shimmer.fromColors(
                baseColor: Colors.grey.shade800,
                highlightColor: Colors.grey.shade300,
                child: IconButton(
                  icon: const Icon(Icons.star),
                  disabledColor: Theme.of(context).iconTheme.color,
                  onPressed: null,
                ),
              ),
              loadSuccess: (state) {
                return IconButton(
                  icon: state.repoDetail.isFresh
                      ? state.repoDetail.entity!.starred
                          ? const Icon(Icons.star)
                          : const Icon(Icons.star_outline)
                      : const Icon(Icons.star),
                  onPressed: state.repoDetail.isFresh
                      ? () => ref.read(repoDetailNotifierProvider.notifier).switchStarredStatus(state.repoDetail.entity!)
                      : null,
                );
              },
            ),
          ],
        ),
        body: Center(
          child: Text(widget.repo.description),
        ),
      ),
    );
  }
}
