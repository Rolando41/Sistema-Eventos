// To parse this JSON data, do
//
//     final actividadesModel = actividadesModelFromMap(jsonString);

import 'dart:convert';

ActividadesModel actividadesModelFromMap(String str) => ActividadesModel.fromMap(json.decode(str));

String actividadesModelToMap(ActividadesModel data) => json.encode(data.toMap());

class ActividadesModel {
    ActividadesModel({
        this.objetoRespuesta,
    });

    ObjetoRespuesta objetoRespuesta;

    factory ActividadesModel.fromMap(Map<String, dynamic> json) => ActividadesModel(
        objetoRespuesta: ObjetoRespuesta.fromMap(json["objetoRespuesta"]),
    );

    Map<String, dynamic> toMap() => {
        "objetoRespuesta": objetoRespuesta.toMap(),
    };
}

class ObjetoRespuesta {
    ObjetoRespuesta({
        this.listaActividad,
    });

    List<ListaActividad> listaActividad;

    factory ObjetoRespuesta.fromMap(Map<String, dynamic> json) => ObjetoRespuesta(
        listaActividad: List<ListaActividad>.from(json["listaActividades"].map((x) => ListaActividad.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "listaActividades": List<dynamic>.from(listaActividad.map((x) => x.toMap())),
    };
}

class ListaActividad {
    ListaActividad({
        this.iDActividad,
        this.tituloEspanol,
        this.tituloIngles,
        this.temaEspanol,
        this.temaIngles,
        this.fecha,
        this.expositor,
        this.lugar,
        this.descripcionEspanol,
        this.descripcionIngles,
        this.imagen,
        this.idEstado,
        this.activo,
        this.cantidadPersonas,
        this.adicional,
        this.tnIdEvento,
      
    });

    int iDActividad;
    String tituloEspanol;
    String tituloIngles;
    String temaEspanol;
    String temaIngles;
    DateTime fecha;
    String expositor;
    String lugar;
    String descripcionEspanol;
    String descripcionIngles;
   
    dynamic imagen;
    int idEstado;
    bool activo;
    int cantidadPersonas;
    bool adicional;
    int tnIdEvento;

    factory ListaActividad.fromMap(Map<String, dynamic> json) => ListaActividad(
        iDActividad: json["iD_Actividad"],
        tituloEspanol: json["titulo_Espanol"],
        tituloIngles: json["titulo_Ingles"],
        temaEspanol: json["temaEspanol"],
        temaIngles: json["temaIngles"],
        fecha: DateTime.parse(json["fecha"]),
        expositor: json["expositor"],
        lugar: json["lugar"],
        descripcionEspanol: json["descripcionEspanol"],
        descripcionIngles: json["descripcionIngles"],
        imagen: json["imagen"],
        idEstado: json["idEstado"],
        activo: json["activo"],
        cantidadPersonas: json["cantidadPersonas"],
        adicional: json["adicional"],
        tnIdEvento: json["tn_IdEvento"],
        
    );

    Map<String, dynamic> toMap() => {
        "iD_Actividad": iDActividad,
        "titulo_Espanol": tituloEspanol,
        "titulo_Ingles": tituloIngles,
        "temaEspanol": temaEspanol,
        "temaIngles": temaIngles,
        "fecha": fecha.toIso8601String(),
        "expositor": expositor,
        "lugar": lugar,
        "descripcionEspanol": descripcionEspanol,
        "descripcionIngles": descripcionIngles,
        "imagen": imagen,
        "idEstado": idEstado,
        "activo": activo,
        "cantidadPersonas": cantidadPersonas,
        "adicional": adicional,
        "tn_IdEvento": tnIdEvento,
    };
}
