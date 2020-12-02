import 'package:cfia_eventos_app/app/global_widgets/appbar_global_widget.dart';
import 'package:cfia_eventos_app/app/global_widgets/circule_global_indicator.dart';
import 'package:cfia_eventos_app/app/modules/login/login_controller.dart';
import 'package:cfia_eventos_app/app/modules/user_profile/user_profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'local_widget/box_activity_local_row_widget.dart';
import 'local_widget/information_local_box_widget.dart';
import 'local_widget/picture_local_widget.dart';
import 'local_widget/user_entry_local_widget.dart';
import 'local_widget/user_local_name_widget.dart';

class UserProfilePage extends StatelessWidget {
  UserProfilePage({Key key, this.nombreActividad, this.horaActividad, this.idActividad}) : super(key: key);
  final String nombreActividad;
  final int idActividad;
  final DateTime horaActividad;
  final LoginController loginController = Get.find();
  final UserProfileController userProfileController = Get.find();

  @override
  Widget build(BuildContext context) {
    final hora = DateFormat('jms').format(horaActividad);
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppbarGlobalWidget(
          title: 'Eventos FMOI',
          elevation: 05,
          appBar: AppBar(),
          backgroundColor: Color(0xFFF8E060D),
          url: 'assets/logo.png',
          size: 20.0,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              PictureLocalWidget(
                  size: size,
                  url:
                      'https://concepto.de/wp-content/uploads/2018/08/persona-e1533759204552.jpg'),
              GetBuilder(builder: (_) {
                userProfileController.obtenerCantidadIngresado(id: idActividad);
                
                
                return UserLocalNameWidget(
                    username: loginController.obtenerUser.fullName);
              }),
              //
              SizedBox(
                height: 15.0,
              ),
              BoxActivityLocalRowWidget(
                  title: 'Nombre de actividad:',
                  nameActivity: nombreActividad),
              SizedBox(
                height: 5.0,
              ),
              BoxActivityLocalRowWidget(
                  title: 'Hora de actividad:',nameActivity: hora, ),
              SizedBox(
                height: 15.0,
              ),
              InformationLocalBoxWidget(
                title: 'Asistencia',
              ),
              SizedBox(
                height: 15.0,
              ),
              GetBuilder<UserProfileController>(
                id:'can',
                builder: (_){
                return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  (userProfileController.cargando)?Center(child: CircleProgressIndicartorWidget()):UsersEntryLocalWidget(
                    size: size,
                    title: 'Ingresados',
                    color: Colors.green,
                    count: userProfileController.ingresados
                  ),
                   (userProfileController.cargando)?Center(child: CircleProgressIndicartorWidget()):UsersEntryLocalWidget(
                    size: size,
                    title: 'No ingresados',
                    color: Color(0xFFF8E060D),
                    count: userProfileController.noingresados

                  ),
                ],
              );
              })
            ],
          ),
        ));
  }
}


