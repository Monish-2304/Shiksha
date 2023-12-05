import 'dart:convert';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:universal_html/html.dart' show AnchorElement;
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sih_finale/main.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart' hide Column;

import 'classroom.dart';

class Excel extends StatefulWidget {
  SetMarks obj;
  Excel({Key? key, required this.obj}) : super(key: key);

  @override
  State<Excel> createState() => _ExcelState();
}

class _ExcelState extends State<Excel> {
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
    print(widget.obj.total.length);
    for (int i = 0; i < widget.obj.total.length; i++) {
      widget.obj.total[i] = 0;
    }

    for (int i = 0; i < widget.obj.total.length; i++) {
      print(i);
      print("\n\n\n");
      print(widget.obj.total[i]);
      widget.obj.total[i] += widget.obj.kan[i];

      widget.obj.total[i] += widget.obj.eng[i];

      widget.obj.total[i] += widget.obj.hin[i];

      widget.obj.total[i] += widget.obj.science[i];

      widget.obj.total[i] += widget.obj.social[i];
      widget.obj.total[i] += widget.obj.maths[i];
    }
  }

  Future<void> generateExcel() async {
    final Workbook workbook = Workbook();
    final Worksheet sheet = workbook.worksheets[0];
    fillsheet('A1', 'USN', sheet);
    fillsheet('B1', 'Name', sheet);
    fillsheet('C1', 'Kannada', sheet);
    fillsheet('D1', 'English', sheet);
    fillsheet('E1', 'Hindi', sheet);
    fillsheet('F1', 'Maths', sheet);
    fillsheet('G1', 'Science', sheet);
    fillsheet('H1', 'Social', sheet);
    fillsheet('I1', 'Total', sheet);
    findTotal();
    // fillsheet('E1', 'Percentage', sheet);
    sheet.importList(widget.obj.usn, 2, 1, true);
    sheet.importList(widget.obj.studentList, 2, 2, true);
    sheet.importList(widget.obj.kan, 2, 3, true);
    sheet.importList(widget.obj.eng, 2, 4, true);
    sheet.importList(widget.obj.hin, 2, 5, true);
    sheet.importList(widget.obj.maths, 2, 6, true);
    sheet.importList(widget.obj.science, 2, 7, true);
    sheet.importList(widget.obj.social, 2, 8, true);
    sheet.importList(widget.obj.total, 2, 9, true);
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
