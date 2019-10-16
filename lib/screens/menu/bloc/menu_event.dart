import 'package:equatable/equatable.dart';

abstract class MenuEvent extends Equatable {
  const MenuEvent();
}

class LogoutTappedEvent extends MenuEvent {
  @override
  List<Object> get props => [];
}