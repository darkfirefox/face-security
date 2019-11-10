import 'package:face_security/config.dart';
import 'package:face_security/locator.dart';
import 'package:face_security/repositories/session_repository.dart';
import 'package:face_security/screens/root/bloc/bloc.dart';
import 'package:face_security/screens/root/root_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_i18n/flutter_i18n_delegate.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class FSApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<RootBloc>(
      builder: (_) => RootBloc(sessionRepository: services<SessionRepository>())
        ..add(AppStartedEvent()),
      child: MaterialApp(
        title: FSConfig.appTitle,
        theme: FSConfig.appTheme,
        localizationsDelegates: <LocalizationsDelegate<dynamic>>[
          FlutterI18nDelegate(
              useCountryCode: false, fallbackFile: 'en', path: 'assets/langs'),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        home: RootScreen(),
      ),
    );
  }
}
