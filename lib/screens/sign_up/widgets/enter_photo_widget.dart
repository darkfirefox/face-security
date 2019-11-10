import 'dart:io';

import 'package:face_security/screens/sign_up/widgets/button_widget.dart';
import 'package:flutter/material.dart';

class EnterPhotoWidget extends StatelessWidget {
  EnterPhotoWidget(
      {@required this.onTap,
      @required this.onSuccess,
      @required this.title,
      this.file})
      : assert(onTap != null),
        assert(onSuccess != null),
        assert(title != null);
  final Function() onTap;
  final Function() onSuccess;
  final String title;
  final File file;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _buildChildren(),
        ),
      ),
    );
  }

  List<Widget> _buildChildren() {
    final List<Widget> children = <Widget>[];
    if (file == null) {
      children.add(
        GestureDetector(
          onTap: onTap,
          child: Icon(
            Icons.add_to_photos,
            size: 40,
          ),
        ),
      );
    } else {
      children.add(
        GestureDetector(
          onTap: onTap,
          child: Image.file(
            file,
            height: 200,
            width: 200,
          ),
        ),
      );
    }
    children.add(
      Padding(
        padding: const EdgeInsets.only(top: 16),
        child: ButtonWidget(
          title: title,
          onTap: file == null ? null : onSuccess,
        ),
      ),
    );
    return children;
  }
}
