import 'package:flutter/material.dart';

class Tabla extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: Table(
        border: TableBorder.all(width: 3.0),
        children: [
          TableRow(children: [_Header1(), _Header2(), _Header3()]),
          TableRow(children: [_MiniText(), _MiniText2(), _MiniText3()]),
          TableRow(children: [_MiniText(), _MiniText2(), _MiniText3()]),
          TableRow(children: [_MiniText(), _MiniText2(), _MiniText3()]),
          TableRow(children: [_MiniText(), _MiniText2(), _MiniText3()]),
          TableRow(children: [_MiniText(), _MiniText2(), _MiniText3()]),
        ],
      ),
    );
  }
}

class _Header1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left: 20.0),
        width: 20.0,
        height: 50.0,
        color: Colors.purple,
        child: Center(
          child: Text(
            'Tiempo de salida',
            style: TextStyle(
                fontSize: 18.0,
                color: Colors.black,
                fontWeight: FontWeight.bold),
          ),
        ));
  }
}

class _Header2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20.0),
      width: 20.0,
      height: 50.0,
      color: Colors.purple,
      child: Center(
        child: Text(
          'Tiempo de llegada',
          style: TextStyle(
              fontSize: 18.0, color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class _Header3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 20.0,
        height: 50.0,
        color: Colors.purple,
        child: Center(
          child: Text(
            'Fecha',
            style: TextStyle(
                fontSize: 18.0,
                color: Colors.black,
                fontWeight: FontWeight.bold),
          ),
        ));
  }
}

class _MiniText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20.0,
      height: 40.0,
      child: Text(''), //Datos registrados del sensor
    );
  }
}

class _MiniText2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20.0,
      height: 40.0,
      child: Text(''), //Datos registrados del sensor
    );
  }
}

class _MiniText3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20.0,
      height: 40.0,
      child: Text(''), //Datos registrados del sensor
    );
  }
}
