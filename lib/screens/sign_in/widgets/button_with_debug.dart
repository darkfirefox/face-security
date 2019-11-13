import 'package:dio/dio.dart';
import 'package:face_security/locator.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class ButtonWithDebug extends StatefulWidget {
  ButtonWithDebug({@required this.onTap, @required this.title})
      : assert(onTap != null),
        assert(title != null);
  final Function() onTap;
  final String title;
  @override
  _ButtonWithDebugState createState() => _ButtonWithDebugState();
}

class _ButtonWithDebugState extends State<ButtonWithDebug> {
  TextEditingController _controller;
  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: services<Dio>().options.baseUrl);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        Alert(
          context: context,
          title: "Change ip address, Maxik",
          style: AlertStyle(
            animationType: AnimationType.shrink,
            isCloseButton: false,
          ),
          content: Column(
            children: <Widget>[
              TextField(
                controller: _controller,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: DialogButton(
                  onPressed: () {
                    services<Dio>().options.baseUrl = _controller.text;
                    Navigator.pop(context);
                  },
                  child: const Text("OK"),
                ),
              ),
            ],
          ),
        ).show();
      },
      child: RaisedButton(
        onPressed: widget.onTap,
        child: Text(widget.title),
      ),
    );
  }
}
