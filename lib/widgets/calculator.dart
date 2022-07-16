// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Calculator extends StatelessWidget {
  final String text;
  final Function callback;

  const Calculator({Key? key, required this.text, required this.callback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(10.0),
        child: SizedBox(
            width: 60,
            height: 60,
            child: ElevatedButton(
                onPressed: () => callback(text),
                child: Text(
                  text,
                  style: GoogleFonts.rubik(textStyle: TextStyle(fontSize: 12)),
                ))));
  }
}
