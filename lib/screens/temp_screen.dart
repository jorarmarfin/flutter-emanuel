import 'package:flutter/material.dart';
import 'package:flutter_emanuel/components/components.dart';

import '../themes/default_theme.dart';

class TempScreen extends StatelessWidget {
  const TempScreen({Key? key}) : super(key: key);
  static String routerName = 'temp';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('OPCIONES')),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage(imgFondo), fit: BoxFit.fill),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: const [
              CardTitleSubtitle(title: 'title', subtitle: 'subtitle'),
              CardTitleSubtitle(title: 'title', subtitle: 'subtitle'),
              CardTitleSubtitle(title: 'title', subtitle: 'subtitle'),
              CardTitleSubtitle(title: 'title', subtitle: 'subtitle'),
              CardTitleSubtitle(title: 'title', subtitle: 'subtitle'),
              CardTitleSubtitle(title: 'title', subtitle: 'subtitle'),
              CardTitleSubtitle(title: 'title', subtitle: 'subtitle'),
              CardTitleSubtitle(title: 'title', subtitle: 'subtitle'),
              CardTitleSubtitle(title: 'title', subtitle: 'subtitle'),
              CardTitleSubtitle(title: 'title', subtitle: 'subtitle'),
              CardTitleSubtitle(title: 'title', subtitle: 'subtitle'),
              CardTitleSubtitle(title: 'title', subtitle: 'subtitle'),
              CardTitleSubtitle(title: 'title', subtitle: 'subtitle'),
              CardTitleSubtitle(title: 'title', subtitle: 'subtitle'),
              CardTitleSubtitle(title: 'title', subtitle: 'subtitle'),
              CardTitleSubtitle(title: 'title', subtitle: 'subtitle'),
              CardTitleSubtitle(title: 'title', subtitle: 'subtitle'),
              CardTitleSubtitle(title: 'title', subtitle: 'subtitle'),
              CardTitleSubtitle(title: 'title', subtitle: 'subtitle'),
              CardTitleSubtitle(title: 'title', subtitle: 'subtitle'),
              CardTitleSubtitle(title: 'title', subtitle: 'subtitle'),
              CardTitleSubtitle(title: 'title', subtitle: 'subtitle'),
              CardTitleSubtitle(title: 'title', subtitle: 'subtitle'),
              CardTitleSubtitle(title: 'title', subtitle: 'subtitle'),
              CardTitleSubtitle(title: 'title', subtitle: 'subtitle'),
            ], //
          ),
        ),
      ),
    );
  }
}
