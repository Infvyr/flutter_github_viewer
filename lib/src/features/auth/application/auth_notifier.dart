import 'package:flutter_github_viewer/src/features/auth/domain/auth_failure.dart';
import 'package:flutter_github_viewer/src/features/auth/infrastructure/github_authenticator.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'auth_notifier.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;
  const factory AuthState.unauthenticated() = _Unauthenticated;
  const factory AuthState.authenticated() = _Authenticated;
  const factory AuthState.failure(AuthFailure failure) = _Failure;
}

typedef AuthUriCallback = Future<Uri> Function(Uri authorizationUrl);

class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier(this._authenticator) : super(const AuthState.initial());

  final GithubAuthenticator _authenticator;

  Future<void> checkAndUpdateAuthStatus() async {
    final isSignedIn = await _authenticator.isSignedIn();
    state = isSignedIn
        ? const AuthState.authenticated()
        : const AuthState.unauthenticated();
  }

  Future<void> signIn(AuthUriCallback authorizationCallback) async {
    final grant = _authenticator.createGrant();
    final redirectUrl =
        await authorizationCallback(_authenticator.getAuthorizationUrl(grant));
    final failureOrSuccess = await _authenticator.handleAuthorizationResponse(
      grant,
      redirectUrl.queryParameters,
    );
    state = failureOrSuccess.fold(
      (failure) => AuthState.failure(failure),
      (_) => const AuthState.authenticated(),
    );
    grant.close();
  }

  Future<void> signOut() async {
    final failureOrSuccess = await _authenticator.signOut();
    state = failureOrSuccess.fold(
      (failure) => AuthState.failure(failure),
      (_) => const AuthState.unauthenticated(),
    );
  }
}
