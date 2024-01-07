import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UsersWidget extends StatelessWidget {
  final FirebaseFirestore db = FirebaseFirestore.instance;

  Future<Map<String, dynamic>> _getUsers() async {
    final querySnapshot =
    await db.collection('users').orderBy('status').get();
    final students = <Map<String, dynamic>>[];
    final professors = <Map<String, dynamic>>[];
    for (final doc in querySnapshot.docs) {
      final data = doc.data();
      if (data['status'] == 'Student') {
        students.add(data);
      } else if (data['status'] == 'Professor') {
        professors.add(data);
      }
    }
    final result = <String, dynamic>{
      'students': students,
      'professors': professors,
    };
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Users'),
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: _getUsers(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final data = snapshot.data!;
            final students = data['students'];
            final professors = data['professors'];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Number of students: ${students.length}',
                  style: TextStyle(fontSize: 20),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: students.length,
                    itemBuilder: (context, index) {
                      final student = students[index];
                      return ListTile(
                        title: Text(student['name']),
                        subtitle: Text(student['email']),
                      );
                    },
                  ),
                ),
                Text(
                  'Number of professors: ${professors.length}',
                  style: TextStyle(fontSize: 20),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: professors.length,
                    itemBuilder: (context, index) {
                      final professor = professors[index];
                      return ListTile(
                        title: Text(professor['name']),
                        subtitle: Text(professor['email']),
                      );
                    },
                  ),
                ),
              ],
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
class User {
  final String name;
  final String email;

  User({required this.name, required this.email});
}