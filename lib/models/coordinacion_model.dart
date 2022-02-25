class CoordinacionModel {
  List<CoordinadorModel> items = [];
  CoordinacionModel();

  CoordinacionModel.fromJsonList(List<dynamic> jsonList) {
    // ignore: unnecessary_null_comparison
    if (jsonList == null) return;
    for (var item in jsonList) {
      final coordinacion = CoordinadorModel.fromJson(item);
      items.add(coordinacion);
    }
  }
}

class CoordinadorModel {
  String nombres;
  String apellidos;
  String email;
  String telefono;

  CoordinadorModel({
    required this.nombres,
    required this.apellidos,
    required this.email,
    required this.telefono,
  });

  factory CoordinadorModel.fromJson(Map<String, dynamic> json) =>
      CoordinadorModel(
          nombres: json['nombres'],
          apellidos: json['apellidos'],
          email: json['email'],
          telefono: json['telefono']);
}
