import 'package:flutter/material.dart';

import '../themes/default_theme.dart';

class CardTitleSubtitle extends StatelessWidget {
  final String title;
  final String subtitle;
  const CardTitleSubtitle({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
      title: Text(title),
      subtitle: Text(
        subtitle,
        style: DefaultTheme.base.textTheme.subtitle1,
      ),
    ));
  }
}