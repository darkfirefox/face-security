
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'push_client.g.dart';

@RestApi(baseUrl: '')
abstract class PushClient {
  factory PushClient(Dio dio) = _PushClient;

  @PUT('pushtoken')
  Future<void> pushToken(@Body() Map<String, dynamic> body);
}