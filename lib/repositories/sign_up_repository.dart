import 'package:face_security/network/clients/sign_up_client.dart';
import 'package:meta/meta.dart';

class SignUpRepository {
  SignUpRepository({@required this.client}) : assert(client != null);
  final SignUpClient client;
}