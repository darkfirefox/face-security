import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:face_security/repositories/push_repository.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:meta/meta.dart';
import './bloc.dart';

class LoggedInBloc extends Bloc<LoggedInEvent, LoggedInState> {
  LoggedInBloc({@required this.pushRepository})
      : assert(pushRepository != null);
  final PushRepository pushRepository;
  @override
  LoggedInState get initialState => InitialLoggedInState();

  @override
  Stream<LoggedInState> mapEventToState(
    LoggedInEvent event,
  ) async* {
    if (event is BlocLoggedInLoaded) {
      _firebaseMessaging.getToken().then((String token) {
        print('push token: $token');
        pushRepository.pushToke(token: token);
      });
    }
  }

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
}
