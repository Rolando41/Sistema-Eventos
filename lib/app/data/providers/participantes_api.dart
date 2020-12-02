import 'dart:convert';
import 'package:cfia_eventos_app/app/data/model/cantidad_ingresados_model.dart';
import 'package:cfia_eventos_app/app/data/model/participantes_model.dart';
import 'package:cfia_eventos_app/app/routes/app_apis.dart';
import 'package:http/http.dart' as http;

class ParticipantesApi {
  final String url = AppApis.ParticipantesApi;
  final String urlCantidad = AppApis.Ingresados;

  Future<List<ListaParticipante>> obtenerParticipantes(int id) async {
    List<ListaParticipante> listaParticipantes = [];

    try {
      final response = await http.get('$url/${AppApis.ClaveAPi}/$id');

      if (response.statusCode == 200) {
        Map<String, dynamic> bodyResponse = jsonDecode(response.body);

        final lista = ParticipantesModel.fromMap(bodyResponse);
        List<ListaParticipante> listas =
            lista.objetoRespuesta.listaParticipantes;
        listaParticipantes = listas;
      }
    } catch (e) {
      print('Error: $e');
    }
    return listaParticipantes;
  }

  Future<Cantidad> obtenerCantidadParticipantes(int id) async {
    Cantidad cantidadP = Cantidad();
    try {
      final response = await http.get('$urlCantidad/${AppApis.ClaveAPi}/$id');

      if (response.statusCode == 200) {
        Map<String, dynamic> bodyResponse = jsonDecode(response.body);
        final objeto = CantidadParticipantes.fromMap(bodyResponse);
        cantidadP = objeto.cantidad;
      }
    } catch (e) {
      print('Error: $e');
    }
    return cantidadP;
  }
}
