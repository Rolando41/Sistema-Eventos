import 'dart:convert';

import 'package:cfia_eventos_app/app/data/model/sso_model.dart';
import 'package:cfia_eventos_app/app/data/repository/inicio_sension_repository.dart';
import 'package:cfia_eventos_app/app/routes/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  /* Llamada api de login para comprobar si el token es null o vacio*/

  @override
  void onInit() {
    super.onInit();
    print('iniciado');
  }

  final InicioSensionRepository _inicioSensionRepository =
      InicioSensionRepository();

  RxString _password = "".obs;
  RxString _user = "".obs;

  RxString get password => _password;
  RxString get user => _user;

  RxBool _cargando = false.obs;
  RxBool get cargando => _cargando;

  User _userModel;
  User get obtenerUser => _userModel;

  inicioSesion(String user, String password) async {
    _cargando.value = true;
    update();

    try {
      final response = await _inicioSensionRepository.inicioSesion(
          usuario: user, password: password);
      if (response.statusCode == 200) {
        final respuesta = await jsonDecode(response.body);

        UserModel userResponse = UserModel.fromMap(respuesta);
        if (userResponse.objetoRespuesta.users.length == 0) {
          Get.snackbar(
            'Error al iniciar sesión',
            "El usuario o contraseña ingresada es incorrecta.",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Color(0xFFF8E060D),
            colorText: Colors.white,
          );
        } else if (userResponse.objetoRespuesta.users.length != 0) {
          _userModel = userResponse.objetoRespuesta.users[0];
          if (userResponse.objetoRespuesta.token != '') {
           Get.offAndToNamed(AppRoutes.EventsPage);
          }
        }
      }
    } catch (e) {
      print("Error: $e");
    }
    _cargando.value = false;

    update();
  }
}
