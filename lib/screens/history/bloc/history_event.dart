import 'package:equatable/equatable.dart';
import 'package:face_security/models/notification.dart';
import 'package:meta/meta.dart';

abstract class HistoryEvent extends Equatable {
  const HistoryEvent();
}

class BlocHistoryLoaded extends HistoryEvent {
  @override
  List<Object> get props => [];
}

class ShowHistoryEvent extends HistoryEvent {
  ShowHistoryEvent({@required this.notifications})
      : assert(notifications != null);
  @override
  List<Object> get props => [notifications];
  final List<Notification> notifications;
}

class DeleteNotificationEvent extends HistoryEvent {
  DeleteNotificationEvent({@required this.id})
      : assert(id != null);
  @override
  List<Object> get props => [id];
  final int id;
}