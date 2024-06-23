import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:image/image.dart' as img;
import 'dart:async';

import 'package:inclusive_hue/models/color_name.dart';

class CameraColorPicker extends StatefulWidget {
  @override
  _CameraColorPickerState createState() => _CameraColorPickerState();
}

class _CameraColorPickerState extends State<CameraColorPicker> {
  CameraController? _cameraController;
  bool _isCameraInitialized = false;
  Color? _selectedColor;
  String? _colorName;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    final cameras = await availableCameras();
    final camera = cameras.first;

    _cameraController = CameraController(camera, ResolutionPreset.medium);
    await _cameraController!.initialize();

    if (!mounted) {
      return;
    }

    setState(() {
      _isCameraInitialized = true;
    });

    // Iniciar un temporizador para capturar imágenes cada segundo
    _timer = Timer.periodic(Duration(seconds: 1), (Timer t) => _captureImage());
  }

  Future<void> _captureImage() async {
    if (!_cameraController!.value.isInitialized || _cameraController!.value.isTakingPicture) {
      return;
    }

    try {
      final XFile file = await _cameraController!.takePicture();
      final img.Image? capturedImage = img.decodeImage(await file.readAsBytes());

      if (capturedImage != null) {
        _getCenterPixelColor(capturedImage);
      }
    } catch (e) {
      print('Error capturing image: $e');
    }
  }

  void _getCenterPixelColor(img.Image image) {
    final int centerX = image.width ~/ 2;
    final int centerY = image.height ~/ 2;

    final pixel = image.getPixel(centerX, centerY);
    final color = Color.fromARGB(
      img.getAlpha(pixel),
      img.getRed(pixel),
      img.getGreen(pixel),
      img.getBlue(pixel),
    );

    print('Center Pixel: ($centerX, $centerY)');
    print('Selected Color: $color');

    setState(() {
      _selectedColor = color;
      _colorName = _getColorName(color);
    });

    print('Color Name: $_colorName');
  }

  String _getColorName(Color color) {
    final int r = color.red;
    final int g = color.green;
    final int b = color.blue;

    return colorNamer.getColorName(r, g, b);
  }

  @override
  void dispose() {
    _cameraController?.dispose();
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Camera Color Picker'),
      ),
      body: _isCameraInitialized
          ? Stack(
        children: [
          CameraPreview(_cameraController!),
          Center(
            child: Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
            ),
          ),
          if (_selectedColor != null)
            Positioned(
              bottom: 20,
              left: 20,
              child: Column(
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    color: _selectedColor,
                  ),
                  SizedBox(height: 10),
                  Text(
                    '#${_selectedColor!.value.toRadixString(16).padLeft(8, '0').toUpperCase()}',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    _colorName ?? '',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
        ],
      )
          : Center(child: CircularProgressIndicator()),
    );
  }
}
