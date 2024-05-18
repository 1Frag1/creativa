import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:creativa/providers/course_provider.dart';
import 'package:creativa/screens/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CourseProvider()),
      ],
      child: MaterialApp(
        title: 'Creativa App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: LoginScreen(), // التوجيه إلى شاشة تسجيل الدخول أولاً
      ),
    );
  }
}
