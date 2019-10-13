import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class SignInEvent extends Equatable {
  const SignInEvent();
}

class LoginTappedEvent extends SignInEvent {
  LoginTappedEvent({@required this.password, @required this.username});
  @override
  List<Object> get props => [username, password];

  final String username;
  final String password;
}
