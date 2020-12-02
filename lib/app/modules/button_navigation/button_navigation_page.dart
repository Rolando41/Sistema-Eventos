import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:cfia_eventos_app/app/data/model/actividades_model.dart';
import 'package:cfia_eventos_app/app/modules/button_navigation/button_navigation_controller.dart';
import 'package:cfia_eventos_app/app/modules/qr/qr_controller.dart';
import 'package:cfia_eventos_app/app/modules/qr/qr_page.dart';
import 'package:cfia_eventos_app/app/modules/user_profile/user_profile_controller.dart';
import 'package:cfia_eventos_app/app/modules/user_profile/user_profile_page.dart';
import 'package:cfia_eventos_app/app/modules/users/user_controller.dart';
import 'package:cfia_eventos_app/app/modules/users/user_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class ButtonNavigation extends StatelessWidget {
  final PageController _pageController = PageController();
  ButtonNavigation({Key key}) : super(key: key);

  final UserController controller = Get.put(UserController());
  final QrController  qrController = Get.put(QrController());
 final UserProfileController userProfileController = Get.put(UserProfileController());
  @override
  Widget build(BuildContext context) {
    final ListaActividad actividadArgumentos =
        ModalRoute.of(context).settings.arguments;
        
    return GetBuilder<ButtonNavigationController>(builder: (_) {
      return Scaffold(
          body: SizedBox.expand(
            child: PageView(
              onPageChanged: (value) => _.indextap(value),
              controller: _pageController,
              children: <Widget>[
                QrPage(
                  nombreActividad: actividadArgumentos.tituloEspanol,idActividad: actividadArgumentos.iDActividad,
                ),
                UsersPage(idActividades: actividadArgumentos.iDActividad,),
                UserProfilePage(
                  nombreActividad: actividadArgumentos.tituloEspanol,horaActividad: actividadArgumentos.fecha,idActividad: actividadArgumentos.iDActividad,
                )
              ],
            ),
          ),
          bottomNavigationBar: BottomNavyBar(
            selectedIndex: _.index,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            showElevation: true,
            itemCornerRadius: 8,
            curve: Curves.easeInBack,
            onItemSelected: (value) {
              _.indextap(value);
              _pageController.jumpToPage(_.index);
              _pageController.animateToPage(_.index,
                  duration: const Duration(milliseconds: 0),
                  curve: Curves.fastOutSlowIn);
            },
            items: [
              BottomNavyBarItem(
                icon: Icon(FontAwesomeIcons.qrcode),
                title: Text('Lector  QR'),
                activeColor: Color(0xFFF8E060D),
                inactiveColor: Colors.grey,
                textAlign: TextAlign.center,
              ),
              BottomNavyBarItem(
                icon: Icon(FontAwesomeIcons.search),
                title: Text('Búsqueda'),
                activeColor: Color(0xFFF8E060D),
                inactiveColor: Colors.grey,
                textAlign: TextAlign.center,
              ),
              BottomNavyBarItem(
                icon: Icon(FontAwesomeIcons.user),
                title: Text('Usuario'),
                activeColor: Color(0xFFF8E060D),
                inactiveColor: Colors.grey,
                textAlign: TextAlign.center,
              )
            ],
          ));
    });
  }
}
