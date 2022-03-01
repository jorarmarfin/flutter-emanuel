import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../models/models.dart';

class LocalProvider extends ChangeNotifier {
  List<HistoriaModel> listaHistoria = [];

  Future<void> getHistoria() async {
    final String response =
        await rootBundle.loadString('assets/data/historia.json');
    final json = await jsonDecode(response);
    listaHistoria = ListaHistoriaModel.fromJson(json).listaHistoria;
  }

}
