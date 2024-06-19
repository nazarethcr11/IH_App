import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  static const String baseUrl = 'http://192.168.18.34:8000';

  static Future<Map<String, dynamic>> login(String email, String password) async {
    final url = Uri.parse('http://192.168.18.34:8000/login'); // Cambia la URL según sea necesario

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      return {
        'status': 'success',
        'user': responseData['user'],
        'access': responseData['access'],
        'refresh': responseData['refresh'],
      };
    } else {
      return {
        'status': 'error',
        'error': json.decode(response.body)['error'],
      };
    }
  }


  static Future<Map<String, dynamic>> register(String email, String password) async {
    final url = Uri.parse('http://192.168.18.34:8000/register');

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 201) {
      final responseData = json.decode(response.body);
      return {
        'status': 'success',
        'user': responseData['user'],
        'access': responseData['access'],
        'refresh': responseData['refresh'],
      };
    } else {
      return {
        'status': 'error',
        'error': json.decode(response.body)['error'],
      };
    }
  }
}