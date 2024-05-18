import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'https://api.example.com';

  Future<http.Response> getCourses() async {
    final response = await http.get(Uri.parse('$baseUrl/courses'));
    return response;
  }

  Future<http.Response> getUsers() async {
    final response = await http.get(Uri.parse('$baseUrl/users'));
    return response;
  }

  // أضف المزيد من الوظائف حسب الحاجة
}
