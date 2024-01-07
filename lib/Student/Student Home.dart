import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'Levels For Students/Level 1/Level1.dart';
import 'Levels For Students/Level 2/Level 2.dart';
import 'Levels For Students/Level 3/Level 3.dart';
import 'Levels For Students/Level 4/Level 4.dart';


class StudentHomePage extends StatelessWidget {


  @override
  Widget build(BuildContext context){

    return Scaffold(
      appBar: AppBar(
        title: Text('StudentHomePage'),
      ),

      body: Center(
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
                    MaterialPageRoute(builder: (context) =>Level1forStudents()),
                  );
                }
                else if(value=='Level 2'){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>Level2forStudents()),
                  );
                }
                else if (value=='Level 3'){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>Level3forStudents()),
                  );

                }
                else if (value=='Level 4'){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>Level4forStudents()),
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


