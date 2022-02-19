import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../themes/default_theme.dart';

class CumplesScreen extends StatelessWidget {
  static const String routerName = 'cumples';
  const CumplesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cumpleaños')),
      body: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            image:
                DecorationImage(image: AssetImage(imgFondo), fit: BoxFit.fill),
          ),
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    Card(
                      child: ListTile(
                        leading: const FaIcon(FontAwesomeIcons.birthdayCake),
                        title: Text('Luis Mayta'),
                        subtitle: Text(
                          '21 de mayo',
                          style: DefaultTheme.base.textTheme.subtitle2,
                        ),
                      ),
                    ),
                    Card(
                      child: ListTile(
                        leading: FaIcon(FontAwesomeIcons.birthdayCake),
                        title: Text('Luis Mayta'),
                        subtitle: Text(
                          '21 de mayo',
                          style: DefaultTheme.base.textTheme.subtitle2,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
