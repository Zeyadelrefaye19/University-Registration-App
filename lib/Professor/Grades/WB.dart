import 'package:flutter/material.dart';

class GradesWebProgramming extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Grades')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Table(
            border: TableBorder.all(width: 1.0, color: Colors.white),
            children: [
              TableRow(
                decoration: BoxDecoration(
                  color: Colors.grey[700],
                ),
                children: [
                  TableCell(
                    child: Center(
                      child: Text(
                        ' Name',
                        style: TextStyle(fontSize: 12, color: Colors.white),
                      ),
                    ),
                  ),
                  TableCell(
                    child: Center(
                      child: Text(
                        'ID',
                        style: TextStyle(fontSize: 12,  color: Colors.white),
                      ),
                    ),
                  ),
                  TableCell(
                    child: Center(
                      child: Text(
                        'Attendance',
                        style: TextStyle(fontSize: 8,  color: Colors.white),
                      ),
                    ),
                  ),
                  TableCell(
                    child: Center(
                      child: Text(
                        'Quiz',
                        style: TextStyle(fontSize: 12, color: Colors.white),
                      ),
                    ),
                  ),
                  TableCell(
                    child: Center(
                      child: Text(
                        'Midterm',
                        style: TextStyle(fontSize: 12,  color: Colors.white),
                      ),
                    ),
                  ),
                  TableCell(
                    child: Center(
                      child: Text(
                        'Project',
                        style: TextStyle(fontSize: 12,  color: Colors.white),
                      ),

                    ),
                  ),
                  TableCell(
                    child: Center(
                      child: Text(
                        'Final',
                        style: TextStyle(fontSize: 12,  color: Colors.white),
                      ),
                    ),
                  ),
                  TableCell(
                    child: Center(
                      child: Text(
                        'Grade',
                        style: TextStyle(fontSize: 12, color: Colors.white),
                      ),
                    ),
                  ),

                ],
              ),
              TableRow(
                children: [
                  TableCell(child: Center(child: Text('John',style: TextStyle(color: Colors.white),))),
                  TableCell(child: Center(child: Text('203050',style: TextStyle(color: Colors.white,fontSize:13),))),
                  TableCell(child: Center(child: Text('2',style: TextStyle(color: Colors.white,fontSize:13),))),
                  TableCell(child: Center(child: Text('8',style: TextStyle(color: Colors.white,fontSize:13),))),
                  TableCell(child: Center(child: Text('13',style: TextStyle(color: Colors.white,fontSize:13),))),
                  TableCell(child: Center(child: Text('57',style: TextStyle(color: Colors.white,fontSize:13),))),
                  TableCell(child: Center(child: Text('85',style: TextStyle(color: Colors.white,fontSize:13),))),
                  TableCell(child: Center(child: Text('B+',style: TextStyle(color: Colors.white,fontSize:13),))),
                ],
              ),
              TableRow(
                children: [
                  TableCell(child: Center(child: Text('Ahmed',style: TextStyle(color: Colors.white),))),
                  TableCell(child: Center(child: Text('203051',style: TextStyle(color: Colors.white,fontSize:13),))),
                  TableCell(child: Center(child: Text('3',style: TextStyle(color: Colors.white),))),
                  TableCell(child: Center(child: Text('9',style: TextStyle(color: Colors.white),))),
                  TableCell(child: Center(child: Text('8',style: TextStyle(color: Colors.white),))),
                  TableCell(child: Center(child: Text('47',style: TextStyle(color: Colors.white),))),
                  TableCell(child: Center(child: Text('90',style: TextStyle(color: Colors.white),))),
                  TableCell(child: Center(child: Text('A',style: TextStyle(color: Colors.white),))),
                ],
              ),
              TableRow(
                children: [
                  TableCell(child: Center(child: Text('Hasan',style: TextStyle(color: Colors.white,fontSize:13),))),
                  TableCell(child: Center(child: Text('203052',style: TextStyle(color: Colors.white,fontSize:13),))),
                  TableCell(child: Center(child: Text('5',style: TextStyle(color: Colors.white,fontSize:13),))),
                  TableCell(child: Center(child: Text('10',style: TextStyle(color: Colors.white,fontSize:13)))),
                  TableCell(child: Center(child: Text('15',style: TextStyle(color: Colors.white,fontSize:13)))),
                  TableCell(child: Center(child: Text('60',style: TextStyle(color: Colors.white,fontSize:13)))),
                  TableCell(child: Center(child: Text('100',style: TextStyle(color: Colors.white,fontSize:13)))),
                  TableCell(child: Center(child: Text('A',style: TextStyle(color: Colors.white,fontSize:13)))),
                ],
              ),TableRow(
                children: [
                  TableCell(child: Center(child: Text('Ali',style: TextStyle(color: Colors.white,fontSize:13)))),
                  TableCell(child: Center(child: Text('203053',style: TextStyle(color: Colors.white,fontSize:13),))),
                  TableCell(child: Center(child: Text('3',style: TextStyle(color: Colors.white,fontSize:13)))),
                  TableCell(child: Center(child: Text('7',style: TextStyle(color: Colors.white,fontSize:13)))),
                  TableCell(child: Center(child: Text('12',style: TextStyle(color: Colors.white,fontSize:13)))),
                  TableCell(child: Center(child: Text('55',style: TextStyle(color: Colors.white,fontSize:13)))),
                  TableCell(child: Center(child: Text('90',style: TextStyle(color: Colors.white,fontSize:13)))),
                  TableCell(child: Center(child: Text('C',style: TextStyle(color: Colors.white,fontSize:13)))),
                ],
              ),TableRow(
                children: [
                  TableCell(child: Center(child: Text('Ehab',style: TextStyle(color: Colors.white,fontSize:13)))),
                  TableCell(child: Center(child: Text('203054',style: TextStyle(color: Colors.white,fontSize:13),))),
                  TableCell(child: Center(child: Text('3',style: TextStyle(color: Colors.white,fontSize:13)))),
                  TableCell(child: Center(child: Text('8',style: TextStyle(color: Colors.white,fontSize:13)))),
                  TableCell(child: Center(child: Text('15',style: TextStyle(color: Colors.white,fontSize:13)))),
                  TableCell(child: Center(child: Text('55',style: TextStyle(color: Colors.white,fontSize:13)))),
                  TableCell(child: Center(child: Text('90',style: TextStyle(color: Colors.white,fontSize:13)))),
                  TableCell(child: Center(child: Text('A',style: TextStyle(color: Colors.white,fontSize:13)))),
                ],
              ),TableRow(
                children: [
                  TableCell(child: Center(child: Text('jana',style: TextStyle(color: Colors.white,fontSize:13)))),
                  TableCell(child: Center(child: Text('203055',style: TextStyle(color: Colors.white,fontSize:13),))),
                  TableCell(child: Center(child: Text('1',style: TextStyle(color: Colors.white,fontSize:13)))),
                  TableCell(child: Center(child: Text('5',style: TextStyle(color: Colors.white,fontSize:13)))),
                  TableCell(child: Center(child: Text('7',style: TextStyle(color: Colors.white,fontSize:13)))),
                  TableCell(child: Center(child: Text('20',style: TextStyle(color: Colors.white,fontSize:13)))),
                  TableCell(child: Center(child: Text('60',style: TextStyle(color: Colors.white,fontSize:13)))),
                  TableCell(child: Center(child: Text('C',style: TextStyle(color: Colors.white,fontSize:13)))),
                ],
              ),TableRow(
                children: [
                  TableCell(child: Center(child: Text('Jehad',style: TextStyle(color: Colors.white,fontSize:13)))),
                  TableCell(child: Center(child: Text('203056',style: TextStyle(color: Colors.white,fontSize:13),))),
                  TableCell(child: Center(child: Text('5',style: TextStyle(color: Colors.white,fontSize:13)))),
                  TableCell(child: Center(child: Text('10',style: TextStyle(color: Colors.white,fontSize:13)))),
                  TableCell(child: Center(child: Text('15',style: TextStyle(color: Colors.white,fontSize:13)))),
                  TableCell(child: Center(child: Text('60',style: TextStyle(color: Colors.white,fontSize:13)))),
                  TableCell(child: Center(child: Text('100',style: TextStyle(color: Colors.white,fontSize:13)))),
                  TableCell(child: Center(child: Text('A',style: TextStyle(color: Colors.white,fontSize:13)))),
                ],
              ),TableRow(
                children: [
                  TableCell(child: Center(child: Text('Jane',style: TextStyle(color: Colors.white,fontSize:13)))),
                  TableCell(child: Center(child: Text('203057',style: TextStyle(color: Colors.white,fontSize:13),))),
                  TableCell(child: Center(child: Text('4',style: TextStyle(color: Colors.white,fontSize:13)))),
                  TableCell(child: Center(child: Text('7',style: TextStyle(color: Colors.white,fontSize:13)))),
                  TableCell(child: Center(child: Text('12',style: TextStyle(color: Colors.white,fontSize:13)))),
                  TableCell(child: Center(child: Text('50',style: TextStyle(color: Colors.white,fontSize:13)))),
                  TableCell(child: Center(child: Text('75',style: TextStyle(color: Colors.white,fontSize:13)))),
                  TableCell(child: Center(child: Text('B',style: TextStyle(color: Colors.white,fontSize:13)))),
                ],
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}