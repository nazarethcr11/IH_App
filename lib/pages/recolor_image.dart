import 'package:flutter/material.dart';

class RecolorImage extends StatefulWidget {
  const RecolorImage({Key? key}) : super(key: key);

  @override
  State<RecolorImage> createState() => _RecolorImageState();
}

class _RecolorImageState extends State<RecolorImage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recolorar Imagen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              'Recolorar Imagen',
            ),
          ],
        ),
      ),
    );
  }
}
