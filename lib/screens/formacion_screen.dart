import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../providers/providers.dart';
import '../themes/default_theme.dart';

class FormacionScreen extends StatelessWidget {
  const FormacionScreen({Key? key}) : super(key: key);

  static String routerName = 'formacion';

  @override
  Widget build(BuildContext context) {
    final octoberProvider = Provider.of<OctoberProvider>(context);
    return Scaffold(
        appBar: AppBar(title: const Text('Formación..')),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image:
                DecorationImage(image: AssetImage(imgFondo), fit: BoxFit.fill),
          ),
          child: FutureBuilder(
            future: octoberProvider.getFormacion(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return Column(
                  children: [
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Canales de youtube Recomendados',
                          style: DefaultTheme.base.textTheme.headline3,
                        ),
                      ),
                    ),
                    const _ListaYoutube(),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Enlaces Recomendados',
                          style: DefaultTheme.base.textTheme.headline3,
                        ),
                      ),
                    ),
                    const _ListaEnlaces(),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Libros Recomendados',
                          style: DefaultTheme.base.textTheme.headline3,
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: octoberProvider.formacion.libros.length,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              _launchURLBrowser(octoberProvider
                                  .formacion.libros[index].archivo);
                            },
                            child: Card(
                              child: ListTile(
                                leading: const Icon(Icons.book),
                                title: Text(
                                    octoberProvider
                                        .formacion.libros[index].nombre,
                                    style:
                                        DefaultTheme.base.textTheme.bodyText1),
                                subtitle: Text(
                                    'Recomendado por ' +
                                        octoberProvider.formacion.libros[index]
                                            .recomendado,
                                    style:
                                        DefaultTheme.base.textTheme.bodyText2),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                );
              }
            },
          ),
        ));
  }
}

class _ListaEnlaces extends StatelessWidget {
  const _ListaEnlaces({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final octoberProvider = Provider.of<OctoberProvider>(context);
    return SizedBox(
      height: 50,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: octoberProvider.formacion.enlaces.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: (() {
                _launchURLBrowser(
                    octoberProvider.formacion.enlaces[index].enlace);
              }),
              child: Container(
                width: 100,
                padding:
                    const EdgeInsets.symmetric(horizontal: 2, vertical: 10),
                margin: const EdgeInsets.all(3),
                decoration: estiloRecuadro(colorAmarillo),
                child: Text(
                  octoberProvider.formacion.enlaces[index].nombre,
                  style: DefaultTheme.base.textTheme.bodyText1,
                  textAlign: TextAlign.center,
                ),
              ),
            );
          }),
    );
  }
}

class _ListaYoutube extends StatelessWidget {
  const _ListaYoutube({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final octoberProvider = Provider.of<OctoberProvider>(context);
    return SizedBox(
      height: 130,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: octoberProvider.formacion.youtube.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: (() {
                _launchURLBrowser(
                    octoberProvider.formacion.youtube[index].enlace);
              }),
              child: Container(
                width: 100,
                padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 3),
                margin: const EdgeInsets.all(3),
                decoration: estiloRecuadro(colorRojo),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 1.0),
                      child: CircleAvatar(
                        maxRadius: 30,
                        backgroundImage: NetworkImage(
                            octoberProvider.formacion.youtube[index].imagen),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      octoberProvider.formacion.youtube[index].nombre,
                      style: DefaultTheme.base.textTheme.headline5,
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      octoberProvider.formacion.youtube[index].titulo,
                      style: DefaultTheme.base.textTheme.headline5,
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}

void _launchURLBrowser(String _url) async {
  if (await canLaunch(_url)) {
    await launch(_url);
  } else {
    throw 'Could not launch $_url';
  }
}
