import 'package:equatable/equatable.dart';

abstract class LoadingEvent extends Equatable {
  const LoadingEvent();
}

class BusyEvent extends LoadingEvent {
  @override
  List<Object> get props => [];
}

class IdleEvent extends LoadingEvent {
  @override
  List<Object> get props => [];
}