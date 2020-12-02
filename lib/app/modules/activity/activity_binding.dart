import 'package:cfia_eventos_app/app/modules/events/events_controller.dart';
import 'package:get/get.dart';

import 'activity_controller.dart';

class ActivityBinding extends Bindings{
  @override
  void dependencies() {
   Get.lazyPut<ActivityController>(() => ActivityController());
   Get.lazyPut<EventsController>(() => EventsController());
  }


}