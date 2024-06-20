import 'package:flutter/material.dart';

class CameraToolPage extends StatefulWidget {
  const CameraToolPage({Key? key}) : super(key: key);

  @override
  State<CameraToolPage> createState() => _CameraToolPageState();
}

class _CameraToolPageState extends State<CameraToolPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: const Text('Not camera found.'),
    );
  }
}
