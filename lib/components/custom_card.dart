import 'package:flutter/material.dart';

import '../themes/default_theme.dart';

class CustomCard extends StatelessWidget {
  final String titulo;
  final String contenido;

  const CustomCard({
    Key? key,required this.titulo,required this.contenido,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              titulo,
              style: DefaultTheme.base.textTheme.headline3,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              contenido,
              style: DefaultTheme.base.textTheme.bodyText1,
            ),
          ],
        ),
      ),
    );
  }
}
