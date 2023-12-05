import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sih_finale/main.dart';
import 'package:sih_finale/operation.dart';

class Subject extends StatefulWidget {
  SetMarks obj;
  Subject({Key? key, required this.obj}) : super(key: key);

  @override
  State<Subject> createState() => _SubjectState();
}

class _SubjectState extends State<Subject> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Subjects"),
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
                    "Kannada",
                    style: TextStyle(fontSize: 32),
                  )),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => FirstPage(
                              datais: "kannada",
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
                    "English",
                    style: TextStyle(fontSize: 32),
                  )),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            FirstPage(datais: "English", obj: widget.obj)),
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
                    "Hindi",
                    style: TextStyle(fontSize: 32),
                  )),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            FirstPage(datais: "Hindi", obj: widget.obj)),
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
                    "Maths",
                    style: TextStyle(fontSize: 32),
                  )),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            FirstPage(datais: "Maths", obj: widget.obj)),
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
                    "Science",
                    style: TextStyle(fontSize: 32),
                  )),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            FirstPage(datais: "Science", obj: widget.obj)),
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
                    "Social",
                    style: TextStyle(fontSize: 32),
                  )),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            FirstPage(datais: "Social", obj: widget.obj)),
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
                            FirstPage(datais: "excel", obj: widget.obj)),
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
