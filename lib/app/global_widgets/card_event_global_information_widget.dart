import 'package:flutter/material.dart';

import 'custom_text_global_widget.dart';

class CardEventGlobalInformationWidget extends StatelessWidget {
  final Color color;
  final int cantidadActividades;
  final String titulo;
  CardEventGlobalInformationWidget({
    Key key,
    this.size,
    this.color,
    this.cantidadActividades,
    this.titulo,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.black,
      child: Stack(
        children: [
           
          Card(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              elevation: 3,
              color: color,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 10.0, bottom: 5.0, right: 10.0),
                    child: Center(
                      child: CustomGlobalTextWidget(
                        text: titulo,
                        fontFamily: 'Sen-ExtraBold',
                        size: 15.0,
                        color: Colors.white,
                      ),
                    ),
                  ),        
                  // Positioned(
                  //     bottom: 10.5,
                  //     child: Padding(
                  //       padding: const EdgeInsets.only(left: 10.0),
                  //       child: Row(
                  //         children: [
                  //           CustomGlobalTextWidget(
                  //             text: 'Cantidad de actividades :',
                  //             fontFamily: 'Sen-Bold',
                  //             color: Colors.white,
                  //             size: 10.0,
                  //           ),
                  //           SizedBox(
                  //             width: 10,
                  //           ),
                  //           CustomGlobalTextWidget(
                  //             text: ' $cantidadActividades',
                  //             fontFamily: 'Sen-Bold',
                  //             size: 10.0,
                  //             color: Colors.white,
                  //           )
                  //         ],
                  //       ),
                  //     ))
                ],
              )),

             
        ],
      ),
    );
  }
}
