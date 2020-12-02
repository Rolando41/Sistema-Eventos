import 'package:cfia_eventos_app/app/modules/search/search_controller.dart';
import 'package:get/get.dart';

class SearchBingin extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<SearchController>(() => SearchController());
  }

}