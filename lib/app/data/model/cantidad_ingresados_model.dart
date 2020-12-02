// To parse this JSON data, do
//
//     final cantidadParticipantes = cantidadParticipantesFromMap(jsonString);

import 'dart:convert';

CantidadParticipantes cantidadParticipantesFromMap(String str) => CantidadParticipantes.fromMap(json.decode(str));

String cantidadParticipantesToMap(CantidadParticipantes data) => json.encode(data.toMap());

class CantidadParticipantes {
    CantidadParticipantes({
        this.cantidad,
    });

    Cantidad cantidad;

    factory CantidadParticipantes.fromMap(Map<String, dynamic> json) => CantidadParticipantes(
        cantidad: Cantidad.fromMap(json["cantidad"]),
    );

    Map<String, dynamic> toMap() => {
        "cantidad": cantidad.toMap(),
    };
}

class Cantidad {
    Cantidad({
        this.ingresado,
        this.noIngresado,
    });

    int ingresado;
    int noIngresado;

    factory Cantidad.fromMap(Map<String, dynamic> json) => Cantidad(
        ingresado: json["ingresado"],
        noIngresado: json["noIngresado"],
    );

    Map<String, dynamic> toMap() => {
        "ingresado": ingresado,
        "noIngresado": noIngresado,
    };
}
