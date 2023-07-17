// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'repo_detail_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RepoDetailState {
  dynamic get hasStarredStatusChanged => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(dynamic hasStarredStatusChanged) initial,
    required TResult Function(dynamic hasStarredStatusChanged) loadInProgress,
    required TResult Function(Fresh<GithubRepoDetail?> repoDetail,
            dynamic hasStarredStatusChanged)
        loadSuccess,
    required TResult Function(
            GithubFailure failure, dynamic hasStarredStatusChanged)
        loadFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(dynamic hasStarredStatusChanged)? initial,
    TResult? Function(dynamic hasStarredStatusChanged)? loadInProgress,
    TResult? Function(Fresh<GithubRepoDetail?> repoDetail,
            dynamic hasStarredStatusChanged)?
        loadSuccess,
    TResult? Function(GithubFailure failure, dynamic hasStarredStatusChanged)?
        loadFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(dynamic hasStarredStatusChanged)? initial,
    TResult Function(dynamic hasStarredStatusChanged)? loadInProgress,
    TResult Function(Fresh<GithubRepoDetail?> repoDetail,
            dynamic hasStarredStatusChanged)?
        loadSuccess,
    TResult Function(GithubFailure failure, dynamic hasStarredStatusChanged)?
        loadFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadInProgress value) loadInProgress,
    required TResult Function(_LoadSuccess value) loadSuccess,
    required TResult Function(_LoadFailure value) loadFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadInProgress value)? loadInProgress,
    TResult? Function(_LoadSuccess value)? loadSuccess,
    TResult? Function(_LoadFailure value)? loadFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_LoadFailure value)? loadFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RepoDetailStateCopyWith<RepoDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RepoDetailStateCopyWith<$Res> {
  factory $RepoDetailStateCopyWith(
          RepoDetailState value, $Res Function(RepoDetailState) then) =
      _$RepoDetailStateCopyWithImpl<$Res, RepoDetailState>;
  @useResult
  $Res call({dynamic hasStarredStatusChanged});
}

/// @nodoc
class _$RepoDetailStateCopyWithImpl<$Res, $Val extends RepoDetailState>
    implements $RepoDetailStateCopyWith<$Res> {
  _$RepoDetailStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hasStarredStatusChanged = freezed,
  }) {
    return _then(_value.copyWith(
      hasStarredStatusChanged: freezed == hasStarredStatusChanged
          ? _value.hasStarredStatusChanged
          : hasStarredStatusChanged // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res>
    implements $RepoDetailStateCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({dynamic hasStarredStatusChanged});
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$RepoDetailStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hasStarredStatusChanged = freezed,
  }) {
    return _then(_$_Initial(
      hasStarredStatusChanged: freezed == hasStarredStatusChanged
          ? _value.hasStarredStatusChanged!
          : hasStarredStatusChanged,
    ));
  }
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial({this.hasStarredStatusChanged = false});

  @override
  @JsonKey()
  final dynamic hasStarredStatusChanged;

  @override
  String toString() {
    return 'RepoDetailState.initial(hasStarredStatusChanged: $hasStarredStatusChanged)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Initial &&
            const DeepCollectionEquality().equals(
                other.hasStarredStatusChanged, hasStarredStatusChanged));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(hasStarredStatusChanged));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      __$$_InitialCopyWithImpl<_$_Initial>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(dynamic hasStarredStatusChanged) initial,
    required TResult Function(dynamic hasStarredStatusChanged) loadInProgress,
    required TResult Function(Fresh<GithubRepoDetail?> repoDetail,
            dynamic hasStarredStatusChanged)
        loadSuccess,
    required TResult Function(
            GithubFailure failure, dynamic hasStarredStatusChanged)
        loadFailure,
  }) {
    return initial(hasStarredStatusChanged);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(dynamic hasStarredStatusChanged)? initial,
    TResult? Function(dynamic hasStarredStatusChanged)? loadInProgress,
    TResult? Function(Fresh<GithubRepoDetail?> repoDetail,
            dynamic hasStarredStatusChanged)?
        loadSuccess,
    TResult? Function(GithubFailure failure, dynamic hasStarredStatusChanged)?
        loadFailure,
  }) {
    return initial?.call(hasStarredStatusChanged);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(dynamic hasStarredStatusChanged)? initial,
    TResult Function(dynamic hasStarredStatusChanged)? loadInProgress,
    TResult Function(Fresh<GithubRepoDetail?> repoDetail,
            dynamic hasStarredStatusChanged)?
        loadSuccess,
    TResult Function(GithubFailure failure, dynamic hasStarredStatusChanged)?
        loadFailure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(hasStarredStatusChanged);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadInProgress value) loadInProgress,
    required TResult Function(_LoadSuccess value) loadSuccess,
    required TResult Function(_LoadFailure value) loadFailure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadInProgress value)? loadInProgress,
    TResult? Function(_LoadSuccess value)? loadSuccess,
    TResult? Function(_LoadFailure value)? loadFailure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_LoadFailure value)? loadFailure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements RepoDetailState {
  const factory _Initial({final dynamic hasStarredStatusChanged}) = _$_Initial;

  @override
  dynamic get hasStarredStatusChanged;
  @override
  @JsonKey(ignore: true)
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_LoadInProgressCopyWith<$Res>
    implements $RepoDetailStateCopyWith<$Res> {
  factory _$$_LoadInProgressCopyWith(
          _$_LoadInProgress value, $Res Function(_$_LoadInProgress) then) =
      __$$_LoadInProgressCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({dynamic hasStarredStatusChanged});
}

/// @nodoc
class __$$_LoadInProgressCopyWithImpl<$Res>
    extends _$RepoDetailStateCopyWithImpl<$Res, _$_LoadInProgress>
    implements _$$_LoadInProgressCopyWith<$Res> {
  __$$_LoadInProgressCopyWithImpl(
      _$_LoadInProgress _value, $Res Function(_$_LoadInProgress) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hasStarredStatusChanged = freezed,
  }) {
    return _then(_$_LoadInProgress(
      hasStarredStatusChanged: freezed == hasStarredStatusChanged
          ? _value.hasStarredStatusChanged!
          : hasStarredStatusChanged,
    ));
  }
}

