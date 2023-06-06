import 'package:flutter/services.dart';
import 'package:flutter_github_viewer/src/features/auth/infrastructure/credentials_storage/credentials_storage.dart';
import 'package:oauth2/oauth2.dart';

class GithubAuthenticator {
  GithubAuthenticator(this._credentialsStorage);

  final CredentialsStorage _credentialsStorage;

  static const clientId = 'fdfd93229a852efc9b33';
  static const clientSecret = 'f392c19595ee987bf1105965fb988ed847af7def';
  static const scopes = ['read:user', 'repo'];

  static final authorizationEndpoint =
      Uri.parse('https://github.com/login/oauth/authorize');
  static final tokenEndpoint =
      Uri.parse('https://github.com/login/oauth/access_token');
  static final redirectUrl = Uri.parse('http://localhost:3000/callback');

  Future<Credentials?> getSignedInCredentials() async {
    try {
      final storedCredentials = await _credentialsStorage.read();
      if (storedCredentials != null) {
        if (storedCredentials.canRefresh && storedCredentials.isExpired) {
          // TODO: Refresh the credentials
        }
      }
      return storedCredentials;
    } on PlatformException {
      return null;
    }
  }

  Future<bool> isSignedIn() =>
      getSignedInCredentials().then((credentials) => credentials != null);

  AuthorizationCodeGrant _createGrant() {
    return AuthorizationCodeGrant(
      clientId,
      authorizationEndpoint,
      tokenEndpoint,
      secret: clientSecret,
    );
  }

  Uri getAuthorizationUrl(AuthorizationCodeGrant grant) {
    return grant.getAuthorizationUrl(redirectUrl, scopes: scopes);
  }
}
