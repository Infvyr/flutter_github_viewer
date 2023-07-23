import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_github_viewer/src/core/presentation/routes/app_router.gr.dart';
import 'package:flutter_github_viewer/src/features/search/presentation/custom_search_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_github_viewer/src/features/auth/shared/providers.dart';
import 'package:flutter_github_viewer/src/features/github/core/shared/providers.dart';
import 'package:flutter_github_viewer/src/features/github/repos/core/presentation/paginated_repos_list_view.dart';

@RoutePage()
class SearchedReposPage extends ConsumerStatefulWidget {
  const SearchedReposPage({
    super.key,
    required this.searchTerm,
  });

  final String searchTerm;

  @override
  ConsumerState<SearchedReposPage> createState() => _SearchedReposPageState();
}

class _SearchedReposPageState extends ConsumerState<SearchedReposPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => ref.read(searchedReposNotifierProvider.notifier).getFirstSearchedReposPage(widget.searchTerm),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomSearchBar(
        title: 'Starred Repos',
        hintText: 'Search all repositories...',
        onShouldNavigateToResultPage: (searchTerm) {
          AutoRouter.of(context).pushAndPopUntil(
            SearchedReposRoute(searchTerm: searchTerm),
            predicate: (route) => route.settings.name == StarredReposRoute.name,
          );
        },
        action: IconButton(
          onPressed: () => ref.read(authNotifierProvider.notifier).signOut(),
          icon: const Icon(Icons.logout),
        ),
        body: PaginatedReposListView(
          paginatedReposNotifierProvider: searchedReposNotifierProvider,
          getNextPage: (ref) => ref.read(searchedReposNotifierProvider.notifier).getNextSearchedReposPage(widget.searchTerm),
          noResultMessage: "This is all we could find. Try another search term.",
        ),
      ),
    );
  }
}
