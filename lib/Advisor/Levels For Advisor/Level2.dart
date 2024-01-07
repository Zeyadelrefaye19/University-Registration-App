import 'package:flutter/material.dart';

class Level2forAdvisors extends StatefulWidget {
  @override
  _Level2forAdvisorsState createState() => _Level2forAdvisorsState();
}

class _Level2forAdvisorsState extends State<Level2forAdvisors> {
  List<Course> _courses = [
    Course(
        name: 'Math 3',
        instructor: 'Dr Abdellatif',
        description: 'This Course Explains how to learn Math 3',
        creditHours: 2),
    Course(
        name: 'Data Structure',
        instructor: 'Dr Ahmed Younes',
        description: 'This Course Explains how to Learn Data Structure',
        creditHours: 2),
    Course(
        name: 'Data Science',
        instructor: 'Dr Ghada Koudous',
        description: 'This Course Explains how to Learn Data Science ',
        creditHours: 2),
    Course(name: 'Software Engineering Theory', instructor: 'Dr Eman ', description: 'This Course Explains how to Learn Software Engineering Theory ', creditHours: 2),
    Course(name: 'MultiMedia Systems', instructor: 'Dr hatem ', description: 'This Course Explains how to Learn MultiMedia Systems ', creditHours: 3),
    Course(name: 'Game Programming', instructor: 'Dr Amira', description: 'This Course Explains how to Learn Game Programming', creditHours: 3),
    Course(name: 'Math 4', instructor: 'Dr Abdellatif', description: 'This Course Explains how to learn Math 3', creditHours: 2),
    Course(name: 'Web Progamming', instructor: 'Dr Islam Kabani', description: 'This Course Explains how to learn  Web Progamming', creditHours: 3),
    Course(name: 'Database', instructor: 'Dr Marwa AbdelHamed', description: 'This Course Explains how to learn  Database', creditHours: 3),
    Course(name: 'HCI', instructor: 'Dr Ghada Ahmed', description: 'This Course Explains how to learn  HCI', creditHours: 3),
    Course(name: 'Software Requirement Analysis', instructor: 'Dr Rasha Mohamed', description: 'This Course Explains how to learn Software Requirement Analysis ', creditHours: 2),
    Course(name: 'مهارات عرض ', instructor: 'Dr hamed', description: 'This Course Explains how to learn مهارات عرض', creditHours: 2),

  ];

  List<Course> _cart = [];

  void _addToCart(Course course) {
    setState(() {
      _cart.add(course);
    });
  }

  void _removeFromCart(Course course) {
    setState(() {
      _cart.remove(course);
    });
  }

  bool _isInCart(Course course) {
    return _cart.contains(course);
  }

  Widget _buildRowCourses(Course course) {
    return Row(
      children: [

        IconButton(
          icon: Icon(Icons.add),

          onPressed: () {
            _addToCart(course);
          },
        ),
        SizedBox(
          width: 10.0,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                course.name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Text(
                course.instructor,
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Text(
                course.description,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBox() {
    return SizedBox(
      height: 15.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text("The Courses Description"),
        actions: [
          IconButton(
            icon: Stack(
              children: [
                Icon(Icons.person),
                Positioned(
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.all(1),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    constraints: BoxConstraints(
                      minWidth: 12,
                      minHeight: 12,
                    ),
                    child: Text(
                      '${_cart.length}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 8,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return CourseShoppingCart(
                    courses: _cart,
                    onRemoveFromCart: _removeFromCart,
                    onSave: () {  },



                  );
                },
              );
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(7.0),
          child: Column(
            children: _courses
                .map((course) => Column(
              children: [
                _buildRowCourses(course),
                _buildBox(),
              ],
            ))
                .toList(),
          ),
        ),
      ),
    );
  }
}

class Course {
  final String name;
  final String instructor;
  final String description;
  final int creditHours;

  Course({
    required this.name,
    required this.instructor,
    required this.description,
    required this.creditHours,
  });
}
class CourseShoppingCart extends StatelessWidget {

  final List<Course> courses;
  final Function(Course) onRemoveFromCart;
  final VoidCallback onSave;

  CourseShoppingCart({
    required this.courses,
    required this.onRemoveFromCart,
    required this.onSave,
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total Courses',
                  style:
                  TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: Icon(Icons.save),
                  onPressed: onSave,
                ),
                IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
            SizedBox(height: 16),
            if (courses.isEmpty)
              Text('No courses added ')
            else
              Column(
                children: courses
                    .map((course) => ListTile(
                  leading: IconButton(
                    icon: Icon(Icons.remove),
                    onPressed: () {
                      onRemoveFromCart(course);
                    },
                  ),
                  title: Text(course.name),
                  subtitle: Text(course.instructor),
                  trailing: Text(
                    '${course.creditHours} CH',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ))
                    .toList(),
              ),


            SizedBox(height: 16),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
            SizedBox(height: 16),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
