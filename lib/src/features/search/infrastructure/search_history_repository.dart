import 'package:flutter_github_viewer/src/core/infrastructure/sembast_database.dart';
import 'package:sembast/sembast.dart';

class SearchHistoryRepository {
  SearchHistoryRepository(this._sembastDatabase);

  final SembastDatabase _sembastDatabase;

  final _store = StoreRef<int, String>('searchHistory');

  static const historyLength = 10;

  Filter _filterBy(String term) => Filter.custom((record) => record.value == term);

  Stream<List<String>> watchSearchTerms({String? filter}) {
    return _store
        .query(
          finder: filter != null && filter.isNotEmpty
              ? Finder(
                  filter: Filter.custom(
                    (record) => (record.value as String).toLowerCase().startsWith(filter),
                  ),
                )
              : null,
        )
        .onSnapshots(_sembastDatabase.instance)
        .map((records) => records.reversed.map((e) => e.value).toList());
  }

  Future<void> addSearchTerm(String term) => _addSearchTerm(term, _sembastDatabase.instance);

  Future<void> deleteSearchTerm(String term) => _deleteSearchTerm(term, _sembastDatabase.instance);

  Future<void> putSearchTermFirst(String term) async {
    await _sembastDatabase.instance.transaction((transaction) async {
      await _deleteSearchTerm(term, transaction);
      await _addSearchTerm(term, transaction);
    });
  }

  Future<void> _addSearchTerm(String term, DatabaseClient dbClient) async {
    final existingKey = await _store.findKey(
      dbClient,
      finder: Finder(
        filter: _filterBy(term),
      ),
    );

    if (existingKey != null) {
      putSearchTermFirst(term);
      return;
    }

    await _store.add(dbClient, term);
    final count = await _store.count(dbClient);
    if (count > historyLength) {
      await _store.delete(
        dbClient,
        finder: Finder(limit: count - historyLength),
      );
    }
  }

  Future<void> _deleteSearchTerm(String term, DatabaseClient dbClient) async {
    await _store.delete(
      dbClient,
      finder: Finder(filter: _filterBy(term)),
    );
  }
}
