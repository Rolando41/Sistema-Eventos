import 'package:flutter/material.dart';

import 'custom_text_global_widget.dart';

class AppbarGlobalWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const AppbarGlobalWidget(
      {Key key,
      this.backgroundColor,
      this.elevation,
      this.appBar,
      this.url,
      this.title,
      this.size})
      : super(key: key);
  final Color backgroundColor;
  final double elevation;
  final AppBar appBar;
  final String url;
  final String title;
  final double size;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      elevation: elevation,
      actions: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 12.0, right: 5),
              child: Image(height: 30, image: AssetImage(url)),
            ),
          ],
        )
      ],
      title: (title != null && title != '')
          ? CustomGlobalTextWidget(
              text: title,
              color: Colors.white,
              fontFamily: 'Sen-ExtraBold',
              size: size,
            )
          : CustomGlobalTextWidget(
              text: '',
              color: Colors.white,
              fontFamily: 'Sen-ExtraBold',
            ),
            
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(appBar.preferredSize.height);
}
