import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/components.dart';
import '../providers/providers.dart';
import '../themes/default_theme.dart';

class OfrendasScreen extends StatelessWidget {
  static String routerName = 'ofrendas';

  const OfrendasScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final drupalProvider = Provider.of<DrupalProvider>(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Ofrendas en el grupo')),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage(imgFondo), fit: BoxFit.fill),
        ),
        child: FutureBuilder(
          future: drupalProvider.getPaginas('73'),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return ListView(
                children: [
                  const SizedBox(
                    height: 8,
                  ),
                  CustomCard(
                      titulo: drupalProvider.paginasDrupal[0].nombre,
                      contenido: drupalProvider.paginasDrupal[0].observacion),
                  CustomCard(
                      titulo: 'Numero de cuenta',
                      contenido: drupalProvider.paginasDrupal[0].textoMultiple),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
