class Perfil {
  String? id;
  String? name;
  String? email;
  String? password;

  Perfil({
    this.id,
    required this.name,
    required this.email,
    required this.password,
  });

  factory Perfil.fromMapJson(Map<String, dynamic> data) => Perfil(
    name: data['name'],
    email: data['email'],
    password: data['password'],
    id: data['_id'],
  );

  Map<String, dynamic>toJson()=>{
    'name': name,
    'email:': email,
    'password': password,
  };
}