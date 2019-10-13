import 'package:meta/meta.dart';

@immutable
abstract class LoggedInEvent {}

class BlocLoggedInLoaded extends LoggedInEvent {}