/// @nodoc

class _$_LoadInProgress implements _LoadInProgress {
  const _$_LoadInProgress({this.hasStarredStatusChanged = false});

  @override
  @JsonKey()
  final dynamic hasStarredStatusChanged;

  @override
  String toString() {
    return 'RepoDetailState.loadInProgress(hasStarredStatusChanged: $hasStarredStatusChanged)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoadInProgress &&
            const DeepCollectionEquality().equals(
                other.hasStarredStatusChanged, hasStarredStatusChanged));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(hasStarredStatusChanged));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoadInProgressCopyWith<_$_LoadInProgress> get copyWith =>
      __$$_LoadInProgressCopyWithImpl<_$_LoadInProgress>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(dynamic hasStarredStatusChanged) initial,
    required TResult Function(dynamic hasStarredStatusChanged) loadInProgress,
    required TResult Function(Fresh<GithubRepoDetail?> repoDetail,
            dynamic hasStarredStatusChanged)
        loadSuccess,
    required TResult Function(
            GithubFailure failure, dynamic hasStarredStatusChanged)
        loadFailure,
  }) {
    return loadInProgress(hasStarredStatusChanged);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(dynamic hasStarredStatusChanged)? initial,
    TResult? Function(dynamic hasStarredStatusChanged)? loadInProgress,
    TResult? Function(Fresh<GithubRepoDetail?> repoDetail,
            dynamic hasStarredStatusChanged)?
        loadSuccess,
    TResult? Function(GithubFailure failure, dynamic hasStarredStatusChanged)?
        loadFailure,
  }) {
    return loadInProgress?.call(hasStarredStatusChanged);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(dynamic hasStarredStatusChanged)? initial,
    TResult Function(dynamic hasStarredStatusChanged)? loadInProgress,
    TResult Function(Fresh<GithubRepoDetail?> repoDetail,
            dynamic hasStarredStatusChanged)?
        loadSuccess,
    TResult Function(GithubFailure failure, dynamic hasStarredStatusChanged)?
        loadFailure,
    required TResult orElse(),
  }) {
    if (loadInProgress != null) {
      return loadInProgress(hasStarredStatusChanged);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadInProgress value) loadInProgress,
    required TResult Function(_LoadSuccess value) loadSuccess,
    required TResult Function(_LoadFailure value) loadFailure,
  }) {
    return loadInProgress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadInProgress value)? loadInProgress,
    TResult? Function(_LoadSuccess value)? loadSuccess,
    TResult? Function(_LoadFailure value)? loadFailure,
  }) {
    return loadInProgress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_LoadFailure value)? loadFailure,
    required TResult orElse(),
  }) {
    if (loadInProgress != null) {
      return loadInProgress(this);
    }
    return orElse();
  }
}

abstract class _LoadInProgress implements RepoDetailState {
  const factory _LoadInProgress({final dynamic hasStarredStatusChanged}) =
      _$_LoadInProgress;

  @override
  dynamic get hasStarredStatusChanged;
  @override
  @JsonKey(ignore: true)
  _$$_LoadInProgressCopyWith<_$_LoadInProgress> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_LoadSuccessCopyWith<$Res>
    implements $RepoDetailStateCopyWith<$Res> {
  factory _$$_LoadSuccessCopyWith(
          _$_LoadSuccess value, $Res Function(_$_LoadSuccess) then) =
      __$$_LoadSuccessCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Fresh<GithubRepoDetail?> repoDetail, dynamic hasStarredStatusChanged});

  $FreshCopyWith<GithubRepoDetail?, $Res> get repoDetail;
}

