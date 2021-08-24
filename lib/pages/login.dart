import 'package:app_proyecto/providers/providers.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          _BaskgroundImage(),
          SingleChildScrollView(
              child: Column(
            children: [
              _TopText(),
              _Formulario(),
            ],
          )),
        ],
      ),
    );
  }
}

class _BaskgroundImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Image.network(
        'https://androidwalls.net/wp-content/uploads/2015/04/Abstract%20Black%20Stars%20Fog%20Dots%20White%20Background%20Android%20Wallpaper.jpg',
        fit: BoxFit.fill,
      ),
    );
  }
}

class _Formulario extends StatelessWidget {
  final _loginProvider = Get.find<LoginProvider>();
  @override
  Widget build(BuildContext context) {
    final _mediaQuery = MediaQuery.of(context).size;
    return Container(
        margin: EdgeInsets.only(top: 20.0),
        width: _mediaQuery.width * 0.90,
        height: _mediaQuery.height * 0.65,
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Form(
                key: _loginProvider.key,
                child: Column(
                  children: [
                    _Spaced(),
                    _Email(),
                    _SpacedBetween(),
                    _Password(),
                    _SpacedBetween(),
                    _BtnSubmit(),
                    _SpacedBetween(),
                    _BtnRegister(),
                  ],
                ),
              )),
        ));
  }
}

class _Email extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        validator: (data) {
          if (EmailValidator.validate(data!))
            return null;
          else
            return 'Correo no valido';
        },
        autovalidateMode: AutovalidateMode.onUserInteraction,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          hintText: 'ejemplo@gmail.com',
          labelText: 'Correo Electronico',
          prefixIcon: Icon(Icons.email),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
      ),
    );
  }
}

class _Password extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        validator: (data) {
          if (data!.length > 8)
            return null;
          else
            return 'Campo Obligatorio';
        },
        autovalidateMode: AutovalidateMode.onUserInteraction,
        obscureText: true,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          labelText: 'Contraseña',
          prefixIcon: Icon(Icons.lock),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
      ),
    );
  }
}

class _BtnSubmit extends StatelessWidget {
  final _loginProvider = Get.find<LoginProvider>();
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        if (!_loginProvider.checkValidator()) return;
        final answer = await _loginProvider.login();
        if (answer == null) {
          Navigator.pushReplacementNamed(context, '/home');
        }
      },
      child: Text('Iniciar Sesion'),
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 50.0),
      ),
    );
  }
}

class _BtnRegister extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          Navigator.pushNamed(context, '/register');
        },
        child: Text('No tienes cuenta?, Crea una aqui'));
  }
}

class _Spaced extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20.0, bottom: 50.0),
      child: Text(
        'Login',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),
      ),
    );
  }
}

class _TopText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _mediaQuery = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.only(top: _mediaQuery.width * 0.20),
      child: Column(
        children: [
          Text(
            'Acceder a su cuenta',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 35.0),
          ),
          Padding(padding: EdgeInsets.only(top: 35.0)),
          //icono
        ],
      ),
    );
  }
}

class _SpacedBetween extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30.0,
    );
  }
}
