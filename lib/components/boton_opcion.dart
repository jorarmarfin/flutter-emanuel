import 'package:flutter/material.dart';

import '../themes/default_theme.dart';

class BotonOpcion extends StatelessWidget {
  final String botonIcono;
  final String botonNombre;
  final String routeName;
  const BotonOpcion({
    Key? key,
    required this.botonIcono,
    required this.botonNombre,
    required this.routeName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, routeName);
      },
      child: Container(
        margin: const EdgeInsets.all(7.0),
        padding: const EdgeInsets.symmetric(vertical: 15.0),
        decoration: estiloBoton(colorAmarillo),
        child: Column(
          children: [
            Image.asset(
              botonIcono,
              width: 50,
              height: 50,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              botonNombre,
              style: DefaultTheme.base.textTheme.subtitle1,
            )
          ],
        ),
      ),
    );
  }
}