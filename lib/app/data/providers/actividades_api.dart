import 'dart:convert';
import 'package:cfia_eventos_app/app/data/model/actividades_model.dart';
import 'package:cfia_eventos_app/app/routes/app_apis.dart';
import 'package:http/http.dart' as http;

class ActividadesApi {
  final String url = AppApis.ActividadesApi;
  

  Future<List<ListaActividad>> obtenerActividades(int id) async {
    List<ListaActividad> listaActividades = [];

    try {
      final response = await http.get('$url/${AppApis.ClaveAPi}/$id');

      if (response.statusCode == 200) {
        final bodyResponse = jsonDecode(response.body);

        ActividadesModel lista = ActividadesModel.fromMap(bodyResponse);

        listaActividades = lista.objetoRespuesta.listaActividad;
      }
    } catch (e) {
      print('Error: $e');
    }
    return listaActividades;
  }

 
}
