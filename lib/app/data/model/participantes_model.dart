// To parse this JSON data, do
//
//     final participantesModel = participantesModelFromMap(jsonString);

import 'dart:convert';

ParticipantesModel participantesModelFromMap(String str) => ParticipantesModel.fromMap(json.decode(str));

String participantesModelToMap(ParticipantesModel data) => json.encode(data.toMap());

class ParticipantesModel {
    ParticipantesModel({
        this.objetoRespuesta,
    });

    ObjetoRespuesta objetoRespuesta;

    factory ParticipantesModel.fromMap(Map<String, dynamic> json) => ParticipantesModel(
        objetoRespuesta: ObjetoRespuesta.fromMap(json["objetoRespuesta"]),
    );

    Map<String, dynamic> toMap() => {
        "objetoRespuesta": objetoRespuesta.toMap(),
    };
}

class ObjetoRespuesta {
    ObjetoRespuesta({
        this.listaParticipantes,
    });

    List<ListaParticipante> listaParticipantes;

    factory ObjetoRespuesta.fromMap(Map<String, dynamic> json) => ObjetoRespuesta(
        listaParticipantes: List<ListaParticipante>.from(json["listaParticipantes"].map((x) => ListaParticipante.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "listaParticipantes": List<dynamic>.from(listaParticipantes.map((x) => x.toMap())),
    };
}

class ListaParticipante {
    ListaParticipante({
        this.tnIdParticipante,
        this.tnIdPerfil,
        this.tnIdTipoIdentificacion,
        this.tcIdentificacion,
        this.tcNombre,
        this.tcApellido1,
        this.tcApellido2,
        this.tcCodigoQr,
        this.tcClaveConfirmacion,
        this.tnIdEstado,
        this.tnIdActividad,
          this.estadoIngreso,
    });

    int tnIdParticipante;
    int tnIdPerfil;
    int tnIdTipoIdentificacion;
    String tcIdentificacion;
    String tcNombre;
    String tcApellido1;
    String tcApellido2;
    String tcCodigoQr;
    String tcClaveConfirmacion;
    int tnIdEstado;
    int tnIdActividad;
     String estadoIngreso;

    factory ListaParticipante.fromMap(Map<String, dynamic> json) => ListaParticipante(
        tnIdParticipante: json["tn_IdParticipante"],
        tnIdPerfil: json["tn_IdPerfil"],
        tnIdTipoIdentificacion: json["tn_IdTipoIdentificacion"],
        tcIdentificacion: json["tc_Identificacion"],
        tcNombre: json["tc_Nombre"],
        tcApellido1: json["tc_Apellido1"],
        tcApellido2: json["tc_Apellido2"],
        tcCodigoQr: json["tc_CodigoQR"],
        tcClaveConfirmacion: json["tc_ClaveConfirmacion"],
        tnIdActividad: json["tn_IdActividad"],
        estadoIngreso:json["estadoIngreso"]
    );

    Map<String, dynamic> toMap() => {
        "tn_IdParticipante": tnIdParticipante,
        "tn_IdPerfil": tnIdPerfil,
        "tn_IdTipoIdentificacion": tnIdTipoIdentificacion,
        "tc_Identificacion": tcIdentificacion,
        "tc_Nombre": tcNombre,
        "tc_Apellido1": tcApellido1,
        "tc_Apellido2": tcApellido2,
        "tc_CodigoQR": tcCodigoQr,
        "tc_ClaveConfirmacion": tcClaveConfirmacion,  
        "tn_IdEstado": tnIdEstado,
        "tn_IdActividad": tnIdActividad,
    };
}
