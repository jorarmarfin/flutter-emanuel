import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/components.dart';
import '../data/datos_emanuel.dart';
import '../providers/providers.dart';
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
          child: ListView(
            children: [
              const SizedBox(
                height: 8,
              ),
              CustomCard(
                  titulo: 'El grupo de oración Emanuel',
                  contenido: datosEmanuel.definicion),
              CustomCard(
                  titulo: 'Organizacion', contenido: datosEmanuel.organizacion),
              const _EquipoCoordinacion(),
              // for (var i in drupalProvider.coordinacion.items) Text(i.nombres),
              const _Botones()
            ],
          )),
    );
  }
}

class _EquipoCoordinacion extends StatelessWidget {
  const _EquipoCoordinacion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final drupalProvider = Provider.of<DrupalProvider>(context);
    return FutureBuilder(
      future: drupalProvider.getCoordinacion(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else {
          List<Widget> _coordinadores = [];
          for (var item in drupalProvider.coordinacion.items) {
            _coordinadores.add(CardTitleSubtitle(
                title: item.nombres, subtitle: 'Coordinacion'));
          }
          return Column(
            children: _coordinadores,
          );
        }
      },
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
              botonIcono: icoHistoria,
              botonNombre: 'Historia',
              routeName: 'emanuel-historia'),
          BotonOpcion(
              botonIcono: icoEspiritualidad,
              botonNombre: 'Espiritualidad',
              routeName: 'construccion'),
        ]),
      ],
    );
  }
}
