class SantosModel {
  final List<SantoModel> santos;

  SantosModel({
    required this.santos,
  });

  factory SantosModel.fromJson(List<dynamic> parsedJson) {
    List<SantoModel> _santo = [];
    _santo = parsedJson.map((i) => SantoModel.fromJson(i)).toList();

    return SantosModel(santos: _santo);
  }
}

class SantoModel {
  final int id;
  final int dia;
  final int mes;
  final String nombre;
  final String descripcion;
  final String enlace;
  final String imagen;

  SantoModel({
    required this.id,
    required this.dia,
    required this.mes,
    required this.nombre,
    required this.descripcion,
    required this.enlace,
    required this.imagen,
  });

  factory SantoModel.fromJson(Map<String, dynamic> json) {
    return SantoModel(
        id: json['id'],
        dia: json['dia'],
        mes: json['mes'],
        nombre: json['nombre'],
        descripcion: json['descripcion'],
        enlace: json['enlace'],
        imagen: json['imagen']);
  }
}
