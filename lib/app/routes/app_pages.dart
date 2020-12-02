
import 'package:cfia_eventos_app/app/modules/activity/activity_binding.dart';
import 'package:cfia_eventos_app/app/modules/activity/activity_page.dart';
import 'package:cfia_eventos_app/app/modules/button_navigation/button_navigation_bindind.dart';
import 'package:cfia_eventos_app/app/modules/button_navigation/button_navigation_page.dart';
import 'package:cfia_eventos_app/app/modules/events/events_binding.dart';
import 'package:cfia_eventos_app/app/modules/events/events_page.dart';
import 'package:cfia_eventos_app/app/modules/events_all/events_all_page.dart';
import 'package:cfia_eventos_app/app/modules/qr/qr_binding.dart';
import 'package:cfia_eventos_app/app/modules/qr/qr_page.dart';
import 'package:cfia_eventos_app/app/modules/search/search_binding.dart';
import 'package:cfia_eventos_app/app/modules/search/search_page.dart';
import 'package:cfia_eventos_app/app/modules/user_profile/user_profile_page.dart';
import 'package:cfia_eventos_app/app/modules/users/user_bindings.dart';
import 'package:cfia_eventos_app/app/modules/users/user_page.dart';
import 'package:flutter/animation.dart';
import 'package:get/get.dart';

import 'app_routes.dart';

class AppPages {
  static final pages = [
    
    GetPage(name: AppRoutes.ActivitiesPage, page: () => ActivitiesPage(),bindings:[EventsBinding(), ActivityBinding()] ),
    GetPage(name: AppRoutes.ButtonNavigation, page: () => ButtonNavigation(),binding: ButtonNavigationBinding()),
    GetPage(name: AppRoutes.EventsAllPage, page: () => EventsAllPage(),binding: EventsBinding()),
    GetPage(name: AppRoutes.EventsPage, page: () => EventsPage(),binding: EventsBinding()),
   /// GetPage(name: AppRoutes.LoginPage, page: () => LoginPage(),binding: LoginBinding()),
    GetPage(name: AppRoutes.SearchPage, page: () => SearchPage(),binding: SearchBingin()),
    GetPage(name: AppRoutes.Qr, page: () => QrPage(),binding: QrBinding(),curve: Curves.bounceIn),
    GetPage(name: AppRoutes.UsersPage, page: () => UsersPage(),binding: UsersBinding()),
    GetPage(name: AppRoutes.UserProfilePage, page: () => UserProfilePage()),


  ];
}
