import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:flutter_emanuel/models/models.dart';

class DrupalProvider extends ChangeNotifier {
  final String _baseUrl = 'https://emanuel.sahost.org';

  int _mesCumple = 0;
  late CelebracionesModel celebraciones;
  late CoordinacionModel coordinacion;
  late RecursosModel recursosDrupal;

  int get mesCumple => _mesCumple;

  set mesCumple(int value) {
    _mesCumple = value;
    notifyListeners();
  }

  Future getCelebracionMensual(int mes) async {
    final now = DateTime.now();
    final _mes = (_mesCumple == 0) ? now.month : mes;
    var url = Uri.parse('$_baseUrl/api/celebraciones-mes/$_mes?_format=json');
    final response = await http.get(url);
    final decodeData = jsonDecode(response.body);
    celebraciones = CelebracionesModel.fromJsonList(decodeData);
    return celebraciones.items;
  }

  Future getCoordinacion() async {
    var url = Uri.parse('$_baseUrl/api/coordinador?_format=json');
    final response = await http.get(url);
    final decodeData = jsonDecode(response.body);
    coordinacion = CoordinacionModel.fromJsonList(decodeData);
    return coordinacion.items;
  }
  Future getRecursos(String tipo) async {
    var url = Uri.parse('$_baseUrl/api/recurso/$tipo?_format=json');
    final response = await http.get(url);
    final decodeData = jsonDecode(response.body);
    recursosDrupal = RecursosModel.fromJsonList(decodeData);
    return recursosDrupal.items;
  }
}
