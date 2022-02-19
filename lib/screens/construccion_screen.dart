import 'package:flutter/material.dart';

import '../themes/default_theme.dart';

class ConstruccionScreen extends StatelessWidget {
  static const String routerName = 'construccion';
  const ConstruccionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage(imgFondo), fit: BoxFit.fill),
        ),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            'Sección en construcción',
            style: DefaultTheme.base.textTheme.headline1,
            textAlign: TextAlign.center,
          ),
          Image.asset(
            icoConstruccion,
            width: 200,
          )
        ]),
      ),
    );
  }
}
