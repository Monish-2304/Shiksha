import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sih_finale/attendance.dart';
import 'package:sih_finale/main.dart';
import 'package:sih_finale/operation.dart';
import 'package:sih_finale/select_subject.dart';

class DataType extends StatefulWidget {
  SetMarks obj;
  DataType({Key? key, required this.obj}) : super(key: key);

  @override
  State<DataType> createState() => _DataTypeState();
}

class _DataTypeState extends State<DataType> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Classroon"),
      ),
      body: Column(
        children: [
          Container(
            height: 75,
          ),
          GestureDetector(
            child: Container(
              height: 70,
              width: 350,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color.fromARGB(255, 124, 221, 127)),
              child: Center(
                  child: Text(
                "Marks",
                style: TextStyle(fontSize: 32),
              )),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Subject(obj: widget.obj)),
              );
            },
          ),
          SizedBox(
            height: 100,
          ),
          GestureDetector(
            child: Container(
              height: 70,
              width: 350,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color.fromARGB(255, 124, 221, 127)),
              child: Center(
                  child: Text(
                "Attendance",
                style: TextStyle(fontSize: 32),
              )),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Attendance(obj: widget.obj)),
              );
            },
          )
        ],
      ),
    );
  }
}
