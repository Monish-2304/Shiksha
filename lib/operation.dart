import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sih_finale/excel.dart';
import 'package:sih_finale/excel2.dart';
import 'package:sih_finale/main.dart';

class FirstPage extends StatefulWidget {
  final String datais;
  SetMarks obj;
  FirstPage({Key? key, required this.obj, required this.datais})
      : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
//   var kan = new List.filled(14, 0, growable: false);
//   var eng = new List.filled(14, 0, growable: false);
//   var hin = new List.filled(14, 0, growable: false);
  var maths = new List.filled(14, 0, growable: false);
  var att = new List.filled(14, 0, growable: false);
  // var science = new List.filled(14, 0, growable: false);
  // var social = new List.filled(14, 0, growable: false);

  var twoDList = List.generate(5, (i) => List.filled(15, -1, growable: false),
      growable: false);
  int? _flag = 0;
  // final textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);

  File? _image;

  RecognizedText? _extractedData;

  Future processdata(String path) async {
    final inputImage = InputImage.fromFilePath(path);
    final textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);
    final RecognizedText recognizedText =
        await textRecognizer.processImage(inputImage);
    _extractedData = recognizedText;
    print("number ofblocks\n\n\n\n");
    print(recognizedText.blocks.length);
    // if (recognizedText.blocks.length == 30) {
    //   _flag = 1;
    // }

