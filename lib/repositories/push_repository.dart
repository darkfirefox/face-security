import 'package:face_security/network/clients/push_client.dart';
import 'package:meta/meta.dart';

class PushRepository {
  PushRepository({@required this.client}) : assert(client != null);
  final PushClient client;

  Future<void> pushToke({String token}) {
    return client.pushToken(<String, dynamic>{'token': token});
  }
}
