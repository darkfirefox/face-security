import 'package:equatable/equatable.dart';
import 'package:face_security/models/notification.dart';
import 'package:meta/meta.dart';

abstract class HistoryState extends Equatable {
  const HistoryState();
}

class InitialHistoryState extends HistoryState {
  @override
  List<Object> get props => [];
}

class ShowHistory extends HistoryState {
  ShowHistory({@required this.notifications}) : assert(notifications != null);
  @override
  List<Object> get props => [notifications];
  final List<Notification> notifications;
}
