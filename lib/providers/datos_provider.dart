import 'package:app_proyecto/const/url_Host.dart';
import 'package:app_proyecto/models/models.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class DatosProvider extends GetxController{

  DatosProvider(){
    obtenerDatos();
  }

  final _url = '${UrlHost.url}/sensor';
  final _http = Dio();
  List<Datos> datos = [];
  late Datos tiempos;

  Future<void> obtenerDatos() async{
    final _response = await _http.get(_url);
    List<dynamic> _data = _response.data;

    _data.forEach((dato) {
      final datosTemp = Datos.fromMapJson(dato);
      datos.add(datosTemp);
    });

    update();
  }
}