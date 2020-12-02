
import 'package:cfia_eventos_app/app/global_widgets/custom_text_global_widget.dart';
import 'package:flutter/material.dart';
class UserLocalNameWidget extends StatelessWidget {
  final String username;

  const UserLocalNameWidget({Key key, this.username}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (username != null) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: Column(
        children: [
          CustomGlobalTextWidget(
            text: (username != null) ? username : '',
            color: Colors.black54,
            size: 15.0,
            fontFamily: 'Sen-ExtraBold',
          ),
        ],
      ),
    );
  } else {
    return Container();
  }
  }
}