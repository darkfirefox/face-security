import 'package:face_security/utils/colors.dart';
import 'package:flutter/material.dart';

class FSTextStyles {
  FSTextStyles._();

  static const TextStyle buttons = TextStyle();
  static const TextStyle appBar = TextStyle();
  static const TextStyle usernameTextForm = TextStyle();
  static const TextStyle passwordTextForm = TextStyle();
  static const TextStyle historyTitle = TextStyle();
  static const TextStyle historyBody = TextStyle();
  static const TextStyle historyDateTime = TextStyle();
  static const TextStyle alertTitle = TextStyle(
    fontSize: 14,
    color: FSColors.alertTitle,
  );
  static const TextStyle alertBody = TextStyle(
    fontSize: 14,
    color: FSColors.alertBody,
  );
  static const TextStyle alertDateTime = TextStyle(
    fontSize: 14,
    color: FSColors.alertDateTime,
  );
}
