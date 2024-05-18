import 'package:flutter/material.dart';
import 'package:creativa/screens/courses_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // تحديد نوع المستخدم (طالب، مشرف، مدرب)
    String userType = 'student'; // قم بتحديد نوع المستخدم بشكل مناسب

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (userType == 'student') ...[
              const Text('Welcome, Student!'),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const CoursesScreen()),
                  );
                },
                child: const Text('View Courses'),
              ),
            ] else if (userType == 'admin') ...[
              const Text('Welcome, Admin!'),
              ElevatedButton(
                onPressed: () {
                  // Navigate to admin dashboard
                },
                child: const Text('Manage Courses'),
              ),
            ] else if (userType == 'trainer') ...[
              const Text('Welcome, Trainer!'),
              ElevatedButton(
                onPressed: () {
                  // Navigate to trainer dashboard
                },
                child: const Text('View Your Courses'),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
