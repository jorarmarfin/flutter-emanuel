import 'package:flutter/material.dart';
import 'package:flutter_emanuel/themes/default_theme.dart';

class HomeScreen extends StatelessWidget {
  static const String routerName = 'home';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        const Image(fit: BoxFit.cover, image: AssetImage(imgFondo)),
        Center(
          child: Text(
            'Bienvenido al grupo de oración Emanuel',
            style: DefaultTheme.base.textTheme.headline1,
            textAlign: TextAlign.center,
          ),
        )
      ]),
    );
  }
}
