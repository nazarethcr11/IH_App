
import 'package:flutter/material.dart';
import 'package:inclusive_hue/models/User.dart';

class InclusiveHueApp extends ChangeNotifier{
  //usuario de la aplicacion
  final User _colorblind = User(nombre: 'User Name', correo: 'correo@example.com', typeColorBlind: TypeColorBlind.dichro_prota);

  //Getter
  User get colorbind => _colorblind;

}