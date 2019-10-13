import 'package:face_security/models/notification.dart';
import 'package:face_security/storages/db/database.dart';
import 'package:meta/meta.dart';

class HistoryRepository {
  HistoryRepository({@required this.dao});
  final NotificationDao dao;
  Future<void> deleteNotification({int id}) async => dao.deleteNotification(id);
  Future<void> insertNotification({Notification notification}) async =>
      dao.insert(notification);
  Future<void> setViewable({int id}) async => null;
  Stream<List<Notification>> get streamNotifications =>
      dao.notificactionsStream;
}
