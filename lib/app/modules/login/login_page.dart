import 'package:cfia_eventos_app/app/global_widgets/appbar_global_widget.dart';
import 'package:cfia_eventos_app/app/global_widgets/circule_global_indicator.dart';
import 'package:cfia_eventos_app/app/global_widgets/custom_text_global_widget.dart';
import 'package:cfia_eventos_app/app/modules/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  final myControllerUser = TextEditingController();
  final myControllerPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final heigth = size.height;

   

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppbarGlobalWidget(
          elevation: 0.0,
          appBar: AppBar(),
          backgroundColor: Color(0xFFF8E060D),
          url: 'assets/logo.png',
        ),
        body: GetBuilder<LoginController>(
          builder: (_) {
          return GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: SingleChildScrollView(
              child: SizedBox(
                width: double.infinity,
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: heigth * 0.05,
                      ),
                      Image(
                        image: AssetImage(
                          'assets/logoo.png',
                        ),
                        width: width * 0.48,
                      ),
                      SizedBox(
                        height: heigth * 0.05,
                      ),
                      CustomGlobalTextWidget(
                        text: 'Sistema de eventos',
                        fontFamily: 'Sen-ExtraBold',
                        size: 25.0,
                        
                      ),
                      SizedBox(
                        height: heigth * 0.05,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        child: TextFormField(
                          controller: myControllerUser,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            icon: Icon(Icons.person, color: Color(0xFFF8E060D)),
                            labelText: 'Usuario',
                            labelStyle: TextStyle(fontFamily: 'Sen-ExtraBold'),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red),
                            ),
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Ingresar usuario.';
                            }
                            return null;
                          },
                        ),
                        width: width * 0.9,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        child: TextFormField(
                          controller: myControllerPassword,
                          obscureText: true,
                          decoration: InputDecoration(
                            icon: Icon(Icons.lock_outline,
                                color: Color(0xFFF8E060D)),
                            labelText: 'Contraseña',
                            labelStyle: TextStyle(fontFamily: 'Sen-ExtraBold'),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red),
                            ),
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Ingresar contraseña.';
                            }
                            return null;
                          },
                        ),
                        width: width * 0.9,
                      ),
                      SizedBox(
                        height: heigth * 0.05,
                      ),
                      (_.cargando.value)
                          ? Center(child: CircleProgressIndicartorWidget())
                          : RaisedButton(
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 80.0, vertical: 15.0),
                                child: CustomGlobalTextWidget(
                                  text: 'Ingresar',
                                  fontFamily: 'Sen-ExtraBold',
                                  color: Colors.white,
                                  size: 18.0,
                                ),
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50.0)),
                              elevation: 0.0,
                              color: Color(0xFFF8E060D),
                              textColor: Colors.white,
                              onPressed: () => {
                                    if (_formKey.currentState.validate())
                                      {
                          
                                        _.inicioSesion(
                                            '${myControllerUser.text}',
                                            '${myControllerPassword.text}')
                                      }
                                  }),
                    ],
                  ),
                ),
              ),
            ),
          );
        }));
  }
}
