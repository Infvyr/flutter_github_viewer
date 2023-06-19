// ignore_for_file: invalid_annotation_target

import 'package:flutter_github_viewer/src/features/github/core/infrastructure/user_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'github_repo_dto.freezed.dart';
part 'github_repo_dto.g.dart';

String _descriptionFromJson(Object? json) {
  return (json as String?) ?? '';
}

@freezed
class GithubRepoDTO with _$GithubRepoDTO {
  const GithubRepoDTO._();
  const factory GithubRepoDTO({
    required UserDTO owner,
    required String name,
    @JsonKey(fromJson: _descriptionFromJson) required String description,
    @JsonKey(name: 'stargazers_count') required int stargazersCount,
  }) = _GithubRepoDTO;

  factory GithubRepoDTO.fromJson(Map<String, dynamic> json) =>
      _$GithubRepoDTOFromJson(json);

  factory GithubRepoDTO.fromDomain(GithubRepoDTO repo) => GithubRepoDTO(
        owner: UserDTO.fromDomain(repo.owner),
        name: repo.name,
        description: repo.description,
        stargazersCount: repo.stargazersCount,
      );

  GithubRepoDTO toDomain() {
    return GithubRepoDTO(
      owner: owner.toDomain(),
      name: name,
      description: description,
      stargazersCount: stargazersCount,
    );
  }
}
