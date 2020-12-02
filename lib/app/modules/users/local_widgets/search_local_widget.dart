import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class SearchLocalWidget extends StatelessWidget {
  const SearchLocalWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25.0,right: 5.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Icon(
            FontAwesomeIcons.search,
            color: Color(0xFFFFB819),
          ),
          SizedBox(
            width: 15.0,
          ),
          Container(
            height: 30,
            width: 250,
            child: InkWell(
              //onTap: () => Navigator.pushNamed(context, '/SearchPage'),
              child: TextFormField(
                enabled: false,
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Color(0xFFFFB819))),
                    contentPadding: EdgeInsets.only(top: 10, left: 10),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    hintText: 'Nombre de participante',
                    hintStyle:
                        TextStyle(fontFamily: 'Sen-ExtraBold', fontSize: 13.0),
                    focusColor: Colors.red),
              ),
            ),
          )
        ],
      ),
    );
  }
}