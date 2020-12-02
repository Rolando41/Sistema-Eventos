import 'package:flutter/material.dart';

class PictureLocalWidget extends StatelessWidget {
  final Size size;
  final String url;
   PictureLocalWidget({Key key, this.size, this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
    width: size.width,
    height: size.height / 4.8,
    child: Stack(
      children: [
        Container(
          width: size.width,
          height: size.height / 7.5,
          color: Color(0xFFF8E060D),
        ),
        Positioned(
            top:(size.height <= 640)?size.height/18:size.height/13,
            left: size.width / 2.8,
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.yellow[800],
                borderRadius: BorderRadius.circular(100),
              ),
              child: (url != null && url != '')
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Icon(Icons.person,
                      size: 80,
                      color: Colors.white,
                      ),
                    )
                  : Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 70.0,
                    ),
            ))
      ],
    ),
  );
  }
}