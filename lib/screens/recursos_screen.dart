import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/providers.dart';
import '../themes/default_theme.dart';

class RecursosScreen extends StatelessWidget {
  const RecursosScreen({Key? key}) : super(key: key);

  static String routerName = 'recursos';

  @override
  Widget build(BuildContext context) {
    final drupalProvider = Provider.of<DrupalProvider>(context);
    final utilsProvider = Provider.of<UtilsProvider>(context);
    return Scaffold(
        appBar: AppBar(title: const Text('Recursos')),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image:
                DecorationImage(image: AssetImage(imgFondo), fit: BoxFit.fill),
          ),
          child: FutureBuilder(
            future: drupalProvider.getRecursos('zoom'),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return ListView.builder(
                  itemCount: drupalProvider.recursosDrupal.items.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        utilsProvider.share(
                            drupalProvider.recursosDrupal.items[index].titulo,
                            drupalProvider.recursosDrupal.items[index].body,
                            drupalProvider.recursosDrupal.items[index].enlace);
                      },
                      child: Card(
                        child: ListTile(
                            title: Text(drupalProvider
                                .recursosDrupal.items[index].titulo)),
                      ),
                    );
                  },
                );
              }
            },
          ),
        ));
  }
}
