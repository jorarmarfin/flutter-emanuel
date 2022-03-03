import 'package:flutter/material.dart';
import 'package:flutter_emanuel/components/components.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../providers/providers.dart';
import '../themes/default_theme.dart';

class SantoDetalleScreen extends StatelessWidget {
  const SantoDetalleScreen({Key? key}) : super(key: key);

  static String routerName = 'santo_detalle';

  @override
  Widget build(BuildContext context) {
    final octoberProvider = Provider.of<OctoberProvider>(context);
    return Scaffold(
        appBar: AppBar(title: const Text('El Santo del Día')),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image:
                DecorationImage(image: AssetImage(imgFondo), fit: BoxFit.fill),
          ),
          child: Column(children: [
            const SizedBox(
              height: 8,
            ),
            CustomCard(
                titulo: octoberProvider.santos[octoberProvider.santoId].nombre,
                contenido: octoberProvider
                    .santos[octoberProvider.santoId].descripcion),
            Image.network(
                octoberProvider.santos[octoberProvider.santoId].imagen),
            GestureDetector(
              onTap: () {
                _launchURLBrowser(
                    octoberProvider.santos[octoberProvider.santoId].enlace);
              },
              child: const Card(
                child: ListTile(
                  title: Text(
                      'Para conocer más del santo puedes hacer click aqui'),
                ),
              ),
            )
          ]),
        ));
  }

  void _launchURLBrowser(String _url) async {
    if (await canLaunch(_url)) {
      await launch(_url);
    } else {
      throw 'Could not launch $_url';
    }
  }
}
