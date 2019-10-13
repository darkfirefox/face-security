import 'package:face_security/locator.dart';
import 'package:face_security/repositories/history_repository.dart';
import 'package:face_security/screens/history/bloc/history_bloc.dart';
import 'package:face_security/screens/history/bloc/history_event.dart';
import 'package:face_security/screens/history/history_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoryBuilder {
  MaterialPageRoute<HistoryScreen> build(BuildContext buildContext) {
    return MaterialPageRoute(
      builder: (_) => BlocProvider<HistoryBloc>(
        builder: (_) =>
            HistoryBloc(historyRepository: services<HistoryRepository>())
              ..dispatch(BlocHistoryLoaded()),
        child: HistoryScreen(),
      ),
    );
  }
}
