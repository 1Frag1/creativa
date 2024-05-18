import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:creativa/providers/course_provider.dart';
import 'package:creativa/models/course_model.dart';

class CoursesScreen extends StatelessWidget {
  const CoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final courseProvider = Provider.of<CourseProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Courses'),
      ),
      body: courseProvider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: courseProvider.courses.length,
              itemBuilder: (context, index) {
                CourseModel course = courseProvider.courses[index];
                return ListTile(
                  title: Text(course.title),
                  subtitle: Text(course.description),
                  onTap: () {
                    // navigate to course detail
                  },
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // add new course
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
