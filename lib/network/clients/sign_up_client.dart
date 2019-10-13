import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'sign_up_client.g.dart';

@RestApi(baseUrl: '')
abstract class SignUpClient {
  factory SignUpClient(Dio dio) = _SignUpClient;
}