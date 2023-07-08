import 'package:flutter_github_viewer/src/features/search/infrastructure/search_history_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchHistoryNotifier extends StateNotifier<AsyncValue<List<String>>> {
  SearchHistoryNotifier(this._repository) : super(const AsyncLoading());

  final SearchHistoryRepository _repository;

  void watchSearchTerms({String? filter}) {
    _repository.watchSearchTerms(filter: filter).listen(
      (data) {
        state = AsyncData(data);
      },
      onError: (Object error, StackTrace stackTrace) {
        state = AsyncError(error, stackTrace);
      },
    );
  }

  Future<void> addSearchTerm(String term) => _repository.addSearchTerm(term);
  Future<void> deleteSearchTerm(String term) =>
      _repository.deleteSearchTerm(term);
  Future<void> putSearchTermFirst(String term) =>
      _repository.putSearchTermFirst(term);
}
