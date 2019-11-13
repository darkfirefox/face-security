import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';

class FSStrings {
  FSStrings._();

  static String translate(BuildContext context, String key) =>
      FlutterI18n.translate(context, key);

  static String username(BuildContext context) => translate(context, 'username');
  static String password(BuildContext context) => translate(context, 'password');
  static String login(BuildContext context) => translate(context, 'login');
  static String emptyUsername(BuildContext context) => translate(context, 'emptyUsername');
  static String emptyPassword(BuildContext context) => translate(context, 'emptyPassword');
  static String signIn(BuildContext context) => translate(context, 'signIn');
  static String signUp(BuildContext context) => translate(context, 'signUp');
  static String history(BuildContext context) => translate(context, 'history');
  static String menu(BuildContext context) => translate(context, 'menu');
  static String profile(BuildContext context) => translate(context, 'profile');
  static String logout(BuildContext context) => translate(context, 'logout');
  static String about(BuildContext context) => translate(context, 'about');
  static String developers(BuildContext context) => translate(context, 'developers');
  static String noAccount(BuildContext context) => translate(context, 'noAccount');
  static String next(BuildContext context) => translate(context, 'next');
  static String chooseSource(BuildContext context) => translate(context, 'chooseSource');
  static String camera(BuildContext context) => translate(context, 'camera');
  static String gallery(BuildContext context) => translate(context, 'gallery');
  static String cancel(BuildContext context) => translate(context, 'cancel');
}