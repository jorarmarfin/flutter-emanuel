import 'package:flutter/material.dart';

import '../themes/default_theme.dart';

class EmanuelInfoScreen extends StatelessWidget {
  static String routerName = 'emanuel-info';

  const EmanuelInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sobre Emanuel')),
      body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image:
                DecorationImage(image: AssetImage(imgFondo), fit: BoxFit.fill),
          ),
          child: Text('data')),
    );
  }
}
