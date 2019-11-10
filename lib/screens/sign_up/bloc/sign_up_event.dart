import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class SignUpEvent extends Equatable {
  const SignUpEvent();
}

class ChangedUsernameEvent extends SignUpEvent {
  ChangedUsernameEvent({@required this.username});
  @override
  List<Object> get props => [username];

  final String username;
}

class ChangePasswordEvent extends SignUpEvent {
  ChangePasswordEvent({@required this.password});
  @override
  List<Object> get props => [password];

  final String password;
}

class ChangePhotoEvent extends SignUpEvent {
  ChangePhotoEvent({@required this.image});
  @override
  List<Object> get props => [image];
  final File image;
}

class SingUpTapped extends SignUpEvent {
  @override
  List<Object> get props => [];
}
