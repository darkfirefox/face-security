import 'package:face_security/screens/main/main_builder.dart';
import 'package:face_security/screens/root/bloc/bloc.dart';
import 'package:face_security/screens/sign_in/sign_in_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RootScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final RootBloc bloc = BlocProvider.of(context);
    return BlocBuilder(
      bloc: bloc,
      builder: (_, RootState state) {
        if (state is AuthState) {
          return MainBuilder(
              onDelegate: (FCMDelegate delegate) =>
                  bloc.delegate = delegate).build(context);
        }
        if (state is NotAuthState) {
          bloc.delegate = null;
          return SignInBuilder().build(context);
        }
        bloc.delegate = null;
        return Container();
      },
    );
  }
}
