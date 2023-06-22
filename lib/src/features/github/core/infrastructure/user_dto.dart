// ignore_for_file: invalid_annotation_target

import 'package:flutter_github_viewer/src/features/github/core/domain/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_dto.freezed.dart';
part 'user_dto.g.dart';

@freezed
class UserDTO with _$UserDTO {
  const UserDTO._();
  const factory UserDTO({
    @JsonKey(name: 'login') required String name,
    @JsonKey(name: 'avatar_url') required String avatarUrl,
  }) = _UserDTO;

  factory UserDTO.fromJson(Map<String, dynamic> json) =>
      _$UserDTOFromJson(json);

  factory UserDTO.fromDomain(UserDTO user) => UserDTO(
        name: user.name,
        avatarUrl: user.avatarUrl,
      );

  User toDomain() {
    return User(
      name: name,
      avatarUrl: avatarUrl,
    );
  }
}
