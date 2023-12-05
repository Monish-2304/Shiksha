import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sih_finale/main.dart';

import 'datatype.dart';

class Classroom extends StatefulWidget {
  SetMarks obj;
  Classroom({Key? key, required this.obj}) : super(key: key);

  @override
  State<Classroom> createState() => _ClassroomState();
}

class _ClassroomState extends State<Classroom> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Classroon"),
      ),
      body: Column(
        children: [
          Container(
            height: 80,
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
                "Class 10th",
                style: TextStyle(fontSize: 32),
              )),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DataType(
                          obj: widget.obj,
                        )),
              );
            },
          )
        ],
      ),
    );
  }
}
