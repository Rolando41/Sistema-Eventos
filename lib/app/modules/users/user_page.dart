import 'package:cfia_eventos_app/app/global_widgets/appbar_global_widget.dart';
import 'package:cfia_eventos_app/app/global_widgets/circule_global_indicator.dart';
import 'package:cfia_eventos_app/app/global_widgets/custom_text_global_widget.dart';
import 'package:cfia_eventos_app/app/modules/users/user_controller.dart';
import 'package:cfia_eventos_app/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'local_widgets/card_user_local_information_widget.dart';
import 'local_widgets/information_local_widget.dart';
import 'local_widgets/search_local_widget.dart';

/* Página de visualización de los participantes, dicha page muestra los participantes de cada envento*/

class UsersPage extends StatelessWidget {
  final int idActividades;
  UsersPage({Key key, this.idActividades}) : super(key: key);

  final UserController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    print('UsersPage $idActividades');
    final size = MediaQuery.of(context).size;
    return GetBuilder(
        init: UserController(),
        builder: (_) {
          return Scaffold(
              backgroundColor: Colors.white,
              appBar: AppbarGlobalWidget(
                elevation: 0.0,
                appBar: AppBar(),
                title: 'Búsqueda de participantes',
                size: 15.0,
                backgroundColor: Color(0xFFF8E060D),
                url: 'assets/logo.png',
              ),
              body: GetBuilder(builder: (_) {
                controller.obtenerParticipantes(idActividades);

                if (controller.cargando) {
                  return Center(
                    child: CircleProgressIndicartorWidget(),
                  );
                } else if (controller.listaParticipantes.length <= 0) {
                  return Center(
                      child: CustomGlobalTextWidget(
                    text: 'No hay participantes para mostrar',
                  ));
                } else {
                  return Column(
                    children: [
                      GestureDetector(
                          onTap: () {
                            print('argument $idActividades');
                            Get.toNamed(AppRoutes.SearchPage,
                                arguments: this.idActividades);
                          },
                          child: SearchLocalWidget()),
                      SizedBox(
                        height: 15.0,
                      ),
                      InformationLocalWidget(size: size.width),
                      SizedBox(
                        height: size.height / 30,
                      ),
                      Expanded(
                        child: ListView.builder(
                            itemCount: controller.listaParticipantes.length,
                            itemBuilder: (context, index) {
                              return CardUserLocalInformationWidget(
                                estado: controller.listaParticipantes[index].estadoIngreso,
                                textoNombre:
                                    '${controller.listaParticipantes[index].tcNombre} ${controller.listaParticipantes[index].tcApellido1} ${controller.listaParticipantes[index].tcApellido2}',
                              );
                            }),
                      )
                    ],
                  );
                }
              }));
        });
  }
}
