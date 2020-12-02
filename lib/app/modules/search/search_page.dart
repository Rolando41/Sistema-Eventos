import 'package:cfia_eventos_app/app/global_widgets/custom_text_global_widget.dart';
import 'package:cfia_eventos_app/app/modules/search/search_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'local_widgets/card_search_local_information_widget.dart';

class SearchPage extends StatelessWidget {
  SearchPage({Key key}) : super(key: key);
  final myController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context).settings.arguments;
    final size = MediaQuery.of(context).size;
    return GetBuilder<SearchController>(
        init: SearchController(),
        builder: (_) {
          _.obtenerParticipantes(id);
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              elevation: 0.0,
              backgroundColor: Color(0xFFF8E060D),
              centerTitle: true,
              title: CustomGlobalTextWidget(
                text: 'Búsqueda de participantes',
                color: Colors.white,
                fontFamily: 'Sen-ExtraBold',
              ),
              leading: IconButton(
                  color: Color(0xFFFFB819),
                  icon: Icon(Icons.arrow_back),
                  onPressed: () => Navigator.pop(context)),
            ),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 15.0, top: 15.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: 250,
                        child: TextFormField(
                          controller: myController,
                          enabled: true,
                          decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide:
                                      BorderSide(color: Color(0xFFFFB819))),
                              contentPadding:
                                  EdgeInsets.only(top: 10, left: 10),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              hintText: 'Nombre  de participante',
                              hintStyle: TextStyle(
                                  fontFamily: 'Sen-ExtraBold', fontSize: 13.0),
                              focusColor: Colors.red),
                        ),
                      ),
                      SizedBox(
                        width: 15.0,
                      ),
                      InkWell(
                        onTap: () {
                          _.buscarParticipante(myController.text);
                        
                        },
                        child: Container(
                          height: 50,
                          width: 59,
                          child: Card(
                            color: Color(0xFFF8E060D),
                            child: Icon(
                              FontAwesomeIcons.search,
                              color: Color(0xFFFFB819),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height / 40.0,
                ),
                GetX<SearchController>(
                  builder: (_) {
                    if (_.listaNombres.length <= 0) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 200,
                          ),
                          CustomGlobalTextWidget(
                            text: 'Realiza una búsqueda',
                            size: 15.0,
                            fontFamily: 'Sen-ExtraBold',
                          ),
                        ],
                      );
                    } else {
                      return Flexible(
                        child: ListView.builder(
                            itemCount: _.listaNombres.length,
                            itemBuilder: (context, index) {
                              return CardSearchLocalInformationWidget(
                                estado: false,
                                textoNombre:
                                    '${_.listaNombres[index].tcNombre} ${_.listaNombres[index].tcApellido1} ${_.listaNombres[index].tcApellido2}',
                              );
                            }),
                      );
                    }
                  },
                ),
              ],
            ),
          );
        });
  }
}
