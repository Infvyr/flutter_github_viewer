import 'package:flutter_github_viewer/src/core/infrastructure/sembast_database.dart';
import 'package:flutter_github_viewer/src/features/github/core/infrastructure/github_headers.dart';
import 'package:sembast/sembast.dart';

class GithubHeadersCache {
  GithubHeadersCache(this._sembastDatabase);

  final SembastDatabase _sembastDatabase;

  final _store = stringMapStoreFactory.store('headers');

  Future<void> save(Uri uri, GithubHeaders headers) async {
    await _store
        .record(uri.toString())
        .put(_sembastDatabase.instance, headers.toJson());
  }

  Future<GithubHeaders?> get(Uri uri) async {
    final json =
        await _store.record(uri.toString()).get(_sembastDatabase.instance);
    return json == null ? null : GithubHeaders.fromJson(json);
  }

  Future<void> delete(Uri uri) async {
    await _store.record(uri.toString()).delete(_sembastDatabase.instance);
  }
}
