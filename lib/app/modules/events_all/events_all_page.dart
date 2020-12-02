import 'package:cfia_eventos_app/app/global_widgets/circule_global_indicator.dart';
import 'package:cfia_eventos_app/app/global_widgets/custom_text_global_widget.dart';
import 'package:cfia_eventos_app/app/modules/events/events_controller.dart';
import 'package:cfia_eventos_app/app/modules/login/login_controller.dart';
import 'package:cfia_eventos_app/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'local_widgets/event_card_local_widget.dart';

class EventsAllPage extends StatelessWidget {
   EventsAllPage({Key key}) : super(key: key);

  final LoginController login = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            elevation: 0.0,
            backgroundColor: Color(0xFFF8E060D),
            title: CustomGlobalTextWidget(
              text: 'Eventos',
              size: 18.0,
              fontFamily: 'Sen-ExtraBold',
              color: Colors.white,
            ),
            centerTitle: true,
            // leading: Image(image: AssetImage('assets/logo.png')),
            actions: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 12.0, right: 5),
                    child:
                        Image(height: 30, image: AssetImage('assets/logo.png')),
                  ),
                ],
              )
            ]),
        body: GetBuilder<EventsController>(builder: (_) {
          if (_.cargando) {
            return Center(
              child: CircleProgressIndicartorWidget(),
            );
          } else {
            return Column(
              children: [
                SizedBox(
                  height: 15,
                ),
                Flexible(
                    child: ListView.builder(
                        itemCount: _.listaEventos.length,
                        itemBuilder: (BuildContext context, index) {
                          return GestureDetector(
                            onTap: () => Get.toNamed(AppRoutes.ActivitiesPage,arguments: _.listaEventos[index].tnIdEvento,),
                            child: EventLocalCardWidget(
                              index: index,
                              titulo: _.listaEventos[index].tcNombreEspanol,
                              hora: _.listaEventos[index].tfFechaInicio,

                            ),
                          );
                        }))
              ],
            );
          }
        }));
  }
}
