import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';

class UtilsProvider extends ChangeNotifier {
  Future<void> share(String titulo, String cuerpo, String enlace) async {
    await FlutterShare.share(
        title: titulo,
        text: cuerpo,
        linkUrl: enlace,
        chooserTitle: 'Example Chooser Title');
  }
}
