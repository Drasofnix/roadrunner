import 'package:app_proyecto/models/login_model.dart';
import 'package:app_proyecto/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckStorage extends StatelessWidget {
  final _loginProvider = Get.put(LoginProvider());
  @override
  Widget build(BuildContext context) {
    _loginProvider.usuario = LoginModel(email: '', password: '');
    return Scaffold(
      body: FutureBuilder(
        future: _loginProvider.checkStorageToken(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) return Text('Cargando...');

          if (snapshot.data != '') {
            Future.microtask(
              () => Navigator.pushReplacementNamed(context, '/home'),
            );
          } else {
            Future.microtask(
              () => Navigator.pushReplacementNamed(context, '/login'),
            );
          }
          return Container();
        },
      ),
    );
  }
}
