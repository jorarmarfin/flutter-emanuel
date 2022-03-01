import 'dart:convert';

class TiempoLiturgicoModel {
    TiempoLiturgicoModel({
        required this.tiempo,
        required this.ciclo,
    });

    String tiempo;
    String ciclo;

    factory TiempoLiturgicoModel.fromJson(String str) => TiempoLiturgicoModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory TiempoLiturgicoModel.fromMap(Map<String, dynamic> json) => TiempoLiturgicoModel(
        tiempo: json["tiempo"],
        ciclo: json["ciclo"],
    );

    Map<String, dynamic> toMap() => {
        "tiempo": tiempo,
        "ciclo": ciclo,
    };
}
