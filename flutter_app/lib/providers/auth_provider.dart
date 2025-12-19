import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user.dart';
import '../services/api_service.dart';

class AuthProvider with ChangeNotifier {
  User? _user;
  String? _token;
  final ApiService _apiService = ApiService();
  bool _isLoading = false;

  User? get user => _user;
  String? get token => _token;
  bool get isAuthenticated => _token != null && _user != null;
  bool get isLoading => _isLoading;
  ApiService get apiService => _apiService;

  AuthProvider() {
    _loadFromPreferences();
  }

  Future<void> _loadFromPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    _token = prefs.getString('token');
    final userJson = prefs.getString('user');
    
    if (_token != null && userJson != null) {
      _user = User.fromJson(Map<String, dynamic>.from(
        // Simple parsing since we stored it as JSON string
        {'id': prefs.getInt('userId') ?? 0,
         'username': prefs.getString('username') ?? '',
         'email': prefs.getString('email') ?? ''}
      ));
      _apiService.setAuthToken(_token);
      notifyListeners();
    }
  }

  Future<Map<String, dynamic>> login(String email, String password) async {
    _isLoading = true;
    notifyListeners();

    final result = await _apiService.login(email, password);
    
    if (result['success']) {
      _user = result['user'];
      _token = result['token'];
      
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', _token!);
      await prefs.setInt('userId', _user!.id);
      await prefs.setString('email', _user!.email);
      
      _apiService.setAuthToken(_token);
    }

    _isLoading = false;
    notifyListeners();
    return result;
  }

  Future<Map<String, dynamic>> register(
      String username, String email, String password) async {
    _isLoading = true;
    notifyListeners();

    final result = await _apiService.register(username, email, password);
    
    if (result['success']) {
      _user = result['user'];
      _token = result['token'];
      
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', _token!);
      await prefs.setInt('userId', _user!.id);
      await prefs.setString('email', _user!.email);
      
      _apiService.setAuthToken(_token);
    }

    _isLoading = false;
    notifyListeners();
    return result;
  }

  Future<void> logout() async {
    _user = null;
    _token = null;
    _apiService.setAuthToken(null);
    
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    
    notifyListeners();
  }
}
