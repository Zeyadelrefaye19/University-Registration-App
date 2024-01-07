import 'package:flutter/material.dart';

import '../Add&Drop Students/CGP.dart';
import '../Grades/CG.dart';









class ComputerGraphics  extends StatelessWidget {



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('ComputerGraphics Dashboard'),
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
                    MaterialPageRoute(builder: (context) =>GradeComputerGraphics()),
                  );

                },
                child:Text(
                  'Grades ',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ) ,
              ),
            ),
            SizedBox(
              height: 10.0,
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
                    MaterialPageRoute(builder: (context) =>CGP()),
                  );

                },
                child:Text(
                  'Add&Drop Students',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ) ,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


