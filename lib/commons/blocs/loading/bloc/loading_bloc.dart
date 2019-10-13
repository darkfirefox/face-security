import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class LoadingBloc extends Bloc<LoadingEvent, LoadingState> {
  @override
  LoadingState get initialState => IdleState();

  @override
  Stream<LoadingState> mapEventToState(
    LoadingEvent event,
  ) async* {
    if (event is BusyEvent) {
      yield BusyState();
    }
    if (event is IdleEvent) {
      yield IdleState();
    }
  }
}
