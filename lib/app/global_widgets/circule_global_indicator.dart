import 'package:flutter/material.dart';

class CircleProgressIndicartorWidget extends StatelessWidget {
  const CircleProgressIndicartorWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      // backgroundColor: Color(0xFF075E54).withOpacity(0.9),
      valueColor: new AlwaysStoppedAnimation<Color>(Color(0xFFF8E060D)),
    );
  }
}
