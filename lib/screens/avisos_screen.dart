import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/providers.dart';
import '../themes/default_theme.dart';

class AvisosScreen extends StatelessWidget {
  const AvisosScreen({Key? key}) : super(key: key);

  static String routerName = 'avisos';

  @override
  Widget build(BuildContext context) {
    final drupalProvider = Provider.of<DrupalProvider>(context);
    return Scaffold(
        appBar: AppBar(title: const Text('Avisos del Grupo')),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image:
                DecorationImage(image: AssetImage(imgFondo), fit: BoxFit.fill),
          ),
          child: FutureBuilder(
            future: drupalProvider.getAvisos(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return Column(
                  children: [
                    Card(
                      child: ListTile(
                          title: Text(
                        'En esta seccion colocaremos los avisos brindados en el grupo los sabados',
                        style: DefaultTheme.base.textTheme.bodyText1,
                      )),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: drupalProvider.avisosDrupal.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Card(
                            child: ListTile(
                              title: Text(drupalProvider
                                      .avisosDrupal[index].fecha +
                                  ' - ' +
                                  drupalProvider.avisosDrupal[index].nombre),
                              subtitle: Text(
                                  drupalProvider.avisosDrupal[index].aviso,
                                  style: DefaultTheme.base.textTheme.bodyText1),
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
