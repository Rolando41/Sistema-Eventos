import 'package:cfia_eventos_app/app/modules/users/user_controller.dart';
import 'package:get/get.dart';

class UsersBinding extends Bindings{
  @override
  void dependencies() {
   Get.lazyPut(() => UserController());
  }
}