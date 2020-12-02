
import 'package:cfia_eventos_app/app/modules/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/modules/login/login_page.dart';
import 'app/routes/app_pages.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  
  
  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Sistema de eventos',
        home: LoginPage(),
         getPages: AppPages.pages,
        );
  }
}
