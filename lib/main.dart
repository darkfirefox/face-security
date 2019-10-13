import 'package:bloc/bloc.dart';
import 'package:face_security/FSApp.dart';
import 'package:face_security/bloc_delegate.dart';
import 'package:face_security/locator.dart';
import 'package:flutter/material.dart';

Future<void> main() async{
  await setupLocators();
  BlocSupervisor.delegate = FSBlocDelegate();
  return runApp(FSApp());
}
