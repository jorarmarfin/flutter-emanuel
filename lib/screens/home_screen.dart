import 'package:flutter/material.dart';
import 'package:flutter_emanuel/themes/default_theme.dart';

class HomeScreen extends StatelessWidget {
  static const String routerName = 'home';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.pushNamed(
            context,
            'options',
          );
        },
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            image:
                DecorationImage(image: AssetImage(imgFondo), fit: BoxFit.fill),
          ),
          child: Center(
            child: Text(
              'Bienvenido al grupo de oración Emanuel',
              style: DefaultTheme.base.textTheme.headline1,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
