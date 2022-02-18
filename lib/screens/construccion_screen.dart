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
        child: Column(children: [Text('Sitio en construcción'),Image.asset(icoConstruccion)]),
      ),
    );
  }
}