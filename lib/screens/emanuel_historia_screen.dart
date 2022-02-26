import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';

import '../themes/default_theme.dart';

class EmanuelHistoriaScreen extends StatelessWidget {
  const EmanuelHistoriaScreen({Key? key}) : super(key: key);

  static String routerName = 'emanuel-historia';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Historia'),
      ),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage(imgFondo), fit: BoxFit.fill),
        ),
        child: Timeline.tileBuilder(
          builder: TimelineTileBuilder.fromStyle(
            contentsAlign: ContentsAlign.reverse,
            contentsBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
              child: Text(
                ' $index',
                style: DefaultTheme.base.textTheme.bodyText1,
              ),
            ),
            oppositeContentsBuilder: (context, index) => Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Contents',
                    style: DefaultTheme.base.textTheme.bodyText1),
              ),
            ),
            itemCount: 10,
          ),
        ),
      ),
    );
  }
}
