import 'package:flutter/material.dart';

class CustomSearchBarHistory extends StatelessWidget {
  const CustomSearchBarHistory({
    super.key,
    required this.history,
    required this.pushPageAndPutFirstInHistory,
    required this.clearSearchHistory,
  });

  final List<String> history;
  final void Function(String searchTerm) pushPageAndPutFirstInHistory;
  final void Function(String term) clearSearchHistory;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: history.map(
        (term) {
          return ListTile(
            contentPadding: const EdgeInsets.only(left: 16.0, right: 4.0),
            title: Text(
              term,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            leading: const Icon(Icons.history),
            trailing: IconButton(
              icon: const Icon(Icons.clear),
              onPressed: () => clearSearchHistory(term),
            ),
            onTap: () => pushPageAndPutFirstInHistory(term),
          );
        },
      ).toList(),
    );
  }
}
