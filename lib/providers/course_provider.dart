import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:creativa/models/course_model.dart';
import 'package:creativa/services/api_service.dart';

class CourseProvider with ChangeNotifier {
  List<CourseModel> _courses = [];
  bool _isLoading = false;

  List<CourseModel> get courses => _courses;
  bool get isLoading => _isLoading;

  Future<void> fetchCourses() async {
    _isLoading = true;
    notifyListeners();

    final response = await ApiService().getCourses();
    if (response.statusCode == 200) {
      final data = json.decode(response.body) as List;
      _courses = data.map((json) => CourseModel.fromJson(json)).toList();
    }

    _isLoading = false;
    notifyListeners();
  }
}
