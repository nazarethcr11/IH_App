import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:inclusive_hue/services/other/upload_img_service.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import 'package:permission_handler/permission_handler.dart';

class RecolorImage extends StatefulWidget {
  const RecolorImage({Key? key}) : super(key: key);

  @override
  State<RecolorImage> createState() => _RecolorImageState();
}

class _RecolorImageState extends State<RecolorImage> {
  File? _image;  // Hacer la variable nullable para poder manejar el caso cuando no se ha seleccionado ninguna imagen
  String? _processedImageUrl; // Para almacenar la URL de la imagen procesada
  final picker = ImagePicker();
  bool _isUploading = false;

  Future<void> _pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        _processedImageUrl = null; // Resetear la URL de la imagen procesada
      } else {
        print('No image selected.');
      }
    });
  }

  Future<void> _uploadImage() async {
    if (_image == null) return;

    setState(() {
      _isUploading = true;
    });

    final result = await ImageUploadService.uploadImage(
      _image!,
      'anomalous_trichromatic', // Cambia esto según sea necesario
      'deuteranomalous', // Cambia esto según sea necesario
    );

    setState(() {
      _isUploading = false;
    });

    if (result['status'] == 'success') {
      setState(() {
        _processedImageUrl = result['data']['image'];
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Image uploaded and processed successfully!')));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Image upload failed: ${result['error']}')));
    }
  }

  Future<void> _saveImage() async {
    if (_processedImageUrl == null) return;

    print('Attempting to save image from URL: $_processedImageUrl');

    // Solicitar permisos de almacenamiento
    var status = await Permission.storage.status;
    if (!status.isGranted) {
      await Permission.storage.request();
    }

    // Descargar la imagen
    var response = await http.get(Uri.parse(_processedImageUrl!));
    if (response.statusCode == 200) {
      // Obtener la ruta del directorio de almacenamiento
      var documentDirectory = await getExternalStorageDirectory();
      if (documentDirectory != null) {
        var filePath = '${documentDirectory.path}/${_processedImageUrl!.split('/').last}';

        // Guardar la imagen en el dispositivo
        var file = File(filePath);
        await file.writeAsBytes(response.bodyBytes);

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Image saved to $filePath')));
      } else {
        print('Error: Unable to get external storage directory.');
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed to get storage directory')));
      }
    } else {
      print('Error: Failed to download image. Status code: ${response.statusCode}');
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed to download image')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recolorar Imagen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _processedImageUrl == null
                ? _image == null
                ? Text('No image selected.')
                : Image.file(_image!)
                : Image.network(_processedImageUrl!),
            SizedBox(height: 10),
            _isUploading ? CircularProgressIndicator() : ElevatedButton(
              onPressed: _pickImage,
              child: _image == null ? Text('Pick Image') : Text('Change Image'),
            ),
            SizedBox(height: 10),
            _image == null || _processedImageUrl != null || _isUploading
                ? SizedBox.shrink()
                : ElevatedButton(
              onPressed: _uploadImage,
              child: Text('Upload Image'),
            ),
            _processedImageUrl != null
                ? ElevatedButton(
              onPressed: _saveImage,
              child: Text('Save Image'),
            )
                : SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}

