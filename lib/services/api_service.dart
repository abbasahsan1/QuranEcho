import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  // Replace this IP with your computer's local IP address
  // Use ipconfig (Windows) or ifconfig (Mac/Linux) to find it
  static const String baseUrl = "http://192.168.100.8:3000";  // Update this IP
  static const Duration timeoutDuration = Duration(seconds: 30);

  static Future<Map<String, dynamic>> loginUser(String username, String password) async {
    final url = Uri.parse("$baseUrl/login");

    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"username": username, "password": password}),
      ).timeout(timeoutDuration);

      final data = jsonDecode(response.body);
      return {
        'success': response.statusCode == 200,
        'message': data['message'] ?? 'Unknown error occurred',
        'user': data['user']
      };
    } catch (error) {
      String errorMessage = 'Connection error';
      if (error is TimeoutException) {
        errorMessage = 'Connection timed out. Please try again.';
      }
      return {
        'success': false,
        'message': '$errorMessage: $error'
      };
    }
  }

  static Future<Map<String, dynamic>> registerUser(
      String username, String email, String password) async {
    final url = Uri.parse("$baseUrl/registerUser");

    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "username": username,
          "email": email,
          "password": password,
        }),
      ).timeout(timeoutDuration);

      final data = jsonDecode(response.body);
      return {
        'success': response.statusCode == 201,
        'message': data['message'] ?? 'Unknown error occurred'
      };
    } catch (error) {
      String errorMessage = 'Connection error';
      if (error is TimeoutException) {
        errorMessage = 'Connection timed out. Please try again.';
      }
      return {
        'success': false,
        'message': '$errorMessage: $error'
      };
    }
  }
}