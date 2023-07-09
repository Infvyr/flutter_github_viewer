import 'package:flutter/material.dart';

class CustomSearchBarEmpty extends StatelessWidget {
  const CustomSearchBarEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: kToolbarHeight,
      child: Text(
        'No search history',
        style: Theme.of(context).textTheme.bodySmall,
      ),
    );
  }
}
