import 'package:flutter/material.dart';

import 'Semesters/Spring Semester.dart';
import 'Semesters/Winter_Semester.dart';


class Level1forStudents extends StatelessWidget  {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Level 1'),
      ),
      body:Center(
        child: Column(


          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: double.infinity,
              color: Colors.blue,
              height: 80.0,
              child:
              DropdownButton(
                items: <DropdownMenuItem>[
                  DropdownMenuItem(
                    child: Text('Winter Semester'),
                    value: 'Winter Semester' ,
                  ),
                  DropdownMenuItem(
                    child: Text('Spring Semester'),
                    value: 'Spring Semester',
                  ),

                ],

                onChanged: (value) {
                  if(value=='Winter Semester'){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>WinterSemesterLevel1()),
                    );
                  }
                  else if(value=='Spring Semester'){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>SpringSemesterLevel1()),
                    );
                  }


                },
              ),

            )
          ],
        ),
      ),
    );
  }
}


