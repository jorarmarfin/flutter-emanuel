import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';

import '../themes/default_theme.dart';

class EmanuelHistoriaScreen extends StatelessWidget {
  const EmanuelHistoriaScreen({Key? key}) : super(key: key);

  static String routerName = 'emanuel-historia';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Historia'),
      ),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage(imgFondo), fit: BoxFit.fill),
        ),
        child: Text('data'),
      ),
    );
  }
}
