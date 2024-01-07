import 'package:flutter/material.dart';

import '../Add&Drop Students/OSP.dart';
import '../Grades/OS.dart';








class OperatingSystem  extends StatelessWidget {



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(' OperatingSystem Dashboard'),
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
                    MaterialPageRoute(builder: (context) =>GradesOperatingSystem()),
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
                    MaterialPageRoute(builder: (context) =>OSP()),
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


