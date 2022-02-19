import 'package:flutter/material.dart';
import 'package:flutter_emanuel/data/lista_santos.dart';

import '../themes/default_theme.dart';

class OptionsScreen extends StatelessWidget {
  static const String routerName = 'options';

  const OptionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
          _BotonOpcion(
              botonIcono: icoNosotros,
              botonNombre: 'Emanuel',
              routeName: 'construccion'),
          _BotonOpcion(
              botonIcono: icoCumples,
              botonNombre: 'Cumpleaños',
              routeName: 'cumples'),
          _BotonOpcion(
              botonIcono: icoFormacion,
              botonNombre: 'Formación',
              routeName: 'construccion'),
        ]),
        TableRow(children: [
          _BotonOpcion(
              botonIcono: icoBiblioteca,
              botonNombre: 'Biblioteca',
              routeName: 'construccion'),
          _BotonOpcion(
              botonIcono: icoEnlaces,
              botonNombre: 'Zoom',
              routeName: 'construccion'),
          _BotonOpcion(
              botonIcono: icoMisas,
              botonNombre: 'Misas',
              routeName: 'construccion'),
        ]),
        TableRow(children: [
          _BotonOpcion(
              botonIcono: icoOfrendas,
              botonNombre: 'Ofrendas',
              routeName: 'construccion'),
          _BotonOpcion(
              botonIcono: icoServicios,
              botonNombre: 'Servicios',
              routeName: 'construccion'),
          _BotonOpcion(
              botonIcono: icoMisas,
              botonNombre: 'Noti',
              routeName: 'construccion'),
        ]),
      ],
    );
  }
}

class _BotonOpcion extends StatelessWidget {
  final String botonIcono;
  final String botonNombre;
  final String routeName;
  const _BotonOpcion({
    Key? key,
    required this.botonIcono,
    required this.botonNombre,
    required this.routeName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, routeName);
      },
      child: Container(
        margin: const EdgeInsets.all(7.0),
        padding: const EdgeInsets.symmetric(vertical: 15.0),
        decoration: estiloBoton(colorAmarillo),
        child: Column(
          children: [
            Image.asset(
              botonIcono,
              width: 50,
              height: 50,
            ),
            Text(
              botonNombre,
              style: DefaultTheme.base.textTheme.subtitle1,
            )
          ],
        ),
      ),
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
