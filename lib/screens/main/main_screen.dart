import 'package:face_security/screens/history/history_builder.dart';
import 'package:face_security/utils/utils.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.add_alert,
              color: FSColors.appBar,
            ),
            onPressed: () {
              Navigator.push(context, HistoryBuilder().build(context));
            },
          ),
        ],
      ),
      body: Container(),
    );
  }
}
