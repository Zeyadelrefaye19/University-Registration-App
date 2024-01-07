import 'package:flutter/material.dart';

import '../Add&Drop Students/AIP.dart';
import '../Grades/AI.dart';


class AiForGame  extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AiForGame Dashboard'),
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
                    MaterialPageRoute(builder: (context) =>GradesAI()),
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
                    MaterialPageRoute(builder: (context) =>AiAddP()),
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


