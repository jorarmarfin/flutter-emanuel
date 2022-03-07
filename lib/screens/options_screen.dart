import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/components.dart';
import '../providers/providers.dart';
import '../themes/default_theme.dart';

class OptionsScreen extends StatelessWidget {
  static const String routerName = 'options';

  const OptionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
        'Grupo de Oracion Emanuel',
      )),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage(imgFondo), fit: BoxFit.fill),
        ),
        child: Column(
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
    return Expanded(
      child: ListView(
        children: [
          Row(
            children: const [
              BotonOpcion(
                  botonIcono: icoNosotros,
                  botonNombre: 'Emanuel',
                  routeName: 'emanuel-info'),
              BotonOpcion(
                  botonIcono: icoCumples,
                  botonNombre: 'Celebraciones',
                  routeName: 'cumples'),
              BotonOpcion(
                  botonIcono: icoAvisos,
                  botonNombre: 'Avisos',
                  routeName: 'avisos'),
            ],
          ),
          Row(
            children: const [
              BotonOpcion(
                  botonIcono: icoEnlaces,
                  botonNombre: 'Zoom',
                  routeName: 'recursos'),
              BotonOpcion(
                  botonIcono: icoMisas,
                  botonNombre: 'Misas',
                  routeName: 'misas'),
              BotonOpcion(
                  botonIcono: icoSantisimo,
                  botonNombre: 'Santisimo',
                  routeName: 'santisimo'),
            ],
          ),
          Row(
            children: const [
              BotonOpcion(
                  botonIcono: icoOfrendas,
                  botonNombre: 'Ofrendas',
                  routeName: 'ofrendas'),
              BotonOpcion(
                  botonIcono: icoFormacion,
                  botonNombre: 'Formación',
                  routeName: 'formacion'),
              BotonOpcion(
                  botonIcono: icoServicios,
                  botonNombre: 'Servicios',
                  routeName: 'construccion'),
            ],
          ),
          Row(
            children: const [
              BotonOpcion(
                  botonIcono: icoBiblioteca,
                  botonNombre: 'Biblioteca',
                  routeName: 'construccion'),
            ],
          )
        ],
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
    final octoberProvider = Provider.of<OctoberProvider>(context);

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, 'liturgia');
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(15.0),
        margin: const EdgeInsets.all(15.0),
        decoration: estiloRecuadro(colorRojo),
        child: FutureBuilder(
          future: octoberProvider.getTiempoLiturgico(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return Text(
                'Ciclo ' +
                    octoberProvider.tiempoLiturgico.ciclo +
                    ' - ' +
                    octoberProvider.tiempoLiturgico.tiempo.toUpperCase(),
                textAlign: TextAlign.center,
                style: DefaultTheme.base.textTheme.headline2,
              );
            }
          },
        ),
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
    final octoberProvider = Provider.of<OctoberProvider>(context);

    return FutureBuilder(
      future: octoberProvider.getSantosDelDia(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return SizedBox(
            height: 150,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: octoberProvider.santos.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    octoberProvider.santoId = index;
                    Navigator.pushNamed(context, 'santo_detalle');
                  },
                  child: Container(
                    width: 300,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 17),
                    margin: const EdgeInsets.all(8),
                    decoration: estiloRecuadro(colorCeleste),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 2.0),
                          child: CircleAvatar(
                            maxRadius: 70,
                            backgroundImage: NetworkImage(
                                octoberProvider.santos[index].imagen),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('El santo del Día',
                                  style: DefaultTheme.base.textTheme.subtitle2),
                              Text(
                                octoberProvider.santos[index].nombre,
                                style: DefaultTheme.base.textTheme.bodyText1,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        }
      },
    );
  }
}
