import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'NOTIFICACIONES',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: Theme.of(context).colorScheme.secondary,
      body: Builder(
        builder: (context) => ListView(
          children: [
            _buildNotificationContainer(
              context,
              'Usted realizó un cambio en el tipo de daltonismo: “Deuteranopia”',
              'lib/images/logotype/logo.png', // Ruta de la imagen
            ),
            _buildNotificationContainer(
              context,
              'Usted lleva ejecutando la apliación por mas de 1 hora',
              'lib/images/logotype/logo.png', // Ruta de la imagen
            ),
            _buildNotificationContainer(
              context,
              'Encendiste la aplcación. Esta se ejecutará en segundo plano ',
              'lib/images/logotype/logo.png', // Ruta de la imagen
            ),
            // Agrega más mensajes según sea necesario
          ],
        ),
      ),
    );
  }

  Widget _buildNotificationContainer(BuildContext context, String message, String imagePath) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      padding: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Theme.of(context).colorScheme.surface,
      ),
      child: Row(
        children: [
          Image.asset(
            imagePath,
            width: 40.0, // Ancho de la imagen
            height: 40.0, // Alto de la imagen
          ),
          SizedBox(width: 10.0),
          Expanded( // Envolver el Row dentro de un Expanded
            child: Text(
              message,
              style: TextStyle(
                fontSize: 15,
                color: Theme.of(context).colorScheme.tertiary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
