import 'package:equatable/equatable.dart';

abstract class RootState extends Equatable {
  const RootState();
}

class UnownedAuthState extends RootState {
  @override
  List<Object> get props => [];
}

class AuthState extends RootState {
  @override
  List<Object> get props => [];
}

class NotAuthState extends RootState {
  @override
  List<Object> get props => [];
}