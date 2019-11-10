import 'package:face_security/screens/main/main_builder.dart';
import 'package:face_security/screens/root/bloc/bloc.dart';
import 'package:face_security/screens/sign_in/sign_in_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RootScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RootBloc, RootState>(
      builder: (_, RootState state) {
        if (state is AuthState) {
          return MainBuilder(
                  onDelegate: (FCMDelegate delegate) =>
                      BlocProvider.of<RootBloc>(context).delegate = delegate)
              .build(context);
        }
        if (state is NotAuthState) {
          BlocProvider.of<RootBloc>(context).delegate = null;
          return SignInBuilder().build(context);
        }
        BlocProvider.of<RootBloc>(context).delegate = null;
        return Container();
      },
    );
  }
}
