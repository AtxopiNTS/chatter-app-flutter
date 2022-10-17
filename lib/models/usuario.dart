

class Usuario {
  // Required
  String uid;
  String nombre;
  String email;
  bool online;
  // Optional
  String? avatar;
  DateTime? connectionDateTime; //disconnectDateTime if !online

  Usuario({
      required this.uid,
      required this.nombre,
      required this.email,
      required this.online,
      this.avatar,
      this.connectionDateTime,
  });

}