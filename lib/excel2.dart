import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'dart:convert';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sih_finale/main.dart';
import 'package:universal_html/html.dart' show AnchorElement;
import 'dart:io';

import 'package:syncfusion_flutter_xlsio/xlsio.dart' hide Column;

class Excel2 extends StatefulWidget {
  SetMarks obj;
  Excel2({Key? key, required this.obj}) : super(key: key);

  @override
  State<Excel2> createState() => _Excel2State();
}

class _Excel2State extends State<Excel2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Excel"),
      ),
      body: Center(
        child: Column(children: [
          SizedBox(height: 50),
          GestureDetector(
            onTap: () {
              generateExcel();
            },
            child: Container(
              height: 70,
              width: 350,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color.fromARGB(255, 124, 221, 127)),
              child: Center(
                  child: Text(
                "Generate Excel",
                style: TextStyle(fontSize: 32),
              )),
            ),
          ),
        ]),
      ),
    );
  }

  void findTotal() {
    print(widget.obj.total);
    print(widget.obj.totalatt.length);
    for (int i = 0; i < widget.obj.totalatt.length; i++) {
      widget.obj.totalatt[i] = 0;
    }

    for (int i = 0; i < widget.obj.total.length; i++) {
      print(i);
      print("\n\n\n");
      print(widget.obj.total[i]);
      widget.obj.totalatt[i] += widget.obj.mon[i];

      widget.obj.totalatt[i] += widget.obj.tues[i];

      widget.obj.totalatt[i] += widget.obj.wed[i];

      widget.obj.totalatt[i] += widget.obj.thr[i];

      widget.obj.totalatt[i] += widget.obj.fri[i];
      // widget.obj.total[i] += widget.obj.maths[i];
    }
  }

  Future<void> generateExcel() async {
    final Workbook workbook = Workbook();
    final Worksheet sheet = workbook.worksheets[0];
    fillsheet('A1', 'USN', sheet);
    fillsheet('B1', 'Name', sheet);
    fillsheet('C1', 'Monday', sheet);
    fillsheet('D1', 'Tuesday', sheet);
    fillsheet('E1', 'Wednesday', sheet);
    fillsheet('F1', 'Thursday', sheet);
    fillsheet('G1', 'Friday', sheet);
    // fillsheet('H1', 'Social', sheet);
    fillsheet('H1', 'Number of classes attended', sheet);
    findTotal();
    // fillsheet('E1', 'Percentage', sheet);
    sheet.importList(widget.obj.usn, 2, 1, true);
    sheet.importList(widget.obj.studentList, 2, 2, true);
    sheet.importList(widget.obj.mon, 2, 3, true);
    sheet.importList(widget.obj.tues, 2, 4, true);
    sheet.importList(widget.obj.wed, 2, 5, true);
    sheet.importList(widget.obj.thr, 2, 6, true);
    sheet.importList(widget.obj.fri, 2, 7, true);
    sheet.importList(widget.obj.totalatt, 2, 8, true);

    // sheet.importList(widget.obj.social, 2, 8, true);
    // sheet.importList(widget.obj.total, 2, 9, true);
    for (int i = 1; i < 10; i++) {
      sheet.autoFitColumn(i);
    }
    final List<int> bytes = workbook.saveAsStream();
    workbook.dispose();
    if (kIsWeb) {
      AnchorElement(
          href:
              'data:application/octet-stream;charset=utf-16le;base64,${base64.encode(bytes)}')
        ..setAttribute('download', 'Output.xlsx')
        ..click();
    } else {
      final String path = (await getApplicationSupportDirectory()).path;
      final String fileName = '$path/Output.xlsx';
      final File file = File(fileName);
      file.writeAsBytes(bytes, flush: true);
      OpenFile.open(fileName);
    }
  }

  Future<void> fillsheet(String pos, String data, Worksheet sheet) async {
    sheet.getRangeByName(pos).setText(data);
  }
}
