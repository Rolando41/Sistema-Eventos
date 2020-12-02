
import 'package:cfia_eventos_app/app/global_widgets/custom_text_global_widget.dart';
import 'package:flutter/material.dart';

class InformationLocalWidget extends StatelessWidget {
  final double size;
  const InformationLocalWidget({Key key, this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
   width: size/1,
    height: 50,
   // color: Colors.red,
    child: Card(
      elevation: 0.0,
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.0),
          color: Colors.white,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(50.0),
                  child: Icon(
                    Icons.supervised_user_circle,
                    size: 25,
                    color: Colors.green
                  ),
                ),
                CustomGlobalTextWidget(
                  text: 'Ingresado',
                  color: Colors.black54,
                  size: 13.0,
                  fontFamily: 'Sen-ExtraBold',
                )
              ],
            ),
            SizedBox(
              width: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50.0),
                    child: Icon(
                      Icons.supervised_user_circle,
                      size: 25,
                      color: Color(0xFFF8E060D),
                    ),
                  ),
                  CustomGlobalTextWidget(
                    text: 'No ingresado',
                    color: Colors.black54,
                    size: 13.0,
                    fontFamily: 'Sen-ExtraBold',
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
  }
}