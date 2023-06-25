import 'package:dio/dio.dart';
import 'package:flutter_github_viewer/src/features/auth/application/auth_notifier.dart';
import 'package:flutter_github_viewer/src/features/auth/infrastructure/credentials_storage/credentials_storage.dart';
import 'package:flutter_github_viewer/src/features/auth/infrastructure/credentials_storage/secure_credentials_storage.dart';
import 'package:flutter_github_viewer/src/features/auth/infrastructure/github_authenticator.dart';
import 'package:flutter_github_viewer/src/features/auth/infrastructure/oauth2_interceptor.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final flutterSecureStorageProvider =
    Provider((ref) => const FlutterSecureStorage());

final dioForAuthProvider = Provider((ref) => Dio());

final oAuth2InterceptorProvider = Provider(
(ref) => OAuth2Interceptor(
    ref.watch(githubAuthenticatorProvider),
    ref.watch(authNotifierProvider.notifier),
    ref.watch(dioForAuthProvider),
  ),
);

final credentialsStorageProvider = Provider<CredentialsStorage>(
  (ref) => SecureCredentialsStorage(
    ref.watch(flutterSecureStorageProvider),
  ),
);

final githubAuthenticatorProvider = Provider(
  (ref) => GithubAuthenticator(
    ref.watch(credentialsStorageProvider),
    ref.watch(dioForAuthProvider),
  ),
);

final authNotifierProvider = StateNotifierProvider<AuthNotifier, AuthState>(
  (ref) => AuthNotifier(
    ref.watch(githubAuthenticatorProvider),
  ),
);
