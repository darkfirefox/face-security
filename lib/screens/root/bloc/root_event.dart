import 'package:equatable/equatable.dart';

abstract class RootEvent extends Equatable {
  const RootEvent();
}

class AppStartedEvent extends RootEvent {
  @override
  List<Object> get props => [];
}

class AppNotAuthEvent extends RootEvent {
  @override
  List<Object> get props => [];
}

class AppAuthEvent extends RootEvent {
  @override
  List<Object> get props => [];
}