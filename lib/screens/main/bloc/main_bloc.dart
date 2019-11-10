import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:face_security/models/notification.dart';
import 'package:face_security/repositories/history_repository.dart';
import 'package:face_security/screens/main/router/bloc/bloc.dart';
import 'package:face_security/screens/root/bloc/root_bloc.dart';
import 'package:meta/meta.dart';
import './bloc.dart';

class MainBloc extends Bloc<MainEvent, MainState> with FCMDelegate {
  MainBloc({@required this.historyRepository, @required this.routerBloc})
      : assert(historyRepository != null),
        assert(routerBloc != null);
  final RouterBloc routerBloc;
  final HistoryRepository historyRepository;
  @override
  MainState get initialState => InitialMainState();

  @override
  Stream<MainState> mapEventToState(
    MainEvent event,
  ) async* {}

  //FCMDelegate
  @override
  Future<void> showAlert({Notification notification}) async {
    historyRepository.insertNotification(notification: notification);
    routerBloc.add(ShowNotificationEvent(notification: notification));
  }
}
