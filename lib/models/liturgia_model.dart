import 'dart:convert';

class LiturgiaModel {
    LiturgiaModel({
        required this.id,
        required this.primeraLectura,
        required this.segundaLectura,
        required this.salmo,
        required this.celebracion,
    });

    int id;
    String primeraLectura;
    String segundaLectura;
    String salmo;
    String celebracion;

    factory LiturgiaModel.fromJson(String str) => LiturgiaModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory LiturgiaModel.fromMap(Map<String, dynamic> json) => LiturgiaModel(
        id: json["id"],
        primeraLectura: json["primera_lectura"],
        segundaLectura: json["segunda_lectura"],
        salmo: json["salmo"],
        celebracion: json["celebracion"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "primera_lectura": primeraLectura,
        "segunda_lectura": segundaLectura,
        "salmo": salmo,
        "celebracion": celebracion,
    };
}
