import 'package:flutter_github_viewer/src/core/shared/providers.dart';
import 'package:flutter_github_viewer/src/features/search/application/search_history_notifier.dart';
import 'package:flutter_github_viewer/src/features/search/infrastructure/search_history_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final searchHistoryRepositoryProvider = Provider(
  (ref) => SearchHistoryRepository(ref.watch(sembastProvider)),
);

final searchHistoryNotifierProvider =
    StateNotifierProvider<SearchHistoryNotifier, AsyncValue<List<String>>>(
  (ref) => SearchHistoryNotifier(ref.watch(searchHistoryRepositoryProvider)),
);
