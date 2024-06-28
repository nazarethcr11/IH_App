import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  static const String baseUrl = 'http://10.0.2.2:8000'; // Asegúrate de que esta URL sea correcta

  static Future<Map<String, dynamic>> login(String email, String password) async {
    final url = Uri.parse('$baseUrl/login');

    try {
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
        print('Login API call successful: $responseData');

        // Almacenar tokens después de un inicio de sesión exitoso
        await storeTokens(responseData['access'], responseData['refresh']);

        return {
          'status': 'success',
          'user': responseData['user'],
          'access': responseData['access'],
          'refresh': responseData['refresh'],
        };
      } else {
        print('Login API call failed: ${response.body}');
        return {
          'status': 'error',
          'error': json.decode(response.body)['error'],
        };
      }
    } catch (e) {
      print('Login API call encountered an exception: $e');
      return {
        'status': 'error',
        'error': 'An error occurred during login. Please try again.',
      };
    }
  }

  static Future<void> storeTokens(String accessToken, String refreshToken) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('accessToken', accessToken);
      await prefs.setString('refreshToken', refreshToken);
    } catch (e) {
      print('Error storing tokens: $e');
    }
  }

  static Future<void> clearTokens() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.remove('accessToken');
      await prefs.remove('refreshToken');
    } catch (e) {
      print('Error clearing tokens: $e');
    }
  }

  static Future<Map<String, dynamic>> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final refreshToken = prefs.getString('refreshToken');
    final accessToken = prefs.getString('accessToken');
    final url = Uri.parse('$baseUrl/logout');

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $accessToken', // Incluye el token de acceso en el encabezado
        },
        body: json.encode({
          'refresh': refreshToken,
        }),
      );

      if (response.statusCode == 205) {
        await clearTokens();
        return {
          'status': 'success',
        };
      } else {
        return {
          'status': 'error',
          'error': json.decode(response.body)['error'],
        };
      }
    } catch (e) {
      print('Logout API call encountered an exception: $e');
      return {
        'status': 'error',
        'error': 'An error occurred during logout. Please try again.',
      };
    }
  }

  static Future<Map<String, dynamic>> register(String email, String password) async {
    final url = Uri.parse('$baseUrl/register');

    try {
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
          'access': responseData['token']['access'],
          'refresh': responseData['token']['refresh'],
        };
      } else {
        final errorData = json.decode(response.body);
        print('Register API call failed: $errorData');
        return {
          'status': 'error',
          'error': errorData['message'] ?? 'Error desconocido',
        };
      }
    } catch (e) {
      print('Register API call encountered an exception: $e');
      return {
        'status': 'error',
        'error': 'An error occurred during registration. Please try again.',
      };
    }
  }
}

