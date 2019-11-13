import 'dart:io';

import 'package:face_security/screens/sign_up/widgets/button_widget.dart';
import 'package:face_security/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EnterPhotoWidget extends StatelessWidget {
  EnterPhotoWidget(
      {@required this.onTap,
      @required this.onSuccess,
      @required this.title,
      this.file})
      : assert(onTap != null),
        assert(onSuccess != null),
        assert(title != null);
  final Function(ImageSource source) onTap;
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
          children: _buildChildren(context: context),
        ),
      ),
    );
  }

  List<Widget> _buildChildren({BuildContext context}) {
    final List<Widget> children = <Widget>[];
    if (file == null) {
      children.add(
        GestureDetector(
          onTap: () => _showActionSheet(context: context),
          child: Icon(
            Icons.add_to_photos,
            size: 40,
          ),
        ),
      );
    } else {
      children.add(
        GestureDetector(
          onTap: () => _showActionSheet(context: context),
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

  void _showActionSheet({BuildContext context}) {
    showCupertinoModalPopup<dynamic>(
      context: context,
      builder: (BuildContext context) => CupertinoActionSheet(
        title: Text(FSStrings.chooseSource(context)),
        actions: <Widget>[
          CupertinoActionSheetAction(
            child: Text(FSStrings.camera(context)),
            onPressed: () {
              Navigator.pop(context);
              onTap(ImageSource.camera);
            },
          ),
          CupertinoActionSheetAction(
            child: Text(FSStrings.gallery(context)),
            onPressed: () {
              Navigator.pop(context);
              onTap(ImageSource.gallery);
            },
          ),
        ],
        cancelButton: CupertinoActionSheetAction(
          child: Text(FSStrings.camera(context)),
          isDefaultAction: true,
          onPressed: () => Navigator.pop(context),
        ),
      ),
    );
  }
}
