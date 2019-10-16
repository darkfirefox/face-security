import 'package:equatable/equatable.dart';

abstract class MenuState extends Equatable {
  const MenuState();
}

class InitialMenuState extends MenuState {
  @override
  List<Object> get props => [];
}
