import 'package:face_security/screens/history/bloc/bloc.dart';
import 'package:face_security/screens/history/widgets/history_item.dart';
import 'package:face_security/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:face_security/models/notification.dart' as n;

class HistoryScreen extends StatefulWidget {
  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    final HistoryBloc bloc = BlocProvider.of(context);
    return Scaffold(
      appBar: AppBar(
          title: Text(
        FSStrings.history(context),
        style: FSTextStyles.appBar,
      )),
      body: BlocBuilder(
        bloc: bloc,
        builder: (_, HistoryState state) {
          if (state is ShowHistory) {
            return ListView.builder(
              itemCount: state.notifications.length,
              itemBuilder: (_, int index) {
                final n.Notification notification = state.notifications[index];
                return HistoryItem(
                  notification: notification,
                  onDismiss: () {
                    bloc.dispatch(DeleteNotificationEvent(id: notification.id));
                  },
                );
              },
            );
          }
          return Container();
        },
      ),
    );
  }
}
