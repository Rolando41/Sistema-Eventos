import 'package:cfia_eventos_app/app/modules/events/events_controller.dart';
import 'package:get/get.dart';

class EventsAllBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<EventsController>(() => EventsController());
  }

}