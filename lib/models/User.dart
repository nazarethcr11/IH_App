
class User {
  String nombre;
  String correo;
  final TypeColorBlind typeColorBlind;

  User({
    required this.nombre,
    required this.correo,
    required this.typeColorBlind,
  });
}

enum TypeColorBlind {
  monochromatic,
  dichro_prota,
  dichro_deuta,
  dichro_trita,
  trichro_prota,
  trichro_deuta,
  trichro_trita
}