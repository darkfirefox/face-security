import 'package:face_security/utils/utils.dart';
import 'package:flutter/material.dart';

class AboutScreen extends StatefulWidget {
  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          FSStrings.about(context),
          style: FSTextStyles.appBar,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            FSStrings.developers(context),
            style: FSTextStyles.aboutTitle,
          ),
          Container(
            height: 16,
          ),
          Text(
            "Volkhin Pavel",
            style: FSTextStyles.aboutRow,
          ),
          Text(
            "Marchukiv Maksim",
            style: FSTextStyles.aboutRow,
          ),
          Text(
            "Myatlev Evgeny",
            style: FSTextStyles.aboutRow,
          ),
          Text(
            "Skladnev Nikolay",
            style: FSTextStyles.aboutRow,
          ),
        ],
      ),
    );
  }
}
