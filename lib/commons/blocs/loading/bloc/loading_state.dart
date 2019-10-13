import 'package:equatable/equatable.dart';

abstract class LoadingState extends Equatable {
  const LoadingState();
}

class IdleState extends LoadingState {
  @override
  List<Object> get props => [];
}

class BusyState extends LoadingState {
  @override
  List<Object> get props => [];
}