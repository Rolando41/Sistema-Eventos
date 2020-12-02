
import 'package:cfia_eventos_app/app/global_widgets/custom_text_global_widget.dart';
import 'package:flutter/material.dart';

class UsersEntryLocalWidget extends StatelessWidget {
  final String title;
  final Size size;
  final String url;
  final int count;
  final Color color;
  const UsersEntryLocalWidget(
      {Key key, this.title, this.url, this.count, this.size, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        width: size.width / 2.5,
        height: size.height / 4,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 10.0,
              ),
              CustomGlobalTextWidget(
                text: title,
                color: Colors.black54,
                size: 18.0,
                fontFamily: 'Sen-ExtraBold',
              ),
              SizedBox(
                height: 5.0,
              ),
              Icon(Icons.supervised_user_circle,
              size: 50,
              color: color,),
              //Image(height: 50.0, image: AssetImage(url)),
              SizedBox(
                height: 10.0,
              ),
              CustomGlobalTextWidget(
                text: count.toString(),
                color: Colors.black45,
                size: 25.0,
                fontFamily: 'Sen-ExtraBold',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
