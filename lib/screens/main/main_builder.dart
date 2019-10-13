import 'package:face_security/locator.dart';
import 'package:face_security/repositories/history_repository.dart';
import 'package:face_security/repositories/push_repository.dart';
import 'package:face_security/screens/logged_in/bloc/bloc.dart';
import 'package:face_security/screens/main/bloc/main_bloc.dart';
import 'package:face_security/screens/main/main_screen.dart';
import 'package:face_security/screens/main/router/bloc/bloc.dart';
import 'package:face_security/screens/root/bloc/root_bloc.dart';
import 'package:face_security/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

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
        )
      ],
      child: BlocListener(
        bloc: routerBloc,
        listener: (BuildContext context, RouterState state) {
          if (state is ShowNotification) {
            showDialog(
              context: context,
              builder: (BuildContext context) => Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Container(
                    color: FSColors.alertBackground,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          '${state.notification.title ?? ''}',
                          style: FSTextStyles.alertTitle,
                        ),
                        Text(
                          '${state.notification.body ?? ''}',
                          style: FSTextStyles.alertBody,
                        ),
                        Text(
                          '${state.notification.dateTime ?? ''}',
                          style: FSTextStyles.alertDateTime,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
        },
        child: MainScreen(),
      ),
    );
  }
}
