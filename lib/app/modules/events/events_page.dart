
import 'package:cfia_eventos_app/app/data/model/actividades_model.dart';
import 'package:cfia_eventos_app/app/global_widgets/activity_card_global_information_widget.dart';
import 'package:cfia_eventos_app/app/global_widgets/card_event_global_information_widget.dart';
import 'package:cfia_eventos_app/app/global_widgets/circule_global_indicator.dart';
import 'package:cfia_eventos_app/app/global_widgets/custom_text_global_widget.dart';
import 'package:cfia_eventos_app/app/modules/events/events_controller.dart';
import 'package:cfia_eventos_app/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:random_color/random_color.dart';

import 'local_widget/row_local_information_widget.dart';

class EventsPage extends StatefulWidget {
  EventsPage({Key key}) : super(key: key);

  @override
  _EventsPageState createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  final RandomColor _randon = RandomColor();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Color(0xFFF8E060D),
          title:  CustomGlobalTextWidget(
              text: 'Eventos',
              color: Colors.white,
              fontFamily: 'Sen-ExtraBold',
              size: 18,
            ),
          centerTitle: true,
          leading: Image(image: AssetImage('assets/logo.png')),
        ),
        body: GetBuilder<EventsController>(
            init: EventsController(),
            builder: (_) {
              if (_.cargando) {
                return Center(child: CircleProgressIndicartorWidget());
              } else if (_.listaEventos.length <= 0) {
                return Center(
                  child: CustomGlobalTextWidget(
                      text: 'Eventos no disponibles',
                      size: 15.0,
                      fontFamily: 'Sen-ExtraBold'),
                );
              } else {
                return Column(
                  children: [
                    SizedBox(
                      height: 5.0,
                    ),
                    RowLocalInformationEventWidget(
                      title: 'Eventos disponibles',
                      subtitle: 'ver todos',
                      callbackAction: () =>
                          Get.toNamed(AppRoutes.EventsAllPage),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                  
                      child: SizedBox(
                        //cambiar este a 6
                          height: size.height / 5.5,
                        
                          child: PageView.builder(
                            reverse: false,
                            controller: PageController(
                                initialPage: 0,
                                viewportFraction: 1,
                                keepPage: false),
                            itemBuilder: (context, index) {
                                _.obtenerActividades(_.listaEventos[index].tnIdEvento);
                          
                              return CardEventGlobalInformationWidget(
                                titulo: _.listaEventos[index].tcNombreEspanol,
                                //cantidadActividades: _.listaActividades.length,
                                size: size,
                                color: _randon.randomColor(
                                    colorBrightness: ColorBrightness.dark),
                              );
                            },
                            itemCount: _.listaEventos.length,
                            onPageChanged: (value) {
                              _.obtenerActividades(_.listaEventos[value].tnIdEvento);
                            },
                          )),
                    ),
                    RowLocalInformationEventWidget(
                      title: 'Actividades disponibles',
                    ),
                    Expanded(
                      child: GetBuilder<EventsController>(
                        id: 'ActividadesID',
                        builder: (_) {
                          if (_.cargandoA) {
                            return Center(
                                child: CircleProgressIndicartorWidget());
                          } else if (_.listaActividades.length <= 0) {
                            return Center(
                              child: CustomGlobalTextWidget(
                                text: 'No hay actividades para mostrar',
                                size: 15.0,
                                fontFamily: 'Sen-ExtraBold',
                              ),
                            );
                          } else if (_.cambioA) {
                            return Center(
                                child: CircleProgressIndicartorWidget()
                                
                                );
                          } else {
                            return ListView.builder(
                              itemCount: _.listaActividades.length,
                              itemBuilder: (context, index) {
                                
                                return GestureDetector(
                                  onTap: () => {
                                   
                                    Get.toNamed(
                                      AppRoutes.ButtonNavigation,
                                      arguments: ListaActividad(
                                          iDActividad: _.listaActividades[index]
                                              .iDActividad,
                                          tituloEspanol: _
                                              .listaActividades[index]
                                              .tituloEspanol,
                                              fecha: _.listaActividades[index].fecha
                                              ),
                                    ),
                                  },
                                  child: ActivityGlobalCardInformationWidget(
                                    titulo:
                                        _.listaActividades[index].tituloEspanol,
                                        fecha: _.listaActividades[index].fecha,
                                  ),
                                );
                              },
                            );
                          }
                        },
                      ),
                    )
                  ],
                );
              }
            }));
  }
}
