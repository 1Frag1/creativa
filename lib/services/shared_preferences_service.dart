import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  static final SharedPreferencesService _instance =
      SharedPreferencesService._internal();
  late SharedPreferences _prefs;

  factory SharedPreferencesService() {
    return _instance;
  }

  SharedPreferencesService._internal();

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<void> saveUser(String userJson) async {
    await _prefs.setString('user', userJson);
  }

  String? getUser() {
    return _prefs.getString('user');
  }

  Future<void> clearUser() async {
    await _prefs.remove('user');
  }
}
