import 'package:flutter_github_viewer/src/features/github/repos/core/application/paginated_repos_notifier.dart';
import 'package:flutter_github_viewer/src/features/github/repos/searched_repos/infrastructure/searched_repos_repository.dart';

class SearchedReposNotifier extends PaginatedReposNotifier {
  SearchedReposNotifier(this._repository);

  final SearchedReposRepository _repository;

  Future<void> getFirstSearchedReposPage(String query) async {
    super.resetState();
    await getNextSearchedReposPage(query);
  }

  Future<void> getNextSearchedReposPage(String query) async {
    super.getNextPage((page) => _repository.getSearchedReposPage(query, page));
  }
}
