import 'dart:io';

import 'package:dio/dio.dart';
import 'package:face_security/network/clients/sign_up_client.dart';
import 'package:meta/meta.dart';

class SignUpRepository {
  SignUpRepository({@required this.client}) : assert(client != null);
  final SignUpClient client;

  Future signUp({String username, String password, File image}) async {
    final FormData formData = FormData.fromMap({
      'username': username,
      'password': password,
      "file": await MultipartFile.fromFile(image.path, filename: 'uploadfile'),
    });
    return client.singup(formData);
  }
}
