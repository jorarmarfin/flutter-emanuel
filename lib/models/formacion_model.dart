// To parsrequirede this JSON data, do
//
//     final formacionModel = formacionModelFromMap(jsonString);

import 'dart:convert';

class FormacionModel {
  FormacionModel({
    required this.id,
    required this.youtube,
    required this.libros,
    required this.enlaces,
    required this.titulo,
    required this.activo,
  });

  int id;
  List<Youtube> youtube;
  List<Libro> libros;
  List<Enlace> enlaces;
  String titulo;
  int activo;

  factory FormacionModel.fromJson(String str) =>
      FormacionModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory FormacionModel.fromMap(Map<String, dynamic> json) => FormacionModel(
        id: json["id"],
        youtube:
            List<Youtube>.from(json["youtube"].map((x) => Youtube.fromMap(x))),
        libros: List<Libro>.from(json["libros"].map((x) => Libro.fromMap(x))),
        enlaces:
            List<Enlace>.from(json["enlaces"].map((x) => Enlace.fromMap(x))),
        titulo: json["titulo"],
        activo: json["activo"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "youtube": List<dynamic>.from(youtube.map((x) => x.toMap())),
        "libros": List<dynamic>.from(libros.map((x) => x.toMap())),
        "enlaces": List<dynamic>.from(enlaces.map((x) => x.toMap())),
        "titulo": titulo,
        "activo": activo,
      };
}

class Enlace {
  Enlace({
    required this.nombre,
    required this.enlace,
  });

  String nombre;
  String enlace;

  factory Enlace.fromJson(String str) => Enlace.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Enlace.fromMap(Map<String, dynamic> json) => Enlace(
        nombre: json["nombre"],
        enlace: json["enlace"],
      );

  Map<String, dynamic> toMap() => {
        "nombre": nombre,
        "enlace": enlace,
      };
}

class Libro {
  Libro({
    required this.nombre,
    required this.archivo,
    required this.recomendado,
  });

  String nombre;
  String archivo;
  String recomendado;

  factory Libro.fromJson(String str) => Libro.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Libro.fromMap(Map<String, dynamic> json) => Libro(
        nombre: json["nombre"],
        archivo: json["archivo"],
        recomendado: json["recomendado"],
      );

  Map<String, dynamic> toMap() => {
        "nombre": nombre,
        "archivo": archivo,
        "recomendado": recomendado,
      };
}

class Youtube {
  Youtube({
    required this.nombre,
    required this.enlace,
    required this.titulo,
    required this.imagen,
  });

  String nombre;
  String enlace;
  String titulo;
  String imagen;

  factory Youtube.fromJson(String str) => Youtube.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Youtube.fromMap(Map<String, dynamic> json) => Youtube(
        nombre: json["nombre"],
        enlace: json["enlace"],
        titulo: json["titulo"],
        imagen: json["imagen"],
      );

  Map<String, dynamic> toMap() => {
        "nombre": nombre,
        "enlace": enlace,
        "titulo": titulo,
        "imagen": imagen,
      };
}
