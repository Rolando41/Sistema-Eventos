
import 'package:cfia_eventos_app/app/global_widgets/custom_text_global_widget.dart';
import 'package:flutter/material.dart';

class BoxActivityLocalRowWidget extends StatelessWidget {
  final String title;
  final String nameActivity;
  const BoxActivityLocalRowWidget({Key key, this.title, this.nameActivity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 5.0, left: 5.0),
      child: Column(
        children: [
          Row(
            children: [
              Card(
                elevation: 0.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                child: Container(
                  width: 160,
                  height: 30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.0),
                      color: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          child: CustomGlobalTextWidget(
                            text: title,
                            color: Colors.black54,
                            size: 13.0,
                            fontFamily: 'Sen-ExtraBold',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Flexible(
                child: CustomGlobalTextWidget(
                  text: nameActivity,
                  color: Colors.black54,
                  size: 15.0,
                  fontFamily: 'Sen-Bold',
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
