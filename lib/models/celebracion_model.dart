// To parse this JSON data, do
//
//     final celebracionModels = celebracionModelsFromMap(jsonString);

import 'dart:convert';

class CelebracionModels {
    CelebracionModels({
        required this.miembro,
        required this.dia,
        required this.mes,
        required this.anio,
        required this.tipo,
    });

    String miembro;
    String dia;
    String mes;
    String anio;
    String tipo;

    factory CelebracionModels.fromJson(String str) => CelebracionModels.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory CelebracionModels.fromMap(Map<String, dynamic> json) => CelebracionModels(
        miembro: json["miembro"],
        dia: json["dia"],
        mes: json["mes"],
        anio: json["anio"],
        tipo: json["tipo"],
    );

    Map<String, dynamic> toMap() => {
        "miembro": miembro,
        "dia": dia,
        "mes": mes,
        "anio": anio,
        "tipo": tipo,
    };
}
