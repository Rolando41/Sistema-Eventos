import 'package:flutter/material.dart';

class CustomGlobalTextWidget extends StatelessWidget {
  final String text;
  final Color color;
  final String fontFamily;
  final double size;
  

  const CustomGlobalTextWidget(
      {Key key, this.text, this.color, this.fontFamily, this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      (text == null) ? '' : text,
      
      style: TextStyle(
          fontSize: (size == null) ? 13 : size,
          color: (color == null) ? Colors.black54 : color,
          fontFamily: fontFamily),
    );
  }
}