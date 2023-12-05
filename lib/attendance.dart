import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sih_finale/main.dart';
import 'package:sih_finale/operation.dart';

class Attendance extends StatefulWidget {
  SetMarks obj;
  Attendance({Key? key, required this.obj}) : super(key: key);

  @override
  State<Attendance> createState() => _AttendanceState();
}

class _AttendanceState extends State<Attendance> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Select Day"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 15,
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
                    "Monday",
                    style: TextStyle(fontSize: 32),
                  )),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => FirstPage(
                              datais: "Monday",
                              obj: widget.obj,
                            )),
                  );
                },
              ),
              SizedBox(
                height: 15,
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
                    "Tuesday",
                    style: TextStyle(fontSize: 32),
                  )),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            FirstPage(datais: "Tuesday", obj: widget.obj)),
                  );
                },
              ),
              SizedBox(
                height: 15,
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
                    "Wednesday",
                    style: TextStyle(fontSize: 32),
                  )),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            FirstPage(datais: "Wednesday", obj: widget.obj)),
                  );
                },
              ),
              SizedBox(
                height: 15,
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
                    "Thursday",
                    style: TextStyle(fontSize: 32),
                  )),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            FirstPage(datais: "Thursday", obj: widget.obj)),
                  );
                },
              ),
              SizedBox(
                height: 15,
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
                    "Friday",
                    style: TextStyle(fontSize: 32),
                  )),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            FirstPage(datais: "Friday", obj: widget.obj)),
                  );
                },
              ),
              // SizedBox(
              //   height: 15,
              // ),
              // GestureDetector(
              //   child: Container(
              //     height: 70,
              //     width: 350,
              //     decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(15),
              //         color: Color.fromARGB(255, 124, 221, 127)),
              //     child: Center(
              //         child: Text(
              //       "Social",
              //       style: TextStyle(fontSize: 32),
              //     )),
              //   ),
              //   onTap: () {
              //     Navigator.push(
              //       context,
              //       MaterialPageRoute(
              //           builder: (context) =>
              //               FirstPage(datais: "Social", obj: widget.obj)),
              //     );
              //   },
              // ),
              SizedBox(
                height: 15,
              ),
              GestureDetector(
                child: Container(
                  height: 70,
                  width: 350,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.red),
                  child: Center(
                      child: Text(
                    "Generate excel",
                    style: TextStyle(fontSize: 32),
                  )),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            FirstPage(datais: "excel2", obj: widget.obj)),
                  );
                },
              ),
              SizedBox(
                height: 15,
              ),
            ],
          ),
        ));
  }
}
