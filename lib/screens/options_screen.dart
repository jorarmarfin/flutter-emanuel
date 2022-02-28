import 'package:flutter/material.dart';
import 'package:flutter_emanuel/data/lista_santos.dart';

import '../components/components.dart';
import '../themes/default_theme.dart';

class OptionsScreen extends StatelessWidget {
  static const String routerName = 'options';

  const OptionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('OPCIONES')),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage(imgFondo), fit: BoxFit.fill),
        ),
        child: ListView(
          children: const [_SantoDelDia(), _CicloLiturgico(), _Botones()], //
        ),
      ),
    );
  }
}

class _Botones extends StatelessWidget {
  const _Botones({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Table(
      children: const [
        TableRow(children: [
          BotonOpcion(
              botonIcono: icoNosotros,
              botonNombre: 'Emanuel',
              routeName: 'emanuel-info'),
          BotonOpcion(
              botonIcono: icoCumples,
              botonNombre: 'Celebraciones',
              routeName: 'cumples'),
          BotonOpcion(
              botonIcono: icoFormacion,
              botonNombre: 'Formación',
              routeName: 'construccion'),
        ]),
        TableRow(children: [
          BotonOpcion(
              botonIcono: icoBiblioteca,
              botonNombre: 'Biblioteca',
              routeName: 'construccion'),
          BotonOpcion(
              botonIcono: icoEnlaces,
              botonNombre: 'Zoom',
              routeName: 'recursos'),
          BotonOpcion(
              botonIcono: icoMisas,
              botonNombre: 'Misas',
              routeName: 'construccion'),
        ]),
        TableRow(children: [
          BotonOpcion(
              botonIcono: icoOfrendas,
              botonNombre: 'Ofrendas',
              routeName: 'construccion'),
          BotonOpcion(
              botonIcono: icoServicios,
              botonNombre: 'Servicios',
              routeName: 'construccion'),
          BotonOpcion(
              botonIcono: icoSantisimo,
              botonNombre: 'Santisimo',
              routeName: 'construccion'),
        ]),
      ],
    );
  }
}

class _CicloLiturgico extends StatelessWidget {
  const _CicloLiturgico({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(15.0),
      margin: const EdgeInsets.all(15.0),
      decoration: estiloRecuadro(colorRojo),
      child: Text(
        'Ciclo C - Tiempo ordinario'.toUpperCase(),
        textAlign: TextAlign.center,
        style: DefaultTheme.base.textTheme.headline2,
      ),
    );
  }
}

class _SantoDelDia extends StatelessWidget {
  const _SantoDelDia({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _listaSantos =
        listaSantos.where((santo) => santo.mes == 1 && santo.dia == 2).toList();

    return Container(
      margin: const EdgeInsets.all(15.0),
      decoration: estiloRecuadro(colorCeleste),
      child: Row(children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: CircleAvatar(
            maxRadius: 50,
            backgroundImage: NetworkImage(_listaSantos[0].imagen),
          ),
        ),
        Expanded(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  _listaSantos[0].nombre,
                  style: DefaultTheme.base.textTheme.subtitle1,
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
