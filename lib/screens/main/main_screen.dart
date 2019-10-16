import 'package:face_security/screens/history/history_builder.dart';
import 'package:face_security/screens/menu/menu_screen.dart';
import 'package:face_security/utils/image_names.dart';
import 'package:face_security/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          child: SvgPicture.asset(
            FSImageNames.background,
            fit: BoxFit.cover,
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text(''),
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.notifications,
                  color: FSColors.appBar,
                ),
                onPressed: () {
                  Navigator.push(context, HistoryBuilder().build(context));
                },
              ),
            ],
          ),
          drawer: MenuWidget(),
          body: Container(),
        )
      ],
    );
  }
}
