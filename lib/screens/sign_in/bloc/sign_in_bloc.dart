import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:face_security/commons/blocs/loading/bloc/bloc.dart';
import 'package:face_security/repositories/session_repository.dart';
import 'package:meta/meta.dart';
import 'package:dio/dio.dart';
import './bloc.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc({@required this.loadingBloc, @required this.sessionRepository})
      : assert(loadingBloc != null);
  final LoadingBloc loadingBloc;
  final SessionRepository sessionRepository;
  @override
  SignInState get initialState => InitialSignInState();

  @override
  Stream<SignInState> mapEventToState(
    SignInEvent event,
  ) async* {
    if (event is LoginTappedEvent) {
      loadingBloc.add(BusyEvent());
      try {
        await sessionRepository.login(
            username: event.username, password: event.password);
      } on DioError catch (error) {
        print(error);
      }
      loadingBloc.add(IdleEvent());
    }
  }
}
