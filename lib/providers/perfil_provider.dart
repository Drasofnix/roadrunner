import 'package:app_proyecto/const/url_Host.dart';
import 'package:dio/dio.dart';
import 'package:app_proyecto/models/perfil_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as storage;
import 'package:get/get.dart';

class PerfilProvider extends GetxController {
  PerfilProvider() {
    obtenerUser();
  }

  final _url = '${UrlHost.url}/users';
  final _http = Dio();
  List<Perfil> users = [];
  GlobalKey<FormState> key = GlobalKey<FormState>();
  late Perfil usuario;
  final _storage = storage.FlutterSecureStorage();

  Future<void> obtenerUser() async {
    final _response = await _http.get(_url,
        options: Options(headers: {
          'Autorization': 'Bearer ${await _storage.read(key: 'token')}'
        }));
    List<dynamic> _data = _response.data;

    _data.forEach((user) {
      final usuariotemp = Perfil.fromMapJson(user);
      users.add(usuariotemp);
    });

    update();
  }

  bool validateForm() {
    return key.currentState!.validate();
  }

  Future<void> crearUsuario() async {
    final _response = await _http.post(_url, data: usuario.toJson());
    usuario.id = _response.data['id'];
    users.add(usuario);
  }
}
