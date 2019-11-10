import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:face_security/models/notification.dart';
import 'package:face_security/models/session.dart';
import 'package:face_security/repositories/session_repository.dart';
import 'package:face_security/utils/fcm_converter.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:meta/meta.dart';
import './bloc.dart';

class RootBloc extends Bloc<RootEvent, RootState> {
  RootBloc({@required this.sessionRepository})
      : assert(sessionRepository != null);
  final SessionRepository sessionRepository;

  set delegate(FCMDelegate fcmDelegate) => _delegate = fcmDelegate;

  @override
  RootState get initialState => UnownedAuthState();

  @override
  Stream<RootState> mapEventToState(
    RootEvent event,
  ) async* {
    if (event is AppStartedEvent) {
      _setFCM();
      _streamSubscription ??= sessionRepository.sessionStream
          .listen((Session session) => _stateBySession(session));
    }
    if (event is AppAuthEvent) {
      yield AuthState();
    }
    if (event is AppNotAuthEvent) {
      yield NotAuthState();
    }
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }

  void _stateBySession(Session session) {
    if (session?.sessionToken?.isNotEmpty ?? false) {
      add(AppAuthEvent());
    } else {
      add(AppNotAuthEvent());
    }
  }

  void _setFCM() {
    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print('onMessage: $message');
        _onMessage(message);
      },
      onLaunch: (Map<String, dynamic> message) async {
        print('onLaunch: $message');
        _onMessage(message);
      },
      onResume: (Map<String, dynamic> message) async {
        print('onResume: $message');
        _onMessage(message);
      },
    );
    _firebaseMessaging.requestNotificationPermissions(
        const IosNotificationSettings(sound: true, badge: true, alert: true));
    _firebaseMessaging.onIosSettingsRegistered
        .listen((IosNotificationSettings settings) {
      print('Settings registered: $settings');
    });
  }

  Future<void> _onMessage(Map<String, dynamic> message) async {
    if (state is AuthState) {
      _delegate?.showAlert(notification: FCMConverter.parseMessage(message));
    }
  }

  StreamSubscription<Session> _streamSubscription;
  FCMDelegate _delegate;
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
}

mixin FCMDelegate {
  void showAlert({@required Notification notification});
}
