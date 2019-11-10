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
    return Scaffold(
      appBar: AppBar(
          title: Text(
        FSStrings.history(context),
        style: FSTextStyles.appBar,
      )),
      body: BlocBuilder<HistoryBloc, HistoryState>(
        builder: (_, HistoryState state) {
          if (state is ShowHistory) {
            return ListView.builder(
              itemCount: state.notifications.length,
              itemBuilder: (_, int index) {
                final n.Notification notification = state.notifications[index];
                return HistoryItem(
                  notification: notification,
                  onDismiss: () {
                    BlocProvider.of<HistoryBloc>(context)
                        .add(DeleteNotificationEvent(id: notification.id));
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
