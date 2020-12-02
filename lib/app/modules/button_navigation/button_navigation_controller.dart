import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ButtonNavigationController extends GetxController {
  int _index = 0;
  int get index => _index;

  PageController _pageController;
  get pageController => _pageController;

  @override
  void onReady() {
    super.onReady();
  }

  void indextap(int tap) {
    this._index = tap;
    update();
  }
}
