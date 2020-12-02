
import 'package:cfia_eventos_app/app/global_widgets/custom_text_global_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:random_color/random_color.dart';

class EventLocalCardWidget extends StatelessWidget {
  final RandomColor _randon = RandomColor();
  final int index;
  final DateTime hora;
  final String titulo;
  EventLocalCardWidget({
    Key key,
    this.index, this.hora, this.titulo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final fe = DateFormat('jms').format(hora);
    Color color = _randon.randomColor();
    return Padding(
      padding: const EdgeInsets.only(left: 5.0, right: 5.0),
      child: SizedBox(
          height: 70,
          child: Card(
            elevation: 0.2,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    topLeft: Radius.circular(15))),
            child: Stack(
              children: [
                Positioned(
                  top: 5.0,
                  child: Container(
                    //size.height / 11.5
                    height: (size.height <= 640)?size.height / 11.5: size.height / 15,
                    width: size.width - 25,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(color: Colors.white, width: 0.0),
                      color: color,
                    ),
                  ),
                ),
                Positioned(
                  left: 5.0,
                  bottom: 0.5,
                  child: Container(
                      height: size.height / 11.3,
                      width: size.width - 25,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 0.0),
                        color: Colors.white,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 15,
                            child: Icon(
                              FontAwesomeIcons.ticketAlt,
                              color: Color(0xFFF8E060D).withOpacity(0.8),
                            ),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Flexible(
                            child: SizedBox(
                              width: 220,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomGlobalTextWidget(
                                    text: titulo,
                                    fontFamily: 'Sen-ExtraBold',
                                    color: Colors.black.withOpacity(0.8),
                                  ),
                                  CustomGlobalTextWidget(
                                    text: 'Hora de inicio : $fe',
                                    fontFamily: 'Sen-Bold',
                                  )
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 10.0),
                            child: SizedBox(
                              width: 30,
                              child: Icon(
                                FontAwesomeIcons.arrowAltCircleRight,
                                color: Color(0xFFF8E060D),
                              ),
                            ),
                          ),
                        ],
                      )),
                )
              ],
            ),
          )),
    );
  }
}
