import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:face_security/models/notification.dart';
import 'package:face_security/repositories/history_repository.dart';
import 'package:meta/meta.dart';
import './bloc.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  HistoryBloc({@required this.historyRepository})
      : assert(historyRepository != null);
  final HistoryRepository historyRepository;
  @override
  HistoryState get initialState => InitialHistoryState();

  @override
  Stream<HistoryState> mapEventToState(
    HistoryEvent event,
  ) async* {
    if (event is BlocHistoryLoaded) {
      _streamSubscription ??= historyRepository.streamNotifications.listen(
          (List<Notification> notifications) =>
              dispatch(ShowHistoryEvent(notifications: notifications)));
    }
    if (event is ShowHistoryEvent) {
      yield ShowHistory(notifications: event.notifications);
    }
    if (event is DeleteNotificationEvent) {
      historyRepository.deleteNotification(id: event.id);
    }
  }

  @override
  void dispose() {
    _streamSubscription?.cancel();
    super.dispose();
  }

  StreamSubscription _streamSubscription;
}
