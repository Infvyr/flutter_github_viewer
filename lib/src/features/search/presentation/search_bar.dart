import 'package:flutter/material.dart';
import 'package:flutter_github_viewer/src/features/search/shared/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchBar extends ConsumerStatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  ConsumerState<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends ConsumerState<SearchBar> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => ref.read(searchHistoryNotifierProvider.notifier).watchSearchTerms(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
