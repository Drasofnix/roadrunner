class Datos {
  String? id;
  String? fecha;
  String? hora;
  String? tiempo;

  Datos({
    this.id,
    this.fecha,
    this.hora,
    this.tiempo,
  });

  factory Datos.fromMapJson(Map<String, dynamic> data) => Datos(
    fecha: data['fecha'],
    hora: data['hora'],
    tiempo: data['tiempo'],
    id: data['_id'],
  );

  Map<String, dynamic>toJson()=>{
    'fecha': fecha,
    'hora:': hora,
    'tiempo': tiempo,
  };
}