
import 'package:cfia_eventos_app/app/global_widgets/custom_text_global_widget.dart';
import 'package:flutter/material.dart';

class InformationLocalBoxWidget extends StatelessWidget {
  final String title;
  const InformationLocalBoxWidget({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
    width: 150,
    height: 25,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50.0),
        color: Colors.white),
    child: Center(
      child: CustomGlobalTextWidget(
        text: title,
        color: Colors.black54,
        size: 15.0,
        fontFamily: 'Sen-ExtraBold',
      ),
    ),
  );
  }
}