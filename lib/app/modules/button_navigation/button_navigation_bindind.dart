import 'package:cfia_eventos_app/app/modules/button_navigation/button_navigation_controller.dart';
import 'package:get/get.dart';

class ButtonNavigationBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ButtonNavigationController>(() =>ButtonNavigationController());
  }

}