    // print("\n\n\n\n\n\n\n\n\n\n\n\nn\dfsfsfsdfdsfdsfsd\n\n");
    // print(recognizedText.text);
    print("output\n\n\n");
    // print("\n\n\n\n\n\n\n\n\n\n\n\nn\dfsfsfsdfdsfdsfsdblock\n\n");
    // print(recognizedText.blocks.length);
    for (TextBlock block in recognizedText.blocks) {
      print(block.text);
      // final Rect rect = block.rect;
      // final List<Offset> cornerPoints = block.cornerPoints;
      final String text = block.text;
      // print(twoDList);
      // print(text);
      // print("nw\n");
      // final List<String> languages = block.recognizedLanguages;

      for (TextLine line in block.lines) {
        // Same getters as TextBlock
        for (TextElement element in line.elements) {
          // Same getters as TextBlock
        }
      }
    }
  }

  Future getImage({required source}) async {
    final image = await ImagePicker().pickImage(source: source);
    if (image == null) return;

    final imageTemporary = File(image.path);
    setState(() {
      this._image = imageTemporary;
      processdata(imageTemporary.path);

      // final inputImage = InputImage.fromFilePath(image.path);
      // processdata(inputimage: inputImage);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.datais == "excel") {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (_) => Excel(
                      obj: widget.obj,
                    )));
      });
    }
    // print(kan);
    if (widget.datais == "excel2") {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (_) => Excel2(
                      obj: widget.obj,
                    )));
      });
    }
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.datais),
        ),
        body: Center(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              _image != null
                  ? Image.file(
                      _image!,
                      width: 250,
                      height: 250,
                      fit: BoxFit.cover,
                    )
                  : Image.network('https://picsum.photos/250?image=9'),
              SizedBox(
                height: 40,
              ),
              CustomButton(
                  title: 'Pick from Gallery',
                  icon: Icons.image_outlined,
                  onClick: () {
                    getImage(source: ImageSource.gallery);
                  }),
              SizedBox(
                height: 25,
              ),
              CustomButton(
                  title: 'Pick from Camera',
                  icon: Icons.camera,
                  onClick: () {
                    getImage(source: ImageSource.camera);
                  }),
              SizedBox(
                height: 25,
              ),
              CustomButton(
                  title: 'Process Data',
                  icon: Icons.computer,
                  onClick: () {
                    processdata1();
                  }),
            ],
          ),
        ));
  }

  void processdata1() {
    var k = 0;
    int temp = 0, temp1 = 0;
    if (widget.datais == "Monday" ||
        widget.datais == "Tuesday" ||
        widget.datais == "Wednesday" ||
        widget.datais == "Thursday" ||
        widget.datais == "Friday") {
      print(_extractedData!.text);
      for (int x = 16; x < 30; x++) {
        // print(_extractedData?.blocks[x].text);
        try {
          if (_extractedData!.blocks[x].text[0] == 'A' ||
              _extractedData!.blocks[x].text[0] == 'a' ||
              _extractedData!.blocks[x].text[0] == Text("A"))
            temp = 0;
          else
            temp = 1;
          // temp1 = int.parse(_extractedData!.blocks[x].text[1]);
        } catch (e) {
          // print(x);
          temp = 1;
        }
        // int res = temp * 10 + temp1;
        att[k++] = temp;
      }

      print("attendance output");
      print(att);
      print(widget.datais);
      if (widget.datais == "Monday") {
        widget.obj.mon = att;
      } else if (widget.datais == "Tuesday") {
        widget.obj.tues = att;
      } else if (widget.datais == "Wednesday") {
        widget.obj.wed = att;
      } else if (widget.datais == "Thursday") {
        widget.obj.thr = att;
      } else if (widget.datais == "Friday") {
        widget.obj.fri = att;
      }
    } else {
      print(_extractedData!.text);
      for (int x = 16; x < 30; x++) {
        // print(_extractedData?.blocks[x].text);
        try {
          temp = int.parse(_extractedData!.blocks[x].text[0]);
          temp1 = int.parse(_extractedData!.blocks[x].text[1]);
        } catch (e) {
          print(x);
          print(e);
        }
        int res = temp * 10 + temp1;
        maths[k++] = res;
      }
      print(maths);
      print(widget.datais);
      if (widget.datais == "kannada") {
        print("object knnn");
        widget.obj.kan = maths;
      } else if (widget.datais == "English") {
        widget.obj.eng = maths;
      } else if (widget.datais == "Hindi") {
        widget.obj.hin = maths;
      } else if (widget.datais == "Maths") {
        widget.obj.maths = maths;
      } else if (widget.datais == "Science") {
        widget.obj.science = maths;
      } else if (widget.datais == "Social") {
        widget.obj.social = maths;
      } else if (widget.datais == "Monday") {
        widget.obj.eng = att;
      } else if (widget.datais == "Tuesday") {
        widget.obj.hin = att;
      } else if (widget.datais == "Wednesday") {
        widget.obj.maths = att;
      } else if (widget.datais == "Thursday") {
        widget.obj.science = att;
      } else if (widget.datais == "Friday") {
        widget.obj.social = att;
      }
    }
    //  else if (widget.datais == "Kannada") {
    //   print(_extractedData!.text);
    //   for (int x = 16; x < 30; x++) {
    //     print(_extractedData?.blocks[x].text);
    //     try {
    //       temp = int.parse(_extractedData!.blocks[x].text[0]);
    //       temp1 = int.parse(_extractedData!.blocks[x].text[1]);
    //     } catch (e) {
    //       print(x);
    //       print(e);
    //     }
    //     int res = temp * 10 + temp1;
    //     kan[k++] = res;
    //   }
    //   print(kan);
    // } else if (widget.datais == "English") {
    //   print(_extractedData!.text);
    //   for (int x = 16; x < 30; x++) {
    //     print(_extractedData?.blocks[x].text);
    //     try {
    //       temp = int.parse(_extractedData!.blocks[x].text[0]);
    //       temp1 = int.parse(_extractedData!.blocks[x].text[1]);
    //     } catch (e) {
    //       print(x);
    //       print(e);
    //     }
    //     int res = temp * 10 + temp1;
    //     eng[k++] = res;
    //   }
    //   print(eng);
    // } else if (widget.datais == "Hindi") {
    //   print(_extractedData!.text);
    //   for (int x = 16; x < 30; x++) {
    //     print(_extractedData?.blocks[x].text);
    //     try {
    //       temp = int.parse(_extractedData!.blocks[x].text[0]);
    //       temp1 = int.parse(_extractedData!.blocks[x].text[1]);
    //     } catch (e) {
    //       print(x);
    //       print(e);
    //     }
    //     int res = temp * 10 + temp1;
    //     hin[k++] = res;
    //   }
    //   // print(marks);
    // } else if (widget.datais == "Science") {
    //   print(_extractedData!.text);
    //   for (int x = 16; x < 30; x++) {
    //     print(_extractedData?.blocks[x].text);
    //     try {
    //       temp = int.parse(_extractedData!.blocks[x].text[0]);
    //       temp1 = int.parse(_extractedData!.blocks[x].text[1]);
    //     } catch (e) {
    //       print(x);
    //       print(e);
    //     }
    //     int res = temp * 10 + temp1;
    //     science[k++] = res;
    //   }
    //   print(science);
    // } else if (widget.datais == "Social") {
    //   print(_extractedData!.text);
    //   for (int x = 16; x < 30; x++) {
    //     print(_extractedData?.blocks[x].text);
    //     try {
    //       temp = int.parse(_extractedData!.blocks[x].text[0]);
    //       temp1 = int.parse(_extractedData!.blocks[x].text[1]);
    //     } catch (e) {
    //       print(x);
    //       print(e);
    //     }
    //     int res = temp * 10 + temp1;
    //     social[k++] = res;
    //   }
    //   print(social);
    // }
  }
}

Widget CustomButton({
  required String title,
  required IconData icon,
  required VoidCallback onClick,
}) {
  return Container(
    width: 200,
    child: ElevatedButton(
      onPressed: onClick,
      child: Row(
        children: [
          Icon(icon),
          SizedBox(
            width: 20,
          ),
          Text(title)
        ],
      ),
    ),
  );
}