/// @nodoc
class __$$_LoadSuccessCopyWithImpl<$Res>
    extends _$RepoDetailStateCopyWithImpl<$Res, _$_LoadSuccess>
    implements _$$_LoadSuccessCopyWith<$Res> {
  __$$_LoadSuccessCopyWithImpl(
      _$_LoadSuccess _value, $Res Function(_$_LoadSuccess) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? repoDetail = null,
    Object? hasStarredStatusChanged = freezed,
  }) {
    return _then(_$_LoadSuccess(
      null == repoDetail
          ? _value.repoDetail
          : repoDetail // ignore: cast_nullable_to_non_nullable
              as Fresh<GithubRepoDetail?>,
      hasStarredStatusChanged: freezed == hasStarredStatusChanged
          ? _value.hasStarredStatusChanged!
          : hasStarredStatusChanged,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $FreshCopyWith<GithubRepoDetail?, $Res> get repoDetail {
    return $FreshCopyWith<GithubRepoDetail?, $Res>(_value.repoDetail, (value) {
      return _then(_value.copyWith(repoDetail: value));
    });
  }
}

/// @nodoc

class _$_LoadSuccess implements _LoadSuccess {
  const _$_LoadSuccess(this.repoDetail, {this.hasStarredStatusChanged = false});

  @override
  final Fresh<GithubRepoDetail?> repoDetail;
  @override
  @JsonKey()
  final dynamic hasStarredStatusChanged;

  @override
  String toString() {
    return 'RepoDetailState.loadSuccess(repoDetail: $repoDetail, hasStarredStatusChanged: $hasStarredStatusChanged)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoadSuccess &&
            (identical(other.repoDetail, repoDetail) ||
                other.repoDetail == repoDetail) &&
            const DeepCollectionEquality().equals(
                other.hasStarredStatusChanged, hasStarredStatusChanged));
  }

  @override
  int get hashCode => Object.hash(runtimeType, repoDetail,
      const DeepCollectionEquality().hash(hasStarredStatusChanged));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoadSuccessCopyWith<_$_LoadSuccess> get copyWith =>
      __$$_LoadSuccessCopyWithImpl<_$_LoadSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(dynamic hasStarredStatusChanged) initial,
    required TResult Function(dynamic hasStarredStatusChanged) loadInProgress,
    required TResult Function(Fresh<GithubRepoDetail?> repoDetail,
            dynamic hasStarredStatusChanged)
        loadSuccess,
    required TResult Function(
            GithubFailure failure, dynamic hasStarredStatusChanged)
        loadFailure,
  }) {
    return loadSuccess(repoDetail, hasStarredStatusChanged);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(dynamic hasStarredStatusChanged)? initial,
    TResult? Function(dynamic hasStarredStatusChanged)? loadInProgress,
    TResult? Function(Fresh<GithubRepoDetail?> repoDetail,
            dynamic hasStarredStatusChanged)?
        loadSuccess,
    TResult? Function(GithubFailure failure, dynamic hasStarredStatusChanged)?
        loadFailure,
  }) {
    return loadSuccess?.call(repoDetail, hasStarredStatusChanged);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(dynamic hasStarredStatusChanged)? initial,
    TResult Function(dynamic hasStarredStatusChanged)? loadInProgress,
    TResult Function(Fresh<GithubRepoDetail?> repoDetail,
            dynamic hasStarredStatusChanged)?
        loadSuccess,
    TResult Function(GithubFailure failure, dynamic hasStarredStatusChanged)?
        loadFailure,
    required TResult orElse(),
  }) {
    if (loadSuccess != null) {
      return loadSuccess(repoDetail, hasStarredStatusChanged);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadInProgress value) loadInProgress,
    required TResult Function(_LoadSuccess value) loadSuccess,
    required TResult Function(_LoadFailure value) loadFailure,
  }) {
    return loadSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadInProgress value)? loadInProgress,
    TResult? Function(_LoadSuccess value)? loadSuccess,
    TResult? Function(_LoadFailure value)? loadFailure,
  }) {
    return loadSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_LoadFailure value)? loadFailure,
    required TResult orElse(),
  }) {
    if (loadSuccess != null) {
      return loadSuccess(this);
    }
    return orElse();
  }
}

abstract class _LoadSuccess implements RepoDetailState {
  const factory _LoadSuccess(final Fresh<GithubRepoDetail?> repoDetail,
      {final dynamic hasStarredStatusChanged}) = _$_LoadSuccess;

