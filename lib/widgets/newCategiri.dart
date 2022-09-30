import 'package:flutter/material.dart';
import 'package:marketapp/pages/productPage.dart';
//import 'package:untitled3/pages/categoriaPage.dart';
import '../Public.dart';
import 'imgBtn.dart';

class NewCategori extends StatelessWidget {
  final int index;
  NewCategori({@required this.index});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => ProductPage(index: index,list: NewList,),
      )),
      child: Container(
        width: screenWidth * 0.28,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Color(0xffC3C3C3),
                offset: Offset(2, 2),
                blurRadius: 3,
                spreadRadius: 0.5),
            BoxShadow(
                color: Color(0xffC3C3C3),
                offset: Offset(-2, -2),
                blurRadius: 3,
                spreadRadius: 0.5),
          ],
          shape: BoxShape.rectangle,
          borderRadius: BorderRadiusDirectional.circular(20),
          color: UsesVar().IsLight() ? LightCategori : DarkCategori,
        ),
        child: Column(
          children: [
            SizedBox(height: screenWidth * 0.015),
            Stack(
              children: [
                Hero(
                  tag: "product${NewList[index]["id"]}",
                  child: Container(
                    width: screenWidth * 0.25,
                    height: screenWidth * 0.25,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadiusDirectional.circular(15),
                      color: Colors.white,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            "http://${IP}/files/product/${NewList[index]["photo"]}"),
                      ),
                    ),
                    //  child: Container(
                    //   child: FittedBox(
                    //    fit: BoxFit.fitWidth,
                    // child: Image.asset(image,)//),
                    // ),
                  ),
                ),
                NewList[index]["is_new"] == "true"
                    ? Positioned(
                        top: 0,
                        left: 0,
                        child: ImgBtn(
                          shape: screenWidth * 0.02,
                          height: screenWidth * 0.04,
                          width: null,
                          color: Colors.green,
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: screenWidth * 0.01,
                                right: screenWidth * 0.01),
                            child: Text(
                              "TÄZE",
                              style: TextStyle(
                                  fontSize: screenWidth * 0.02,
                                  fontFamily: "Itim",
                                  color: Colors.white),
                            ),
                          ),
                        ))
                    : Text(""),
                NewList[index]["sale"] == 0
                    ? Text("")
                    : Positioned(
                        top: 0,
                        right: 0,
                        child: CircleAvatar(
                          backgroundColor: Colors.red,
                          radius: screenWidth * 0.025,
                          child: Text(
                            "%",
                            style: TextStyle(color: Colors.white),
                          ),
                        ))
                // Container(width: 20,height: 20,color: Colors.red,),
              ],
            ),
            Container(
              padding: EdgeInsets.only(top: screenWidth * 0.015),
              alignment: Alignment.center,
              width: screenWidth * 0.26,
              //height: screenWidth * 0.1,
              //       color: Colors.red,
              //   margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: Text(
                "${NewList[index]["name"]}",
                style: TextStyle(
                    // color: Colors.black,
                    fontSize: screenWidth * 0.027,
                    fontFamily: "Comfortaa"),
                textAlign: TextAlign.center,
              ),
            ), //text
            SizedBox(height: screenWidth * 0.015),
            Text(
              "${NewList[index]["price"].toString()}TM",
              style: TextStyle(fontSize: screenWidth * 0.04),
            ),
            SizedBox(height: screenWidth * 0.015),
          ],
        ),
      ),
    );
  }
}
