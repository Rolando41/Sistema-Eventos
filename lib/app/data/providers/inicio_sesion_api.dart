import 'package:cfia_eventos_app/app/routes/app_apis.dart';
import 'package:http/http.dart' as http;

class InicioSesionApi {
  final String url = AppApis.LoginApi;

  Future<http.Response> inicioSesion({String usuario, String password}) async {
    String encode = percentEncode(password);
    final response =
        await http.get("$url/$usuario/$encode/${AppApis.ClaveAPi}");

    return response;
  }
}

String percentEncode(String input) {
  input = input.replaceAll('-', '%2D');
  input = input.replaceAll('+', '..2D');
  input = input.replaceAll('_', '%5F');
  input = input.replaceAll('.', '%2E');
  input = input.replaceAll('!', '%21');
  input = input.replaceAll('~', '%7E');
  input = input.replaceAll('*', '%2A');
  input = input.replaceAll('\'', '%5C');
  input = input.replaceAll('(', '%28');
  input = input.replaceAll(')', '%29');

  return input;
}
