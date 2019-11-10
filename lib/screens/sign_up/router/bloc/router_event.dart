import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class RouterEvent extends Equatable {}

class CloseEvent extends RouterEvent {
  @override
  List<Object> get props => [];
}