import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:flutter_emanuel/models/models.dart';

class OctoberProvider extends ChangeNotifier {
  final String _baseUrl = 'https://recursos.sahost.org';
  int _santoId = 0;
  late FormacionModel formacion;

  int get santoId => _santoId;

  set santoId(int value) {
    _santoId = value;
    notifyListeners();
  }

  TiempoLiturgicoModel tiempoLiturgico =
      TiempoLiturgicoModel(tiempo: '', ciclo: '');
  late List<SantoModel> santos = [];
  late LiturgiaModel liturgia;

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

  Future getLiturgia() async {
    var url = Uri.parse('$_baseUrl/api/liturgia');
    final response = await http.get(url);
    liturgia = LiturgiaModel.fromJson(response.body);
  }
  Future getFormacion() async {
    var url = Uri.parse('$_baseUrl/api/formacion');
    final response = await http.get(url);
    formacion = FormacionModel.fromJson(response.body);
  }
}
