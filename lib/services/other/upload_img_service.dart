import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ImageUploadService {
  static const String baseUrl = 'http://10.0.2.2:8000';

  static Future<Map<String, dynamic>> uploadImage(File imageFile, String type, String subtype) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final accessToken = prefs.getString('accessToken');

    if (accessToken == null) {
      return {
        'status': 'error',
        'error': 'Access token is missing',
      };
    }

    final url = Uri.parse('$baseUrl/upload/'); // Añadir la barra final aquí
    final request = http.MultipartRequest('POST', url)
      ..headers['Authorization'] = 'Bearer $accessToken'
      ..fields['type'] = type
      ..fields['subtype'] = subtype
      ..files.add(await http.MultipartFile.fromPath('image', imageFile.path));

    try {
      final response = await request.send();
      final responseBody = await http.Response.fromStream(response);

      if (response.statusCode == 201) {
        return {
          'status': 'success',
          'data': json.decode(responseBody.body),
        };
      } else {
        return {
          'status': 'error',
          'error': json.decode(responseBody.body)['error'],
        };
      }
    } catch (e) {
      return {
        'status': 'error',
        'error': 'An error occurred during image upload. Please try again.',
      };
    }
  }
}
