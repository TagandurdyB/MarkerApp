import 'package:flutter/material.dart';
import 'package:marketapp/widgets/carousel_slider.dart';
import 'package:marketapp/widgets/categiries.dart';
import 'package:marketapp/widgets/treeBtn.dart';
//import 'package:untitled3/widgets/carousel_pro.dart';
//import 'package:untitled3/widgets/slider.dart';
import '../Public.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    //IsSearch=false;
    return ListView(physics: BouncingScrollPhysics(), children: [
      //Slider_rek(),
      MySlider(),
      TreeBtn(),
      Container(
        padding: EdgeInsets.all(screenWidth * 0.03),
        width: screenWidth,
        child: Text(
          "Bölümler:",
          style:
              TextStyle(fontSize: screenWidth * 0.07, fontFamily: "Arciform"),
        ),
      ),
      Container(
          // color: Colors.white,
          child: Categories()),
    ]);
  }
}
