import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/foundation.dart' show kIsWeb;

class ApiService {
  // Use your actual IP for both web and mobile
  static const String baseUrl = 'http://192.168.100.8:3000';

  static Future<Map<String, dynamic>> login(String username, String password) async {
    try {
      print('Attempting login at: $baseUrl/login'); // Debug log
      final response = await http.post(
        Uri.parse('$baseUrl/login'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'username': username,
          'password': password,
        }),
      );

      print('Response status: ${response.statusCode}'); // Debug log
      print('Response body: ${response.body}'); // Debug log

      final data = json.decode(response.body);
      
      if (response.statusCode != 200) {
        throw Exception(data['message'] ?? 'Login failed');
      }
      
      return data;
    } catch (e) {
      print('Login error: $e'); // Debug log
      throw Exception('Login failed: ${e.toString()}');
    }
  }

  static Future<Map<String, dynamic>> register(String username, String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/registerUser'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'username': username,
          'email': email,
          'password': password,
        }),
      );
      return json.decode(response.body);
    } catch (e) {
      throw Exception('Failed to register: $e');
    }
  }
}
