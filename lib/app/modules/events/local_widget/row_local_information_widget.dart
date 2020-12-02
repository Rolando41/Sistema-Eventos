
import 'package:cfia_eventos_app/app/global_widgets/custom_text_global_widget.dart';
import 'package:flutter/material.dart';

class RowLocalInformationEventWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final Function callbackAction;
  const RowLocalInformationEventWidget({
    Key key, this.title, this.subtitle, this.callbackAction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomGlobalTextWidget(
            text: title,
            fontFamily: 'Sen-ExtraBold',
            size: 15.0,
          ),
          FlatButton(
              onPressed: callbackAction,
              child: CustomGlobalTextWidget(
                text: subtitle,
                fontFamily: 'Sen-Bold',
                color: Color(0xFFF8E060D),
              ))
        ],
      ),
    );
  }
}