import 'package:app_proyecto/pages/check_storage.dart';
import 'package:app_proyecto/pages/home.dart';
import 'package:app_proyecto/pages/login.dart';
import 'package:app_proyecto/pages/register.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Proyecto App',
      initialRoute: '/login',
      routes: {
        '/login': (_) => LoginPage(),
        '/register': (_) => RegisterPage(),
        '/home': (_) => HomePage(),
        '/check': (_) => CheckStorage()
      },
    );
  }
}
