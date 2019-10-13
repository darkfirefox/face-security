import 'package:face_security/utils/utils.dart';
import 'package:flutter/material.dart';

class FSConfig {
  FSConfig._();

  static const String appTitle = 'Face Security';

  static const String baseUrl = '';

  static ThemeData appTheme = ThemeData(
    primaryColor: FSColors.primaryColor,
    primarySwatch: Colors.blue,
    appBarTheme: const AppBarTheme(brightness: Brightness.dark),
    textTheme: const TextTheme(
      button: FSTextStyles.buttons,
    ),
    buttonTheme: ThemeData.light().buttonTheme.copyWith(
          buttonColor: FSColors.primaryColor,
          textTheme: ButtonTextTheme.primary,
        ),
  );
}
