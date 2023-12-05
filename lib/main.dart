import 'package:flutter/material.dart';
import 'package:sih_finale/classroom.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    SetMarks obj = new SetMarks();
    return MaterialApp(
        title: 'Srishti',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Classroom(
          obj: obj,
        )

        // ClassRoom(
        //   obj: obj,
        // ),
        );
  }
}

class SetMarks {
  List<String> studentList = [
    'Abhishek',
    'Bharath',
    'Chitra',
    'Darshan',
    'Gireesh',
    'Harish',
    'Lokesh',
    'Manoj',
    'Nikhil',
    'Pranav',
    'Rakesh',
    'Sahana',
    'Monisha',
    'Niha'
  ];
  List<String> usn = [
    '1BY20IS065',
    '1BY20IS066',
    '1BY20IS068',
    '1BY20IS069',
    '1BY20IS070',
    '1BY20IS071',
    '1BY20IS072',
    '1BY20IS073',
    '1BY20IS074',
    '1BY20IS075',
    '1BY20IS076',
    '1BY20IS077',
    '1BY20IS078',
    '1BY20IS079'
  ];
  int count = 0;
  var attendence = List.generate(
      10, (i) => List.filled(14, null, growable: false),
      growable: false);
  var total = new List.filled(14, 0, growable: false);
  var totalatt = new List.filled(14, 0, growable: false);
  var kan = new List.filled(14, 0, growable: false);
  var eng = new List.filled(14, 0, growable: false);
  var hin = new List.filled(14, 0, growable: false);
  var maths = new List.filled(14, 0, growable: false);
  var science = new List.filled(14, 0, growable: false);
  var social = new List.filled(14, 0, growable: false);
  var mon = new List.filled(14, 0, growable: false);
  var tues = new List.filled(14, 0, growable: false);
  var wed = new List.filled(14, 0, growable: false);
  var thr = new List.filled(14, 0, growable: false);
  var fri = new List.filled(14, 0, growable: false);
  // var social = new List.filled(14, 0, growable: false);
}
