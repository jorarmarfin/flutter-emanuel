import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';

class UtilsProvider extends ChangeNotifier {

  Future<void> share(String titulo, String cuerpo, String enlace) async {
    await FlutterShare.share(
        title: 'Example share',
        text: 'Example share text',
        linkUrl: 'https://flutter.dev/',
        chooserTitle: 'Example Chooser Title');
  }
  
}