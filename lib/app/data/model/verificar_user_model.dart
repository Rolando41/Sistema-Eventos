
import 'dart:convert';

QrModel qrModelFromMap(String str) => QrModel.fromMap(json.decode(str));

String qrModelToMap(QrModel data) => json.encode(data.toMap());

class QrModel {
    QrModel({
        this.participante,
        this.clave,
    });

    Participante participante;
    String clave;

    factory QrModel.fromMap(Map<String, dynamic> json){
      
    final participante = json["participante"];

    if(participante == null ){
      return QrModel(
        clave: json["clave"],
    );
    }else{
       return QrModel(
        participante: Participante.fromMap(json["participante"]),
        clave: json["clave"],
    );
    }

      }

    Map<String, dynamic> toMap() => {
        "participante": participante.toMap(),
        "clave": clave,
    };
}

class Participante {
    Participante({
        this.tnIdActividad,
        this.tcNombre,
        this.tcClaveConfirmacion,
        this.tnIdEstado,
        this.tcEstado,
        this.tnIdParticipante,
    });

    int tnIdActividad;
    String tcNombre;
    String tcClaveConfirmacion;
    int tnIdEstado;
    String tcEstado;
    int tnIdParticipante;

    factory Participante.fromMap(Map<String, dynamic> json) => Participante(
        tnIdActividad: json["tn_IdActividad"],
        tcNombre: json["tc_Nombre"],
        tcClaveConfirmacion: json["tc_ClaveConfirmacion"],
        tnIdEstado: json["tn_IdEstado"],
        tcEstado: json["tc_Estado"],
        tnIdParticipante: json["tn_IdParticipante"],
    );

    Map<String, dynamic> toMap() => {
        "tn_IdActividad": tnIdActividad,
        "tc_Nombre": tcNombre,
        "tc_ClaveConfirmacion": tcClaveConfirmacion,
        "tn_IdEstado": tnIdEstado,
        "tc_Estado": tcEstado,
        "tn_IdParticipante": tnIdParticipante,
    };
}
