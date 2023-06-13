import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class StarredReposPage extends StatelessWidget {
  const StarredReposPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            AutoRouter.of(context).pushNamed('/sign-in');
          },
          child: const Text('Sign In'),
        ),
      ),
    );
  }
}
