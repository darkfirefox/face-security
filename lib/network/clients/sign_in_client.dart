
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'sign_in_client.g.dart';

@RestApi(baseUrl: '')
abstract class SignInClient {
 factory SignInClient(Dio dio) = _SignInClient;

 @POST('/login')
 Future<void> login(@Body() Map<String, dynamic> data);
}