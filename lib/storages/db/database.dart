import 'dart:async';
import 'package:face_security/models/notification.dart';
import 'package:face_security/models/session.dart';
import 'package:moor_flutter/moor_flutter.dart';

part 'database.g.dart';

class SessionEntity extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get sessionToken => text()();
  BoolColumn get isGuard => boolean()();
}

class NotificationEntity extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  TextColumn get body => text()();
  DateTimeColumn get dateTimeColumn => dateTime()();
  BoolColumn get viewable => boolean()();
}

@UseDao(tables: [SessionEntity])
class SessionDao extends DatabaseAccessor<Database> with _$SessionDaoMixin {
  SessionDao(Database db) : super(db);

  Stream<Session> get sessionStream {
    return select(sessionEntity).watchSingle().map((SessionEntityData data) => data == null ? null :
        Session(sessionToken: data.sessionToken, isGuard: data.isGuard));
  }

  Future<Session> get session =>
      select(sessionEntity).getSingle().then((SessionEntityData data) =>
          Session(sessionToken: data.sessionToken, isGuard: data.isGuard));

  Future deleteSession() async => delete(sessionEntity).go();

  Future replaceSession(Session session) async {
    return transaction(() async {
      await delete(sessionEntity).go();
      await into(sessionEntity).insert(SessionEntityData(
          id: null,
          isGuard: session.isGuard,
          sessionToken: session.sessionToken));
    });
  }
}

@UseDao(tables: [NotificationEntity])
class NotificationDao extends DatabaseAccessor<Database>
    with _$NotificationDaoMixin {
  NotificationDao(Database db) : super(db);

  Stream<List<Notification>> get notificactionsStream {
    return select(notificationEntity).watch().map(
        (List<NotificationEntityData> listData) => listData.map(
            (NotificationEntityData data) => Notification(
                id: data.id,
                title: data.title,
                body: data.body,
                viewable: data.viewable,
                dateTime: data.dateTimeColumn)).toList());
  }

  Future deleteNotification(int id) async =>
      (delete(notificationEntity)..where((n) => n.id.equals(id))).go();

  Future insert(Notification notification) async =>
      into(notificationEntity).insert(NotificationEntityData(
          id: null,
          body: notification.body,
          title: notification.title,
          viewable: notification.viewable,
          dateTimeColumn: notification.dateTime));
}

@UseMoor(
    tables: [SessionEntity, NotificationEntity],
    daos: [SessionDao, NotificationDao])
class Database extends _$Database {
  Database()
      : super(FlutterQueryExecutor.inDatabaseFolder(
            path: 'db.sqlite', logStatements: true));

  @override
  int get schemaVersion => 1;
}
