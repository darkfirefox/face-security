import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class RouterState extends Equatable {}
  
class InitialRouterState extends RouterState {
  @override
  List<Object> get props => [];
}

class Close extends RouterState {
  @override
  List<Object> get props => [];
}