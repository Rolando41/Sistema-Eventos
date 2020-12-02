import 'package:flutter/material.dart';

class PicturLocalWidget extends StatelessWidget {
  final Size size;

  const PicturLocalWidget({Key key, this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  ClipRRect(
      child: Image(
          height: size.height / 3.0,
          width: size.width / 1.5,
          image: AssetImage('assets/logoo.png')),
    );
  }
}