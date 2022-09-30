import '../Public.dart';
import 'package:flutter/material.dart';

import 'imgBtn.dart';

class MinusPlus extends StatefulWidget {
  @override
  _MinusPlusState createState() => _MinusPlusState();
}

class _MinusPlusState extends State<MinusPlus> {
  int _shtuk = 1;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ImgBtn(
            width: screenWidth * 0.08,
            height: screenWidth * 0.08,
            colors: [Colors.blue, Colors.white],
            shape: 5,
            onTap: () {
              setState(() {
                if (_shtuk > 1) _shtuk--;
              });
            },
            child: Icon(Icons.exposure_minus_1)),
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: ImgBtn(
                width: screenWidth * 0.1,
                height: screenWidth * 0.1,
                colors: [Colors.orange, Colors.green],
                shape: 5,
                child: Text(
                  "$_shtuk",
                  style: TextStyle(fontSize: 30),
                ))),
        ImgBtn(
            width: screenWidth * 0.08,
            height: screenWidth * 0.08,
            colors: [Colors.blue, Colors.white],
            shape: 5,
            onTap: () {
              setState(() {
                _shtuk++;
              });
            },
            child: Icon(Icons.plus_one))
      ],
    );
  }
}
