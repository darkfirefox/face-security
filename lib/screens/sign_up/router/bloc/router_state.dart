import 'package:meta/meta.dart';

@immutable
abstract class RouterState {}
  
class InitialRouterState extends RouterState {}

class Close extends RouterState {}