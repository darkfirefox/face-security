import 'package:face_security/commons/blocs/loading/bloc/loading_bloc.dart';
import 'package:face_security/locator.dart';
import 'package:face_security/repositories/session_repository.dart';
import 'package:face_security/screens/sign_in/bloc/sign_in_bloc.dart';
import 'package:face_security/screens/sign_in/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInBuilder {
  Widget build(BuildContext buildContext) {
    final LoadingBloc loadingBloc = LoadingBloc();
    final SignInBloc signInBloc = SignInBloc(
        loadingBloc: loadingBloc,
        sessionRepository: services<SessionRepository>());
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoadingBloc>(
          builder: (_) => loadingBloc,
        ),
        BlocProvider<SignInBloc>(
          builder: (_) => signInBloc,
        ),
      ],
      child: SignInScreen(),
    );
  }
}
