import 'package:dio/dio.dart';
import 'package:face_security/config.dart';
import 'package:face_security/network/clients/push_client.dart';
import 'package:face_security/network/clients/sign_in_client.dart';
import 'package:face_security/network/clients/sign_up_client.dart';
import 'package:face_security/repositories/history_repository.dart';
import 'package:face_security/repositories/push_repository.dart';
import 'package:face_security/repositories/session_repository.dart';
import 'package:face_security/storages/db/database.dart';
import 'package:get_it/get_it.dart';

GetIt services = GetIt.instance;

Future<void> setupLocators() async {
  final Database dataBase = Database();
  final Dio dio = Dio();
  dio.options.baseUrl = FSConfig.baseUrl;
  services.registerSingleton(dataBase);
  services.registerSingleton(dio);
  services.registerSingleton(PushClient(dio));
  services.registerSingleton(SignInClient(dio));
  services.registerSingleton(SignUpClient(dio));
  services.registerSingleton(dataBase.sessionDao);
  services.registerSingleton(dataBase.notificationDao);
  services.registerSingleton(SessionRepository(
      client: services<SignInClient>(), dao: dataBase.sessionDao));
  services.registerSingleton(PushRepository(client: services<PushClient>()));
  services.registerSingleton(HistoryRepository(dao: dataBase.notificationDao));
}
