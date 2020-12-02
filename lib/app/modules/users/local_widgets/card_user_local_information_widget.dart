
import 'package:cfia_eventos_app/app/global_widgets/custom_text_global_widget.dart';
import 'package:flutter/material.dart';


class CardUserLocalInformationWidget extends StatelessWidget {
  final String textoNombre;
  final String estado;
  final double tamanioLetra;
  const CardUserLocalInformationWidget(
      {Key key, this.textoNombre, this.estado, this.tamanioLetra})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    if (textoNombre != null && textoNombre != '' && estado != null) {
      return Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
        child: Container(
          height: size.height/12.5,
          child: Card(
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 15.0,
                  ),
                  Container(
                    //color: Colors.red,
                    width: 250,
                    child: CustomGlobalTextWidget(
                      text: (textoNombre == null) ? '' : textoNombre,
                      size:
                          (tamanioLetra == null) ? 13.0 : tamanioLetra,
                      fontFamily: 'Sen-Bold',
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),

                  ClipRRect(
                      borderRadius: BorderRadius.circular(50.0),
                      child: (estado == "Ingresado")
                          ? Icon(
                              Icons.supervised_user_circle,
                              size: 25,
                              color: Colors.green,
                            )
                          : Icon(
                              Icons.supervised_user_circle,
                              size: 25,
                              color: Color(0xFFF8E060D),
                            )),
                ],
              ),
            ),
          ),
        ),
      );
    } else {
      return Container();
    }
  }
}
