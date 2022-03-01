class AvisosModel {
  final List<AvisoModel> avisos;

  AvisosModel({
    required this.avisos,
  });

  factory AvisosModel.fromJson(List<dynamic> parsedJson) {
    List<AvisoModel> avisos = [];
    avisos = parsedJson.map((i) => AvisoModel.fromJson(i)).toList();

    return AvisosModel(avisos: avisos);
  }
}

class AvisoModel {
  final String nombre;
  final String fecha;
  final String aviso;

  AvisoModel({
    required this.nombre,
    required this.fecha,
    required this.aviso,
  });

  factory AvisoModel.fromJson(Map<String, dynamic> json) {
    return AvisoModel(
        nombre: json['nombre'].toString(),
        fecha: json['fecha'],
        aviso: json['aviso']);
  }
}