  Fresh<GithubRepoDetail?> get repoDetail;
  @override
  dynamic get hasStarredStatusChanged;
  @override
  @JsonKey(ignore: true)
  _$$_LoadSuccessCopyWith<_$_LoadSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_LoadFailureCopyWith<$Res>
    implements $RepoDetailStateCopyWith<$Res> {
  factory _$$_LoadFailureCopyWith(
          _$_LoadFailure value, $Res Function(_$_LoadFailure) then) =
      __$$_LoadFailureCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({GithubFailure failure, dynamic hasStarredStatusChanged});

  $GithubFailureCopyWith<$Res> get failure;
}

/// @nodoc
class __$$_LoadFailureCopyWithImpl<$Res>
    extends _$RepoDetailStateCopyWithImpl<$Res, _$_LoadFailure>
    implements _$$_LoadFailureCopyWith<$Res> {
  __$$_LoadFailureCopyWithImpl(
      _$_LoadFailure _value, $Res Function(_$_LoadFailure) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failure = null,
    Object? hasStarredStatusChanged = freezed,
  }) {
    return _then(_$_LoadFailure(
      null == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as GithubFailure,
      hasStarredStatusChanged: freezed == hasStarredStatusChanged
          ? _value.hasStarredStatusChanged!
          : hasStarredStatusChanged,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $GithubFailureCopyWith<$Res> get failure {
    return $GithubFailureCopyWith<$Res>(_value.failure, (value) {
      return _then(_value.copyWith(failure: value));
    });
  }
}

/// @nodoc

class _$_LoadFailure implements _LoadFailure {
  const _$_LoadFailure(this.failure, {this.hasStarredStatusChanged = false});

  @override
  final GithubFailure failure;
  @override
  @JsonKey()
  final dynamic hasStarredStatusChanged;

  @override
  String toString() {
    return 'RepoDetailState.loadFailure(failure: $failure, hasStarredStatusChanged: $hasStarredStatusChanged)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoadFailure &&
            (identical(other.failure, failure) || other.failure == failure) &&
            const DeepCollectionEquality().equals(
                other.hasStarredStatusChanged, hasStarredStatusChanged));
  }

  @override
  int get hashCode => Object.hash(runtimeType, failure,
      const DeepCollectionEquality().hash(hasStarredStatusChanged));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoadFailureCopyWith<_$_LoadFailure> get copyWith =>
      __$$_LoadFailureCopyWithImpl<_$_LoadFailure>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(dynamic hasStarredStatusChanged) initial,
    required TResult Function(dynamic hasStarredStatusChanged) loadInProgress,
    required TResult Function(Fresh<GithubRepoDetail?> repoDetail,
            dynamic hasStarredStatusChanged)
        loadSuccess,
    required TResult Function(
            GithubFailure failure, dynamic hasStarredStatusChanged)
        loadFailure,
  }) {
    return loadFailure(failure, hasStarredStatusChanged);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(dynamic hasStarredStatusChanged)? initial,
    TResult? Function(dynamic hasStarredStatusChanged)? loadInProgress,
    TResult? Function(Fresh<GithubRepoDetail?> repoDetail,
            dynamic hasStarredStatusChanged)?
        loadSuccess,
    TResult? Function(GithubFailure failure, dynamic hasStarredStatusChanged)?
        loadFailure,
  }) {
    return loadFailure?.call(failure, hasStarredStatusChanged);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(dynamic hasStarredStatusChanged)? initial,
    TResult Function(dynamic hasStarredStatusChanged)? loadInProgress,
    TResult Function(Fresh<GithubRepoDetail?> repoDetail,
            dynamic hasStarredStatusChanged)?
        loadSuccess,
    TResult Function(GithubFailure failure, dynamic hasStarredStatusChanged)?
        loadFailure,
    required TResult orElse(),
  }) {
    if (loadFailure != null) {
      return loadFailure(failure, hasStarredStatusChanged);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadInProgress value) loadInProgress,
    required TResult Function(_LoadSuccess value) loadSuccess,
    required TResult Function(_LoadFailure value) loadFailure,
  }) {
    return loadFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadInProgress value)? loadInProgress,
    TResult? Function(_LoadSuccess value)? loadSuccess,
    TResult? Function(_LoadFailure value)? loadFailure,
  }) {
    return loadFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_LoadFailure value)? loadFailure,
    required TResult orElse(),
  }) {
    if (loadFailure != null) {
      return loadFailure(this);
    }
    return orElse();
  }
}

abstract class _LoadFailure implements RepoDetailState {
  const factory _LoadFailure(final GithubFailure failure,
      {final dynamic hasStarredStatusChanged}) = _$_LoadFailure;

  GithubFailure get failure;
  @override
  dynamic get hasStarredStatusChanged;
  @override
  @JsonKey(ignore: true)
  _$$_LoadFailureCopyWith<_$_LoadFailure> get copyWith =>
      throw _privateConstructorUsedError;
}
