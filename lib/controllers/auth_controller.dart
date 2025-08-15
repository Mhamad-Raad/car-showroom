import 'package:flutter/foundation.dart';
import '../models/user.dart';

class AuthController extends ChangeNotifier {
  User? _current;

  User? get current => _current;
  bool get isLoggedIn => _current != null;

  Future<void> login({required String email, required String password}) async {
    await Future.delayed(const Duration(milliseconds: 400));
    if (email.trim().isEmpty || password.trim().isEmpty) {
      throw Exception('Please enter email and password');
    }
    _current = User(
      id: 'local-user',
      email: email.trim(),
      displayName: email.split('@').first,
    );
    notifyListeners();
  }

  void logout() {
    _current = null;
    notifyListeners();
  }
}
