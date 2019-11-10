import 'package:dio/dio.dart';

abstract class SignUpClient {
  factory SignUpClient(Dio dio) = _SignUpClient;

  Future<void> signup(FormData data);
}

class _SignUpClient implements SignUpClient {
  _SignUpClient(this._dio) {
    ArgumentError.checkNotNull(_dio, '_dio');
  }

  final Dio _dio;

  @override
  Future<void> signup(data) async {
    return _dio.post(
      '/signUp',
      data: data,
      onSendProgress: (received, total) {
        if (total != -1) {
          print((received / total * 100).toStringAsFixed(0) + "%");
        }
      },
    );
  }
}
