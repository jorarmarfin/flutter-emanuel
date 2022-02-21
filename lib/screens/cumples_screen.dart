import 'package:flutter/material.dart';
import 'package:flutter_emanuel/models/meses_models.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../data/lista_meses.dart';
import '../themes/default_theme.dart';

class CumplesScreen extends StatelessWidget {
  static const String routerName = 'cumples';
  const CumplesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _listaMeses = listaMeses;
    return Scaffold(
      appBar: AppBar(title: const Text('Cumpleaños 1')),
      body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image:
                DecorationImage(image: AssetImage(imgFondo), fit: BoxFit.fill),
          ),
          child: ListView(
            children: [
              SizedBox(
                height: 10,
              ),
              _BotonesdeMeses(listaMeses: listaMeses),
              Card(
                child: ListTile(
                  leading: Icon(FontAwesomeIcons.birthdayCake),
                  title: Text('Luis Fernando Mayta Campos'),
                  subtitle: Text(
                    '21 de Mayo',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text('data'),
                ),
              ),
            ],
          )),
    );
  }
}

class _BotonesdeMeses extends StatelessWidget {
  const _BotonesdeMeses({
    Key? key,
    required List<MesesModel> listaMeses,
  })  : _listaMeses = listaMeses,
        super(key: key);

  final List<MesesModel> _listaMeses;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: _listaMeses.length,
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 17),
              margin: const EdgeInsets.all(8),
              decoration: estiloRecuadro(colorRojo),
              child: Text(
                _listaMeses[index].nombre,
                style: DefaultTheme.base.textTheme.headline6,
              ),
            );
          }),
    );
  }
}
