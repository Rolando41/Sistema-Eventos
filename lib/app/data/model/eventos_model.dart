
class EventosModel {
    EventosModel({
        this.objetoRespuesta,
    });

    ObjetoRespuesta objetoRespuesta;

    factory EventosModel.fromMap(Map<String, dynamic> json) => EventosModel(
        objetoRespuesta: ObjetoRespuesta.fromMap(json["objetoRespuesta"]),
    );

    Map<String, dynamic> toMap() => {
        "objetoRespuesta": objetoRespuesta.toMap(),
    };
}

class ObjetoRespuesta {
    ObjetoRespuesta({
        this.listaEventos,
    });

    List<ListaEvento> listaEventos;

    factory ObjetoRespuesta.fromMap(Map<String, dynamic> json) => ObjetoRespuesta(
        listaEventos: List<ListaEvento>.from(json["listaEventos"].map((x) => ListaEvento.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "listaEventos": List<dynamic>.from(listaEventos.map((x) => x.toMap())),
    };
}

class ListaEvento {
    ListaEvento({
        this.tnIdEvento,
        this.tcNombreEspanol,
        this.tcNombreIngles,
        this.tcDescripcionEspanol,
        this.tcDescripcionIngles,
        this.tcImagen,
        this.tcDescripcionCorreo,
        this.tfFechaInicio,
        this.tfFechaCierre,
        this.tbActivo,
        this.tnIdEstadoEvento,
        this.tnCantidadPersonas,
    });

    int tnIdEvento;
    String tcNombreEspanol;
    String tcNombreIngles;
    String tcDescripcionEspanol;
    String tcDescripcionIngles;
    String tcImagen;
    String tcDescripcionCorreo;
    DateTime tfFechaInicio;
    DateTime tfFechaCierre;
    bool tbActivo;
    int tnIdEstadoEvento;
    int tnCantidadPersonas;

    factory ListaEvento.fromMap(Map<String, dynamic> json) => ListaEvento(
        tnIdEvento: json["tn_IdEvento"],
        tcNombreEspanol: json["tc_NombreEspanol"],
        tcNombreIngles: json["tc_NombreIngles"],
        tcDescripcionEspanol: json["tc_DescripcionEspanol"],
        tcDescripcionIngles: json["tc_DescripcionIngles"],
        tcImagen: json["tc_Imagen"],
        tcDescripcionCorreo: json["tc_DescripcionCorreo"],
        tfFechaInicio: DateTime.parse(json["tf_FechaInicio"]),
        tfFechaCierre: DateTime.parse(json["tf_FechaCierre"]),
        tbActivo: json["tb_Activo"],
        tnIdEstadoEvento: json["tn_IdEstadoEvento"],
        tnCantidadPersonas: json["tn_CantidadPersonas"],
    );

    Map<String, dynamic> toMap() => {
        "tn_IdEvento": tnIdEvento,
        "tc_NombreEspanol": tcNombreEspanol,
        "tc_NombreIngles": tcNombreIngles,
        "tc_DescripcionEspanol": tcDescripcionEspanol,
        "tc_DescripcionIngles": tcDescripcionIngles,
        "tc_Imagen": tcImagen,
        "tc_DescripcionCorreo": tcDescripcionCorreo,
        "tf_FechaInicio": tfFechaInicio.toIso8601String(),
        "tf_FechaCierre": tfFechaCierre.toIso8601String(),
        "tb_Activo": tbActivo,
        "tn_IdEstadoEvento": tnIdEstadoEvento,
        "tn_CantidadPersonas": tnCantidadPersonas,
    };
}
