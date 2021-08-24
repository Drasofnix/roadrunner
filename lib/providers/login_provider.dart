import 'package:app_proyecto/const/url_Host.dart';
import 'package:app_proyecto/models/login_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class LoginProvider extends GetxController {
  final _http = Dio();
  final _url = '${UrlHost.url}/auth/singin';
  late LoginModel usuario;
  final _storage = FlutterSecureStorage();
  final key = GlobalKey<FormState>();

  Future<String?> login() async {
    final _response = await _http.post(_url, data: usuario.toJsonLogin());
    final _data = _response.data;
    if (_response.statusCode == 200) {
      _storage.write(key: 'token', value: _data);
      return null;
    } else {
      return _response.data['error_descripcion'];
    }
  }

  Future<void> logout() async {
    if (await _storage.read(key: 'token') != null) {
      _storage.delete(key: 'token');
    }
  }

  bool checkValidator() => key.currentState!.validate();

  Future<String?> checkStorageToken() async {
    return await _storage.read(key: 'token') ?? '';
  }
}
