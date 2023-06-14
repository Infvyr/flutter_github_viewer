import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class AuthorizationPage extends StatefulWidget {
  const AuthorizationPage({
    super.key,
    required this.authorizationUrl,
    required this.onAuthorizationCodeRedirectAttempt,
  });
  final Uri authorizationUrl;
  final void Function(Uri) onAuthorizationCodeRedirectAttempt;

  @override
  State<AuthorizationPage> createState() => _AuthorizationPageState();
}

class _AuthorizationPageState extends State<AuthorizationPage> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
