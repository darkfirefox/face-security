import 'package:equatable/equatable.dart';
import 'package:face_security/models/notification.dart';
import 'package:meta/meta.dart';

abstract class RouterState extends Equatable {
  const RouterState();
}

class InitialRouterState extends RouterState {
  @override
  List<Object> get props => [];
}

class ShowNotification extends RouterState {
  ShowNotification({@required this.notification})
      : assert(notification != null);
  @override
  List<Object> get props => [notification];
  final Notification notification;
}
