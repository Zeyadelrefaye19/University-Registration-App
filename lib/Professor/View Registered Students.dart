import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UsersWidget2 extends StatelessWidget {
  final FirebaseFirestore db = FirebaseFirestore.instance;

  Future<List<User2>> _getStudents() async {
    final querySnapshot =
    await db.collection('users').where('status', isEqualTo: 'Student').get();
    final students = querySnapshot.docs.map((doc) {
      final data = doc.data();
      return User2(
        name: data['name'],
        email: data['email'],
        gpa: data.containsKey('gpa') ? data['gpa'].toDouble() : null,

      );
    }).toList();
    return students;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Students'),
      ),
      body: FutureBuilder<List<User2>>(
        future: _getStudents(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final students = snapshot.data!;
            return Column(
              children: [
                Text(
                  'Number of students: ${students.length}',
                  style: const TextStyle(fontSize: 20),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: students.length,
                    itemBuilder: (context, index) {
                      final student = students[index];
                      return ListTile(
                        title: Text(student.name),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(student.email),
                            if (student.gpa != null)
                              Text('GPA: ${student.gpa}'),

                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

class User2 {
  final String name;
  final String email;
  final double? gpa;


  User2({required this.name, required this.email, this.gpa});
}
