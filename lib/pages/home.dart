import 'package:app_proyecto/models/perfil_model.dart';
import 'package:app_proyecto/providers/login_provider.dart';
import 'package:app_proyecto/providers/perfil_provider.dart';
import 'package:app_proyecto/widgets/graphic.dart';
import 'package:app_proyecto/widgets/table.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  final _table = Tabla();
  final _grafica = Graphic();
  final _loginProvider = Get.find<LoginProvider>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(160, 0, 225, 1),
        title: Center(
          child: Text(
            'RoadRunner',
            style: TextStyle(fontSize: 40.0),
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Color.fromRGBO(160, 0, 225, 1)),
              child: Text(
                'Options',
                style: TextStyle(fontSize: 40.0, color: Colors.white),
              ),
            ),
            ListTile(
              title: Text(
                'Logout',
                style: TextStyle(fontSize: 20.0),
              ),
              onTap: () async {
                await _loginProvider.logout();
                Navigator.pushReplacementNamed(context, '/login');
              },
            )
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [_FirstRow(), _table, _grafica],
      ),
    );
  }
}

class _FirstRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PerfilProvider>(builder: (PerfilProvider perfilProvider) {
      final i = perfilProvider.users.length;
      return Container(
          margin: EdgeInsets.all(10.0),
          child: Row(
            children: [
              _UserImage(),
              _TextCamp(perfilProvider.users[i]),
            ],
          ));
    });
  }
}

class _UserImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.0,
      height: 100.0,
      child: CircleAvatar(
        backgroundImage: NetworkImage(
            'https://tienda.elsardinero.com/wp-content/uploads/2017/09/user.png'),
      ),
    );
  }
}

class _TextCamp extends StatelessWidget {
  final Perfil user;
  _TextCamp(this.user);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280.0,
      height: 100.0,
      margin: EdgeInsets.only(left: 10.0),
      color: Colors.purple,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            user.name!, //Concatenar datos usuario
            style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
          ),
          Text(' Edad: ', //Concatenar datos usuario
              style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold)),
          Text(' Correo: ', //Concatenar datos usuario
              style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold))
        ],
      ),
    );
  }
}
