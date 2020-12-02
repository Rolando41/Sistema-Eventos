import 'package:cfia_eventos_app/app/global_widgets/appbar_global_widget.dart';
import 'package:cfia_eventos_app/app/global_widgets/custom_text_global_widget.dart';
import 'package:cfia_eventos_app/app/modules/qr/qr_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'local_widgets/picture_local_widget.dart';

class QrPage extends StatelessWidget {
  final String nombreActividad;
  final int idActividad;
  QrPage({Key key, this.nombreActividad, this.idActividad}) : super(key: key);
  final QrController qrController = Get.find();
 

  @override
  Widget build(BuildContext context) {
    qrController.buildContext(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppbarGlobalWidget(
          elevation: 0.0,
          appBar: AppBar(),
          backgroundColor: Color(0xFFF8E060D),
          url: 'assets/logo.png',
          title: 'Eventos FMOI',
          size: 18,
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, top: 20),
                    child: CustomGlobalTextWidget(
                        text: 'Nombre de actividad:',
                        color: Colors.black54,
                        size: 15.0,
                        fontFamily: 'Sen-ExtraBold'),
                  ),
                ],
              ),
              SizedBox(height: 10.0),
              Flexible(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomGlobalTextWidget(
                    text: nombreActividad,
                    color: Colors.black54,
                    size: 18.0,
                    fontFamily: 'Sen-ExtraBold'),
              )),
              SizedBox(height: size.height / 15),
              PicturLocalWidget(size: size),
              SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: (){
                  qrController.scannearQR(idActividad);
                },
                child:(qrController.cargando)?CircularProgressIndicator():Container(
                  width: size.width / 1.5,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Color(0xFFF8E060D),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        FontAwesomeIcons.qrcode,
                        color: Color(0xFFFFB819),
                        size: 28,
                      ),
                      CustomGlobalTextWidget(
                        text: 'Iniciar scanner',
                        color: Colors.white,
                        size: 18,
                        fontFamily: 'Sen-Bold',
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              )
            ],
          ),
        ));
  }
}

Widget widgetBoton(Size size) {
  return Container(
      width: size.width / 1.5,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Color(0xFFF8E060D),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(
            FontAwesomeIcons.qrcode,
            color: Color(0xFFFFB819),
            size: 28,
          ),
          CustomGlobalTextWidget(
            text: 'Iniciar scanner',
            color: Colors.white,
            size: 18,
            fontFamily: 'Sen-Bold',
          )
        ],
      ));
}
