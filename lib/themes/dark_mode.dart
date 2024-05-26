import 'package:flutter/material.dart';

ThemeData darkMode = ThemeData(
  colorScheme: ColorScheme.dark(
    surface: Color.fromRGBO(18, 18, 18, 1),  // Color oscuro para la superficie
    primary: Color.fromRGBO(16, 76, 123, 1), // Mismo color primario
    secondary: Color.fromRGBO(193, 158, 100, 1), // Ajustado para ser menos brillante
    tertiary: Colors.grey[400], // Gris más claro para el modo oscuro
    inversePrimary: Color.fromRGBO(200, 200, 200, 1), // Color inverso ajustado para legibilidad
    onPrimary: Colors.white, // Texto sobre el color primario debe ser blanco
  ),
);