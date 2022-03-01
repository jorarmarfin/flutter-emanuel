class ListaHistoriaModel {
  final List<HistoriaModel> listaHistoria;

  ListaHistoriaModel({
    required this.listaHistoria,
  });

  factory ListaHistoriaModel.fromJson(List<dynamic> parsedJson) {
    List<HistoriaModel> historia = [];
    historia = parsedJson.map((i) => HistoriaModel.fromJson(i)).toList();

    return ListaHistoriaModel(listaHistoria: historia);
  }
}

class HistoriaModel {
  final String anio;
  final String contenido;

  HistoriaModel({
    required this.anio,
    required this.contenido,
  });

  factory HistoriaModel.fromJson(Map<String, dynamic> json) {
    return HistoriaModel(
        anio: json['anio'].toString(), contenido: json['contenido']);
  }
}
