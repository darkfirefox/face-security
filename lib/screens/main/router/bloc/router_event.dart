import 'package:equatable/equatable.dart';
import 'package:face_security/models/notification.dart';
import 'package:meta/meta.dart';

abstract class RouterEvent extends Equatable {
  const RouterEvent();
}

class ShowNotificationEvent extends RouterEvent {
  ShowNotificationEvent({@required this.notification})
      : assert(notification != null);
  @override
  List<Object> get props => [notification];
  final Notification notification;
}
