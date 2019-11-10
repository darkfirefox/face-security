import 'dart:async';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:face_security/commons/blocs/loading/bloc/bloc.dart';
import 'package:face_security/repositories/sign_up_repository.dart';
import 'package:face_security/screens/sign_up/router/bloc/bloc.dart';
import 'package:meta/meta.dart';
import './bloc.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc(
      {@required this.loadingBloc,
      @required this.routerBloc,
      @required this.signUpRepository})
      : assert(loadingBloc != null),
        assert(routerBloc != null),
        assert(signUpRepository != null);
  final LoadingBloc loadingBloc;
  final RouterBloc routerBloc;
  final SignUpRepository signUpRepository;
  @override
  SignUpState get initialState => InitialSignUpState();

  @override
  Stream<SignUpState> mapEventToState(
    SignUpEvent event,
  ) async* {
    if (event is ChangedUsernameEvent) {
      username = event.username;
    }
    if (event is ChangePasswordEvent) {
      password = event.password;
    }
    if (event is ChangePhotoEvent) {
      image = event.image;
    }
    if (event is SingUpTapped) {
      loadingBloc.add(BusyEvent());
      try {
        await signUpRepository.signUp(
            username: username, password: password, image: image);
        loadingBloc.add(IdleEvent());
        routerBloc.add(CloseEvent());
      } on DioError catch (ex) {
        print(ex);
        loadingBloc.add(IdleEvent());
      }
    }
  }

  String username;
  String password;
  File image;
}
