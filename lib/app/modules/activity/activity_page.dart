import 'package:cfia_eventos_app/app/data/model/actividades_model.dart';
import 'package:cfia_eventos_app/app/global_widgets/activity_card_global_information_widget.dart';
import 'package:cfia_eventos_app/app/global_widgets/circule_global_indicator.dart';
import 'package:cfia_eventos_app/app/global_widgets/custom_text_global_widget.dart';
import 'package:cfia_eventos_app/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'activity_controller.dart';

class ActivitiesPage extends StatelessWidget {
  const ActivitiesPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context).settings.arguments;
    return GetBuilder<ActivityController>(builder: (_) {
      _.obtenerActividades(arguments);
      return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
              centerTitle: true,
              elevation: 0.0,
              backgroundColor: Color(0xFFF8E060D),
              title: CustomGlobalTextWidget(
                text: 'Actividades',
                size: 18.0,
                fontFamily: 'Sen-ExtraBold',
                color: Colors.white,
              ),
              actions: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 12.0, right: 5),
                      child: Image(
                          height: 30, image: AssetImage('assets/logo.png')),
                    ),
                  ],
                )
              ]),
          body: GetBuilder<ActivityController>(
              id: 'ActividadesID',
              builder: (_) {
               
                if (_.cargando) {
                  return Center(
                    child: CircleProgressIndicartorWidget(),
                  );
                } else if (_.listaVacia) {
                  return Center(
                    child: CustomGlobalTextWidget(
                      text: 'No hay actividades para mostrar',
                      size: 15.0,
                      fontFamily: 'Sen-ExtraBold',
                    ),
                  );
                } else {
                  return ListView.builder(
                      itemCount: _.listaActividades.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                            onTap: () => {
                                  Get.toNamed(AppRoutes.ButtonNavigation,
                                      arguments: ListaActividad(
                                          iDActividad: _.listaActividades[index]
                                              .iDActividad,
                                          tituloEspanol: _
                                              .listaActividades[index]
                                              .tituloEspanol,
                                               fecha: _.listaActividades[index].fecha
                                              ))
                                },
                            child: ActivityGlobalCardInformationWidget(
                              titulo: _.listaActividades[index].tituloEspanol,
                              fecha: _.listaActividades[index].fecha,
                            ));
                      });
                }
              }));
    });
  }
}
