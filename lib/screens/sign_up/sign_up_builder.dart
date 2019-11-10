import 'package:face_security/commons/blocs/loading/bloc/loading_bloc.dart';
import 'package:face_security/locator.dart';
import 'package:face_security/repositories/sign_up_repository.dart';
import 'package:face_security/screens/sign_up/bloc/sign_up_bloc.dart';
import 'package:face_security/screens/sign_up/router/bloc/bloc.dart';
import 'package:face_security/screens/sign_up/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpBuilder {
  MaterialPageRoute build(BuildContext buildContext) {
    return MaterialPageRoute(builder: (_) {
      final LoadingBloc loadingBloc = LoadingBloc();
      final RouterBloc routerBloc = RouterBloc();
      final SignUpBloc signUpBloc = SignUpBloc(
          loadingBloc: loadingBloc,
          routerBloc: routerBloc,
          signUpRepository: services<SignUpRepository>());
      return MultiBlocProvider(
        providers: [
          BlocProvider<LoadingBloc>(
            builder: (_) => loadingBloc,
          ),
          BlocProvider<RouterBloc>(
            builder: (_) => routerBloc,
          ),
          BlocProvider<SignUpBloc>(
            builder: (_) => signUpBloc,
          ),
        ],
        child: BlocListener<RouterBloc, RouterState>(
          listener: (BuildContext context, RouterState state) {
            if (state is Close) {
              Navigator.pop(context);
            }
          },
          child: SignUpScreen(),
        ),
      );
    });
  }
}
