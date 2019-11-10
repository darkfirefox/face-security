import 'package:meta/meta.dart';

@immutable
abstract class RouterEvent {}

class CloseEvent extends RouterEvent {}