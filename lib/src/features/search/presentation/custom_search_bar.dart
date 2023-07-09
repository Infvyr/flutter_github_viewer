import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_github_viewer/src/features/search/presentation/custom_search_bar_empty.dart';
import 'package:flutter_github_viewer/src/features/search/presentation/custom_search_bar_history.dart';
import 'package:flutter_github_viewer/src/features/search/shared/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

class CustomSearchBar extends ConsumerStatefulWidget {
  const CustomSearchBar({
    super.key,
    required this.body,
    required this.title,
    required this.hintText,
    required this.onShouldNavigateToResultPage,
    this.action,
  });

  final Widget body;
  final String title;
  final String hintText;
  final void Function(String searchTerm) onShouldNavigateToResultPage;
  final Widget? action;

  @override
  ConsumerState<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends ConsumerState<CustomSearchBar> {
  late FloatingSearchBarController controller = FloatingSearchBarController();

  @override
  void initState() {
    super.initState();
    Future.microtask(() => watchSearchTerms);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void watchSearchTerms(String? query) {
    ref.read(searchHistoryNotifierProvider.notifier).watchSearchTerms(filter: query);
  }

  @override
  Widget build(BuildContext context) {
    void pushPageAndPutFirstInHistory(String searchTerm) {
      ref.read(searchHistoryNotifierProvider.notifier).putSearchTermFirst(searchTerm);
      widget.onShouldNavigateToResultPage(searchTerm);
      controller.close();
    }

    void pushPageAndAddToHistory(String searchTerm) {
      ref.read(searchHistoryNotifierProvider.notifier).addSearchTerm(searchTerm);
      widget.onShouldNavigateToResultPage(searchTerm);
      controller.close();
    }

    void clearSearchHistory(String term) {
      ref.read(searchHistoryNotifierProvider.notifier).deleteSearchTerm(term);
    }

    return FloatingSearchBar(
      automaticallyImplyBackButton: false,
      controller: controller,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            widget.title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Text(
            'Tap to search 👆',
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
      hint: widget.hintText,
      body: FloatingSearchBarScrollNotifier(
        child: widget.body,
      ),
      leadingActions: [
        if ((Platform.isIOS || Platform.isMacOS) &&
            AutoRouter.of(context).canPop(
              ignoreChildRoutes: true,
              ignoreParentRoutes: true,
              ignorePagelessRoutes: true,
            ))
          IconButton(
            onPressed: () => AutoRouter.of(context).pop(),
            icon: const Icon(Icons.arrow_back_ios),
          )
        else if (AutoRouter.of(context).canPop(
          ignoreChildRoutes: true,
          ignoreParentRoutes: true,
          ignorePagelessRoutes: true,
        ))
          IconButton(
            onPressed: () => AutoRouter.of(context).pop(),
            icon: const Icon(Icons.arrow_back),
          ),
      ],
      actions: [
        FloatingSearchBarAction.searchToClear(showIfClosed: false),
        FloatingSearchBarAction(child: widget.action),
      ],
      onSubmitted: (query) => pushPageAndAddToHistory(query),
      onQueryChanged: (query) => watchSearchTerms(query),
      builder: (context, transition) {
        return Material(
          elevation: 4.0,
          borderRadius: const BorderRadius.all(Radius.circular(4.0)),
          color: Theme.of(context).colorScheme.surface,
          child: Consumer(
            builder: (context, ref, child) {
              final searchHistoryState = ref.watch(searchHistoryNotifierProvider);

              return searchHistoryState.map(
                data: (history) {
                  if (history.value.isEmpty && controller.query.isEmpty) {
                    return const CustomSearchBarEmpty();
                  } else if (history.value.isEmpty) {
                    return ListTile(
                      title: Text(controller.query),
                      leading: const Icon(Icons.search),
                      onTap: () => pushPageAndAddToHistory(controller.query),
                    );
                  }
                  return CustomSearchBarHistory(
                    history: history.value,
                    pushPageAndPutFirstInHistory: pushPageAndPutFirstInHistory,
                    clearSearchHistory: clearSearchHistory,
                  );
                },
                loading: (_) => const SizedBox(),
                error: (_) => ListTile(
                  title: Text('Unexpected error occurred ${_.error}'),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
