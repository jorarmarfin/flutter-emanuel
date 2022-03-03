import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/components.dart';
import '../providers/providers.dart';
import '../themes/default_theme.dart';

class LiturgiaScreen extends StatelessWidget {
  const LiturgiaScreen({Key? key}) : super(key: key);

  static String routerName = 'liturgia';

  @override
  Widget build(BuildContext context) {
    final octoberProvider = Provider.of<OctoberProvider>(context);
    return Scaffold(
        appBar: AppBar(title: const Text('Liturgia')),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image:
                DecorationImage(image: AssetImage(imgFondo), fit: BoxFit.fill),
          ),
          child: FutureBuilder(
            future: octoberProvider.getLiturgia(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          octoberProvider.liturgia.celebracion,
                          style: DefaultTheme.base.textTheme.headline3,
                        ),
                      ),
                    ),
                    CardTitleSubtitle(
                        title: octoberProvider.liturgia.primeraLectura,
                        subtitle: 'Primera lectura'),
                    CardTitleSubtitle(
                        title: octoberProvider.liturgia.segundaLectura,
                        subtitle: 'Segunda lectura'),
                    CardTitleSubtitle(
                        title: octoberProvider.liturgia.salmo,
                        subtitle: 'Salmo y antifona'),
                  ],
                );
              }
            },
          ),
        ));
  }
}
