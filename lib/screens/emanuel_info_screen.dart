import 'package:flutter/material.dart';

import '../components/components.dart';
import '../data/datos_emanuel.dart';
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
              const _Botones()
            ],
          )),
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
              botonNombre: 'Historia',
              routeName: 'construccion'),
          BotonOpcion(
              botonIcono: icoCumples,
              botonNombre: 'Espiritualidad',
              routeName: 'construccion'),
        ]),
      ],
    );
  }
}
