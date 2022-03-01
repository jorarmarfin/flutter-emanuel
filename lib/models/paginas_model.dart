class PaginasModel {
  final List<PaginaModel> paginas;

  PaginasModel({
    required this.paginas,
  });

  factory PaginasModel.fromJson(List<dynamic> parsedJson) {
    List<PaginaModel> pagina = [];
    pagina = parsedJson.map((i) => PaginaModel.fromJson(i)).toList();

    return PaginasModel(paginas: pagina);
  }
}

class PaginaModel {
  final String nombre;
  final String contenido;
  final String imagen;
  final String textoMultiple;
  final String observacion;

  PaginaModel(
      {required this.nombre,
      required this.contenido,
      required this.imagen,
      required this.textoMultiple,
      required this.observacion});

  factory PaginaModel.fromJson(Map<String, dynamic> json) {
    return PaginaModel(
        nombre: json['nombre'].toString(),
        contenido: json['contenido'],
        imagen: json['imagen'],
        observacion: json['observacion'],
        textoMultiple: json['texto_multiple']);
  }
}
