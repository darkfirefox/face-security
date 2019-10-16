import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:face_security/repositories/session_repository.dart';
import 'package:meta/meta.dart';
import './bloc.dart';

class MenuBloc extends Bloc<MenuEvent, MenuState> {
  MenuBloc({@required this.sessionRepository}) : assert(sessionRepository != null);
  final SessionRepository sessionRepository;
  @override
  MenuState get initialState => InitialMenuState();

  @override
  Stream<MenuState> mapEventToState(
    MenuEvent event,
  ) async* {
    if (event is LogoutTappedEvent) {
      try {
        await sessionRepository.logout();
      } on Error catch(error) {
        print(error);
      }
    }
  }
}
