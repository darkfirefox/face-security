import 'package:face_security/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:face_security/models/notification.dart' as n;

class HistoryItem extends StatelessWidget {
  HistoryItem({@required this.notification, @required this.onDismiss})
      : assert(notification != null),
        assert(onDismiss != null);
  final n.Notification notification;
  final Function() onDismiss;
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key('${notification.id}'),
      background: Container(
        color: FSColors.deleteColor,
      ),
      onDismissed: (_) {
        onDismiss();
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 1,
              color: FSColors.divider,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    FSStrings.translate(context, notification.title),
                    style: FSTextStyles.historyTitle,
                  ),
                  Text(
                    FSStrings.translate(context, notification.body),
                    style: FSTextStyles.historyBody,
                  ),
                  Text(
                    '${notification.dateTime ?? ''}',
                    style: FSTextStyles.historyDateTime,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
