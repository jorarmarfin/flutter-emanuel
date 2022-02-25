class RecursosModel {
  List<RecursoModel> items = [];
  RecursosModel();

  RecursosModel.fromJsonList(List<dynamic> jsonList) {
    // ignore: unnecessary_null_comparison
    if (jsonList == null) return;
    for (var item in jsonList) {
      final recurso = RecursoModel.fromJson(item);
      items.add(recurso);
    }
  }
}

class RecursoModel {
  String titulo;
  String enlace;
  String body;

  RecursoModel({
    required this.titulo,
    required this.enlace,
    required this.body,
  });

  factory RecursoModel.fromJson(Map<String, dynamic> json) =>
      RecursoModel(
          titulo: json['titulo'],
          enlace: json['enlace'],
          body: json['body']);
}
