import 'package:flutter/material.dart';

import '../Public.dart';
class DrawBarBtn extends StatelessWidget {
  Widget leading, title, trailing;
  double width;
  Color color;
  Function onTap;
  DrawBarBtn({this.leading, this.title, this.trailing, this.onTap,this.color=Colors.transparent,this.width=double.infinity});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap(context);
      },
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadiusDirectional.circular(screenWidth*0.03),
          color: color,
        ),
        width: width,
        padding: EdgeInsets.all(8),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(height: screenWidth*0.17,),
            Positioned(child: leading, left: 2),
            Positioned(child: title),
            Positioned(child: trailing, right: 2),
          ],
        ),
      ),
    );
  }
}