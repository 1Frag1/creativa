import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:creativa/models/user_model.dart';
import 'package:creativa/services/shared_preferences_service.dart';

class UserProvider with ChangeNotifier {
  UserModel? _user;
  bool _isLoading = false;
  final SharedPreferencesService _prefsService = SharedPreferencesService();

  UserModel? get user => _user;
  bool get isLoading => _isLoading;

  Future<void> loginUser(String email, String password) async {
    _isLoading = true;
    notifyListeners();

    // هنا يجب عليك تنفيذ منطق تسجيل الدخول مثل الاتصال بـ API
    // نحن نفترض أن تسجيل الدخول ناجحًا وأننا نحصل على بيانات المستخدم
    UserModel loggedInUser = UserModel(
      id: '1',
      name: 'User Name',
      email: email,
      role: 'student', // أو 'admin' أو 'trainer' بناءً على الدور
    );

    _user = loggedInUser;
    await _prefsService.saveUser(json.encode(loggedInUser.toJson()));

    _isLoading = false;
    notifyListeners();
  }

  Future<void> loadUser() async {
    String? userJson = _prefsService.getUser();
    if (userJson != null) {
      _user = UserModel.fromJson(json.decode(userJson));
      notifyListeners();
    }
  }

  Future<void> logoutUser() async {
    _user = null;
    await _prefsService.clearUser();
    notifyListeners();
  }
}
