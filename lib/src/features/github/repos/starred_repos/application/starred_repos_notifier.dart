import 'package:flutter_github_viewer/src/features/github/repos/core/application/paginated_repos_notifier.dart';
import 'package:flutter_github_viewer/src/features/github/repos/starred_repos/infrastructure/starred_repos_repository.dart';

class StarredReposNotifier extends PaginatedReposNotifier {
  StarredReposNotifier(this._repository);

  final PaginatedReposRepository _repository;

  Future<void> getNextStarredReposPage() async {
    super.getNextPage((page) => _repository.getStarredReposPage(page));
  }
}
