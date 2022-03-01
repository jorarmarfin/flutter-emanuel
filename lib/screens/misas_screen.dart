import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/providers.dart';
import '../themes/default_theme.dart';

class MisasScreen extends StatelessWidget {
  const MisasScreen({Key? key}) : super(key: key);

  static String routerName = 'misas';

  @override
  Widget build(BuildContext context) {
    final drupalProvider = Provider.of<DrupalProvider>(context);
    final utilsProvider = Provider.of<UtilsProvider>(context);
    return Scaffold(
        appBar: AppBar(title: const Text('A donde puedes ir a misa')),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image:
                DecorationImage(image: AssetImage(imgFondo), fit: BoxFit.fill),
          ),
          child: FutureBuilder(
            future: drupalProvider.getRecursos('misas'),
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
                            subtitle: Text(
                                drupalProvider.recursosDrupal.items[index].body,
                                style: DefaultTheme.base.textTheme.subtitle1),
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
