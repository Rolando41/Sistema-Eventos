import 'dart:convert';

import 'package:cfia_eventos_app/app/data/model/eventos_model.dart';
import 'package:cfia_eventos_app/app/routes/app_apis.dart';
import 'package:http/http.dart' as http;

class EventosApi {
  final String url = AppApis.EventosApi;

  Future<List<ListaEvento>> obtenerEventos() async {
    List<ListaEvento> listaEventos = [];
    try {
      final response = await http.get("$url/${AppApis.ClaveAPi}");
      if (response.statusCode == 200) {
        final bodyResponse = jsonDecode(response.body);

        final lista = EventosModel.fromMap(bodyResponse);
       List<ListaEvento> listaEvento =  lista.objetoRespuesta.listaEventos;
     
        listaEventos = listaEvento;
      }
    } catch (e) {
      print(e);
    }
    return listaEventos;
  }
}
