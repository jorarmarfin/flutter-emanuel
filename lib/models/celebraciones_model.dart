class CelebracionesModel {
  List<CelebracionModel> items = [];
  CelebracionesModel();

  CelebracionesModel.fromJsonList(List<dynamic> jsonList) {
    // ignore: unnecessary_null_comparison
    if (jsonList == null) return;
    for (var item in jsonList) {
      final celebracion = CelebracionModel.fromJson(item);
      items.add(celebracion);
    }
  }
}

class CelebracionModel {
  String miembro;
  String dia;
  String mes;
  String anio;
  String tipo;

  CelebracionModel({
    required this.miembro,
    required this.dia,
    required this.mes,
    required this.anio,
    required this.tipo,
  });

  factory CelebracionModel.fromJson(Map<String, dynamic> json) =>
      CelebracionModel(
          miembro: json['miembro'],
          dia: json['dia'],
          mes: json['mes'],
          anio: json['anio'],
          tipo: json['tipo']);
}
