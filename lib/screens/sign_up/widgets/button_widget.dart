import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  ButtonWidget({@required this.onTap, @required this.title})
      : assert(title != null);
  final Function() onTap;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: Row(
        children: <Widget>[
          Expanded(
            child: RaisedButton(
              onPressed: onTap,
              child: Text(title),
            ),
          )
        ],
      ),
    );
  }
}
