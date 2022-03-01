import 'package:flutter/material.dart';
import 'package:flutter_emanuel/components/card_title_subtitle.dart';
import 'package:provider/provider.dart';

import '../providers/providers.dart';
import '../themes/default_theme.dart';

class EmanuelHistoriaScreen extends StatelessWidget {
  const EmanuelHistoriaScreen({Key? key}) : super(key: key);

  static String routerName = 'emanuel-historia';

  @override
  Widget build(BuildContext context) {
    final localProvider = Provider.of<LocalProvider>(context);
    localProvider.getHistoria();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Historia'),
      ),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage(imgFondo), fit: BoxFit.fill),
        ),
        child: ListView.builder(
          itemCount: localProvider.listaHistoria.length,
          itemBuilder: (BuildContext context, int index) {
            return CardTitleSubtitle(
                title: localProvider.listaHistoria[index].anio,
                subtitle: localProvider.listaHistoria[index].contenido);
          },
        ),
      ),
    );
  }
}
