import 'package:flutter_github_viewer/src/features/github/core/domain/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'github_repo.freezed.dart';

@freezed
class GithubRepo with _$GithubRepo {
  const GithubRepo._();

  const factory GithubRepo({
    required User owner,
    required String name,
    required String description,
    required int stargazersCount,
  }) = _GithubRepo;

  String get fullName => '${owner.name}/$name';

  int get descriptionLength => description.length;
}
