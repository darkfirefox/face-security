import 'package:face_security/locator.dart';
import 'package:face_security/repositories/history_repository.dart';
import 'package:face_security/repositories/push_repository.dart';
import 'package:face_security/repositories/session_repository.dart';
import 'package:face_security/screens/logged_in/bloc/bloc.dart';
import 'package:face_security/screens/main/bloc/main_bloc.dart';
import 'package:face_security/screens/main/main_screen.dart';
import 'package:face_security/screens/main/router/bloc/bloc.dart';
import 'package:face_security/screens/menu/bloc/menu_bloc.dart';
import 'package:face_security/screens/root/bloc/root_bloc.dart';
import 'package:face_security/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class MainBuilder {
  MainBuilder({@required this.onDelegate}) : assert(onDelegate != null);
  final Function(FCMDelegate) onDelegate;
  Widget build(BuildContext buildContext) {
    final RouterBloc routerBloc = RouterBloc();
    final MainBloc mainBloc = MainBloc(
        historyRepository: services<HistoryRepository>(),
        routerBloc: routerBloc);
    onDelegate(mainBloc);
    return MultiBlocProvider(
      providers: [
        BlocProvider<RouterBloc>(
          builder: (_) => routerBloc,
        ),
        BlocProvider<MainBloc>(
          builder: (_) => mainBloc,
        ),
        BlocProvider<LoggedInBloc>(
          builder: (_) =>
              LoggedInBloc(pushRepository: services<PushRepository>())
                ..dispatch(BlocLoggedInLoaded()),
        ),
        BlocProvider<MenuBloc>(
          builder: (_) =>
              MenuBloc(sessionRepository: services<SessionRepository>()),
        ),
      ],
      child: BlocListener(
        bloc: routerBloc,
        listener: (BuildContext context, RouterState state) {
          if (state is ShowNotification) {
            Alert(
                context: context,
                style: AlertStyle(
                  animationType: AnimationType.shrink,
                  isCloseButton: false,
                  isOverlayTapDismiss: false,
                  alertBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0.0),
                    side: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  backgroundColor: FSColors.alertBackground,
                  titleStyle: FSTextStyles.alertTitle,
                  descStyle: FSTextStyles.alertBody,
                ),
                title: '${state.notification.title ?? ''}',
                desc: '${state.notification.body ?? ''}',
                buttons: [
                  DialogButton(
                    color: FSColors.primaryColor,
                    onPressed: () => Navigator.pop(context),
                    child: Text('OK'),
                  )
                ]).show();
          }
        },
        child: MainScreen(),
      ),
    );
  }
}
