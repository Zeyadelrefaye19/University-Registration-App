import 'package:flutter/material.dart';

import '../Users Count/View Registered Users.dart';
import 'Add&Drop For Advisors (Students)/Add&DropA.dart';
import 'Add&DropForAdvisors (Proffesors)/Add&DropAP.dart';
import 'Levels For Advisor/Level 1.dart';
import 'Levels For Advisor/Level 3.dart';
import 'Levels For Advisor/Level2.dart';
import 'Levels For Advisor/Level4.dart';





class AdvisorDashboard extends StatefulWidget{
  @override
  _AdvisorDashboardState createState() => _AdvisorDashboardState();
}

class _AdvisorDashboardState extends State<AdvisorDashboard> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Advisor Dashboard'),
      ),
      body:Center(
        child: Column(


          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: double.infinity,
              color: Colors.blue,
              height: 80.0,
              child: MaterialButton(
                onPressed: ()
                {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>UsersWidget()),
                  );

                },
                child:Text(
                  'View Registered Users',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ) ,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              width: double.infinity,
              color: Colors.blue,
              height: 80.0,
              child: MaterialButton(
                onPressed: ()
                {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>AddDropStudentsForAdvisor()),
                  );

                },
                child:Text(
                  'Add&DropStudents',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ) ,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              width: double.infinity,
              color: Colors.blue,
              height: 80.0,
              child: MaterialButton(
                onPressed: ()
                {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>AddDropForProffessorAdvisor()),
                  );

                },
                child:Text(
                  'Add&DropProffessors',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ) ,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              'Choose a course to add or drop.',
            ),
            SizedBox(
              height: 20.0,
            ),
            DropdownButton(

              items: <DropdownMenuItem>[
                DropdownMenuItem(
                  child: Text('Level 1'),
                  value: 'Level 1',
                ),
                DropdownMenuItem(
                  child: Text('Level 2'),
                  value: 'Level 2',
                 ),
                DropdownMenuItem(
                  child: Text('Level 3'),
                  value: 'Level 3',

               ),
                DropdownMenuItem(
                  child: Text('Level 4'),
                  value: 'Level 4',

                ),
              ],

              onChanged: (value) {
              if(value=='Level 1'){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>Level1forAdvisors()),
                );
              }
              else if(value=='Level 2'){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>Level2forAdvisors()),
                );
              }
              else if (value=='Level 3'){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>Level3forAdvisors()),
                  );

              }
              else if (value=='Level 4'){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>Level4forAdvisors()),
                    );

              }

              },
            ),
            MaterialButton(
              onPressed: () {


              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}


