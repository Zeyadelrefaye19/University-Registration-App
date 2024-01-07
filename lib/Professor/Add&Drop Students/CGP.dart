import 'package:flutter/material.dart';

class CGP extends StatefulWidget {
  @override
  _CGPState createState() => _CGPState();
}

class _CGPState extends State<CGP> {
  List<Student> _Student = [
    Student(
      name: 'Ahmed husseiny',
      id: '203050',
    ),
    Student(
      name: ' Gasser Tamer',
      id: '203051',
    ),
    Student(
      name: 'Zeyad Mohamed',
      id: '203050',
    ),
    Student(name: 'Ahmed Zake', id: '203041', ),
    Student(name: 'Amr Youssef', id: '203040', ),
    Student(name: 'Zeyad Zien', id: '203042', ),
    Student(name: 'Farah', id: '203055'),
    Student(name: 'Hadeer', id: '2103645'),
  ];

  List<Student> _cart = [];

  void _addToCart( Student student ) {
    setState(() {
      _cart.add(student);
    });
  }

  void _removeFromCart(Student student) {
    setState(() {
      _cart.remove(student);
    });
  }

  bool _isInCart(Student student) {
    return _cart.contains(student);
  }

  Widget _buildRowCourses(Student student) {
    return Row(
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [

            IconButton(
              icon: Icon(Icons.add),

              onPressed: () {
                _addToCart(student);
              },
            ),

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
                student.name,
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
                student.id,
                style: TextStyle(
                  fontSize: 20.0,
                ),
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
        leading: Icon(Icons.add),
        title: Text("Students"),
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
                  return StudentShoppingCart(
                    student : _cart,
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
            children: _Student
                .map((student) => Column(
              children: [
                _buildRowCourses(student),
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

class Student {
  final String name;
  final String id;

  Student({
    required this.name,
    required this.id,

  });
}
class StudentShoppingCart extends StatelessWidget {

  final List<Student> student;
  final Function(Student) onRemoveFromCart;
  final VoidCallback onSave;

  StudentShoppingCart({
    required this.student,
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
                  'Total Students',
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
            if (student.isEmpty)
              Text('No Students added ')
            else
              Column(
                children: student
                    .map((student) => ListTile(
                  leading: IconButton(
                    icon: Icon(Icons.remove),
                    onPressed: () {
                      onRemoveFromCart(student);
                    },
                  ),
                  title: Text(student.name),
                  subtitle: Text(student.id),

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
