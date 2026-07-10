class Agente {

  final int id;
  final String nombre;

  Agente({
    required this.id,
    required this.nombre,
  });

  factory Agente.fromJson(
    Map<String,dynamic> json,
  ) {
    return Agente(
      id: json['id'],
      nombre: json['nombre'],
    );
  }
}