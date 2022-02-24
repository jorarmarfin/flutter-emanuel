import 'package:flutter/material.dart';
import 'package:flutter_emanuel/models/meses_models.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../data/lista_meses.dart';
import '../providers/providers.dart';
import '../themes/default_theme.dart';

class CumplesScreen extends StatelessWidget {
  static const String routerName = 'cumples';

  const CumplesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Celebraciones')),
      body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image:
                DecorationImage(image: AssetImage(imgFondo), fit: BoxFit.fill),
          ),
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _BotonesdeMeses(listaMeses: listaMeses),
            ),
            const _ResultCumples()
          ])),
    );
  }
}

class _ResultCumples extends StatelessWidget {
  const _ResultCumples({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final drupalProvider = Provider.of<DrupalProvider>(context);
    // final now = DateTime.now();

    // drupalProvider.mesCumple = now.month;
    return FutureBuilder(
        future: drupalProvider.getCelebracionMensual(drupalProvider.mesCumple),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return Expanded(
              child: ListView.builder(
                itemCount: drupalProvider.celebraciones.items.length,
                itemBuilder: (BuildContext context, int index) {
                  Widget icono =
                      (drupalProvider.celebraciones.items[index].tipo ==
                              'cumple')
                          ? const Icon(FontAwesomeIcons.birthdayCake)
                          : const Icon(FontAwesomeIcons.ring);
                  return Card(
                    child: ListTile(
                      leading: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          drupalProvider.celebraciones.items[index].dia,
                          style: DefaultTheme.base.textTheme.subtitle2,
                        ),
                      ),
                      trailing: icono,
                      title: Text(
                          drupalProvider.celebraciones.items[index].miembro),
                    ),
                  );
                },
              ),
            );
          }
        });
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
    final drupalProvider = Provider.of<DrupalProvider>(context);
    return SizedBox(
      height: 70,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: _listaMeses.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: (() {
                drupalProvider.mesCumple = _listaMeses[index].valor;
              }),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 13, vertical: 17),
                margin: const EdgeInsets.all(8),
                decoration: estiloRecuadro(colorRojo),
                child: Text(
                  _listaMeses[index].nombre,
                  style: DefaultTheme.base.textTheme.headline6,
                ),
              ),
            );
          }),
    );
  }
}
