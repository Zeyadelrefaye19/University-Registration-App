import 'package:flutter/material.dart';

class WinterSemesterLevel1 extends StatefulWidget {
  @override
  _WinterSemesterLevel1State createState() => _WinterSemesterLevel1State();
}

class _WinterSemesterLevel1State extends State<WinterSemesterLevel1> {
  List<Course> _courses = [
    Course(name: 'Intro to Web Programming', instructor: 'Dr Islam Kabani', description: 'This Course Explains how to learn Intro to Web Programming ', creditHours: 3),
    Course(name: 'Into to Computer Programming', instructor: 'Dr Sh3ban', description: 'This Course Explains how to Learn Computer Programming', creditHours: 3),
    Course(name: 'Math 2', instructor: 'Dr abdellatif', description: 'This Course Explains how to Learn ', creditHours: 2),

    Course(name: 'Phyiscs 2', instructor: 'Dr Anas', description: 'This Course Explains how to learn Physics 2', creditHours: 2),
    Course(name: 'Math For CS', instructor: 'Dr Shaimaa', description: 'This Course Explains how to learn Math For CS', creditHours: 3),
    Course(name: 'Human Rights', instructor: 'Dr Moemen', description: 'This Course Explains how to learn Human Rights', creditHours: 2),

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
        Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [

            Padding(
              padding: const EdgeInsetsDirectional.only(
                bottom: 2.0,
                end: 2.0,
              ),
              child: IconButton(
                icon: Icon(Icons.add),

                onPressed: () {
                  _addToCart(course);
                },
              ),
            )
          ],
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

        title: Text("Winter Semester Courses"),
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
    int totalCreditHours = courses.fold<int>(0, (sum, course) => sum + course.creditHours);

    Text('Total credit hours: $totalCreditHours');
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
              Text('No courses added to cart.')
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
            Text('Total credit hours: $totalCreditHours'),
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
