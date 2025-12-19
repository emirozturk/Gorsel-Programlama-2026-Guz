import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user.dart';
import '../models/link.dart';

class ApiService {
  // Change this to your backend URL
  static const String baseUrl = 'http://localhost:5183';
  
  String? _authToken;

  void setAuthToken(String? token) {
    _authToken = token;
  }

  Map<String, String> _getHeaders() {
    final headers = {
      'Content-Type': 'application/json',
    };
    if (_authToken != null) {
      headers['Authorization'] = 'Bearer $_authToken';
    }
    return headers;
  }

  // Login
  Future<Map<String, dynamic>> login(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/User/login'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'mail': email,
          'password': password,
        }),
      );

      final data = jsonDecode(response.body);
      
      if (response.statusCode == 200 && data['success'] == true) {
        final body = data['body'];
        if (body['token'] != null) {
          _authToken = body['token'];
        }
        return {
          'success': true,
          'user': User.fromJson(body['user']),
          'token': body['token'],
        };
      } else {
        return {
          'success': false,
          'message': data['message'] ?? 'Login failed',
        };
      }
    } catch (e) {
      return {
        'success': false,
        'message': 'Error: $e',
      };
    }
  }

  // Register
  Future<Map<String, dynamic>> register(
      String username, String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/user/register'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'username': username,
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return {
          'success': true,
          'user': User.fromJson(data['user']),
          'token': data['token'],
        };
      } else {
        return {
          'success': false,
          'message': 'Registration failed: ${response.body}',
        };
      }
    } catch (e) {
      return {
        'success': false,
        'message': 'Error: $e',
      };
    }
  }

  // Get all links for the authenticated user
  Future<List<Link>> getLinks() async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/link'),
        headers: _getHeaders(),
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        return data.map((json) => Link.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load links: ${response.body}');
      }
    } catch (e) {
      throw Exception('Error fetching links: $e');
    }
  }

  // Get a specific link by ID with tags
  Future<Link> getLinkById(int id) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/link/$id'),
        headers: _getHeaders(),
      );

      if (response.statusCode == 200) {
        return Link.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to load link: ${response.body}');
      }
    } catch (e) {
      throw Exception('Error fetching link: $e');
    }
  }

  // Create a new link
  Future<Link> createLink(String url, String title, String? description) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/link'),
        headers: _getHeaders(),
        body: jsonEncode({
          'url': url,
          'title': title,
          'description': description,
        }),
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        return Link.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to create link: ${response.body}');
      }
    } catch (e) {
      throw Exception('Error creating link: $e');
    }
  }

  // Delete a link
  Future<bool> deleteLink(int id) async {
    try {
      final response = await http.delete(
        Uri.parse('$baseUrl/link/$id'),
        headers: _getHeaders(),
      );

      return response.statusCode == 204 || response.statusCode == 200;
    } catch (e) {
      throw Exception('Error deleting link: $e');
    }
  }
}
