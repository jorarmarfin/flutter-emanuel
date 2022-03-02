import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:flutter_emanuel/models/models.dart';

class OctoberProvider extends ChangeNotifier {
  final String _baseUrl = 'https://recursos.sahost.org';

  TiempoLiturgicoModel tiempoLiturgico =
      TiempoLiturgicoModel(tiempo: '', ciclo: '');
  late List<SantoModel> santos = [];

  Future getTiempoLiturgico() async {
    var url = Uri.parse('$_baseUrl/api/tiempo-liturgico');
    final response = await http.get(url);
    tiempoLiturgico = TiempoLiturgicoModel.fromJson(response.body);
  }
  Future getSantosDelDia() async {
    var url = Uri.parse('$_baseUrl/api/santos-del-dia');
    final response = await http.get(url);
    final decodeData = jsonDecode(response.body);
    santos = SantosModel.fromJson(decodeData).santos;
  }
}
