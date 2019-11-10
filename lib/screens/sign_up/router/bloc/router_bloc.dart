import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class RouterBloc extends Bloc<RouterEvent, RouterState> {
  @override
  RouterState get initialState => InitialRouterState();

  @override
  Stream<RouterState> mapEventToState(
    RouterEvent event,
  ) async* {
    if (event is CloseEvent) {
      yield Close();
    }
  }
}
