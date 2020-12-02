import 'dart:convert';

import 'package:cfia_eventos_app/app/data/model/verificar_user_model.dart';
import 'package:cfia_eventos_app/app/routes/app_apis.dart';
import 'package:http/http.dart' as http;

class QRProcesoApi {
  final String url = AppApis.QrApi;
  final String claves = AppApis.ClaveAPi;
  final String urlEntrada = AppApis.ConfirmarEntrada;

  Future<QrModel> qrVerificarParticipante({int idActividad,String codigoConfir}) async {
    QrModel model = QrModel();
    try {
      final response = await http.get('$url/$claves/$idActividad/$codigoConfir');

      if (response.statusCode == 200) {
        final respuesta = jsonDecode(response.body);
        final participante = QrModel.fromMap(respuesta);
        model = participante;
      }
    } catch (e) {
      print('Error en obtener respuesta QR');
      print("Error: $e");
    }
    return model;
  }


   Future<bool> registrarIngresoActividad(
      {int idActividad, int idParticipante}) async {
      String id = idActividad.toString();
      String idP = idParticipante.toString();
      
    bool resultado;
    try {
      final response = await http.get(
          '$urlEntrada/${AppApis.ClaveAPi}/$id/12/$idP');
    
      if (response.statusCode == 200) {
      
        resultado = true;
      } else if (response.statusCode != 200) {
        
        resultado = false;
      }
    } catch (e) {
      print('Error: $e');
    }

    return resultado;
  }
}
