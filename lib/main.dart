// ignore_for_file: prefer_const_constructors

import 'package:calculator/widgets/calculator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late int fnum;
  late int snum;
  late String history = '';
  late String texttodisplay = '';
  late String res;
  late String operations;

  void btnonclick(String btnval) {
    if (btnval == 'C') {
      texttodisplay = '';
      fnum = 0;
      snum = 0;
      res = '';
    } else if (btnval == 'AC') {
      texttodisplay = '';
      fnum = 0;
      snum = 0;
      res = '';
      history = '';
    } else if (btnval == '+' ||
        btnval == '-' ||
        btnval == 'X' ||
        btnval == '/') {
      fnum = int.parse(texttodisplay);
      res = '';
      operations = btnval;
    } else if (btnval == '=') {
      snum = int.parse(texttodisplay);
      if (operations == '+') {
        res = (fnum + snum).toString();
        history = fnum.toString() + operations.toString() + snum.toString();
      } else if (operations == '-') {
        res = (fnum - snum).toString();
        history = fnum.toString() + operations.toString() + snum.toString();
      } else if (operations == 'X') {
        res = (fnum * snum).toString();
        history = fnum.toString() + operations.toString() + snum.toString();
      } else if (operations == '/') {
        res = (fnum / snum).toString();
        history = fnum.toString() + operations.toString() + snum.toString();
      }
    } else {
      res = int.parse(texttodisplay + btnval).toString();
    }

    setState(() {
      texttodisplay = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 77, 112, 126),
        appBar: AppBar(
          title: Text("Calculator"),
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                child: Padding(
                    padding: EdgeInsets.all(12),
                    child: Text(history,
                        style: GoogleFonts.rubik(
                            textStyle: TextStyle(fontSize: 35)))),
                alignment: Alignment(1.0, 1.0),
              ),
              Container(
                child: Padding(
                    padding: EdgeInsets.all(12),
                    child: Text(texttodisplay,
                        style: GoogleFonts.rubik(
                            textStyle: TextStyle(fontSize: 35)))),
                alignment: Alignment(1.0, 1.0),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Calculator(text: 'AC', callback: btnonclick),
                  Calculator(text: 'C', callback: btnonclick),
                  Calculator(text: '<', callback: btnonclick),
                  Calculator(text: '/', callback: btnonclick),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Calculator(text: '9', callback: btnonclick),
                  Calculator(text: '8', callback: btnonclick),
                  Calculator(text: '7', callback: btnonclick),
                  Calculator(text: 'X', callback: btnonclick),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Calculator(text: '6', callback: btnonclick),
                  Calculator(text: '5', callback: btnonclick),
                  Calculator(text: '4', callback: btnonclick),
                  Calculator(text: '-', callback: btnonclick),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Calculator(text: '3', callback: btnonclick),
                  Calculator(text: '2', callback: btnonclick),
                  Calculator(text: '1', callback: btnonclick),
                  Calculator(text: '+', callback: btnonclick),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Calculator(text: '+/-', callback: btnonclick),
                  Calculator(text: '0', callback: btnonclick),
                  Calculator(text: '00', callback: btnonclick),
                  Calculator(text: '=', callback: btnonclick),
                ],
              ),
            ],
          ),
        ),
      ),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
