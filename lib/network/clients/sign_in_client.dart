
import 'package:dio/dio.dart';
import 'package:face_security/models/session.dart';
import 'package:retrofit/retrofit.dart';

part 'sign_in_client.g.dart';

@RestApi(baseUrl: '')
abstract class SignInClient {
 factory SignInClient(Dio dio) = _SignInClient;

 @POST('/login')
 Future<Session> login(@Body() Map<String, dynamic> data);
}