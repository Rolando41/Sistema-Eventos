
import 'package:cfia_eventos_app/app/data/providers/inicio_sesion_api.dart';
import 'package:http/http.dart' as http;
class InicioSensionRepository {
  final InicioSesionApi _inicioSesionApi = InicioSesionApi();

  Future<http.Response> inicioSesion({String usuario,String password}) async {
    return await _inicioSesionApi.inicioSesion(usuario: usuario,password: password);
  }
}
