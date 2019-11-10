import 'package:face_security/models/session.dart';
import 'package:face_security/network/clients/sign_in_client.dart';
import 'package:face_security/storages/db/database.dart';
import 'package:meta/meta.dart';

class SessionRepository {
  SessionRepository({@required this.client, @required this.dao})
      : assert(client != null),
        assert(dao != null);
  final SignInClient client;
  final SessionDao dao;

  Future<void> login({String username, String password}) async {
    final Session session = Session(isGuard: false, sessionToken: 'token');
    return client.login(<String, dynamic>{
      'username': username,
      'password': password
    }).then((_) async => dao.replaceSession(session), onError: (_) async =>
      dao.replaceSession(session))
      .then((_) => session);
    /*final Session session = Session(isGuard: false, sessionToken: 'token');
    return Future.delayed(const Duration(seconds: 1))
        .then((_) async => dao.replaceSession(session))
        .then((_) => session);*/
  }

  Future<Session> get session => dao.session;

  Future<void> logout() => dao.deleteSession();

  Stream<Session> get sessionStream => dao.sessionStream;
}
