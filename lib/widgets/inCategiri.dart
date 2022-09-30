import 'package:flutter/material.dart';
import 'package:marketapp/pages/productPage.dart';
import 'package:provider/provider.dart';
//import 'package:untitled3/pages/categoriaPage.dart';

import '../Public.dart';
import 'imgBtn.dart';

class InCategori extends StatelessWidget {
  final int index;
  final List list;
  InCategori({@required this.index,@required this.list});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => ProductPage(index: index,list:list,),
      )),
      child: Container(
        width: screenWidth * 0.28,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          boxShadow: BBoxSh().BBSh(),
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
                  tag: "product${list[index]["id"]}",
                  child: Container(
                    width: screenWidth * 0.25,
                    height: screenWidth * 0.25,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadiusDirectional.circular(15),
                      color: Colors.white,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            "http://${IP}/files/product/${list[index]["photo"]}"),
                      ),
                    ),
                  ),
                ),
                list[index]["is_new"] == "true"
                    ? Positioned(
                        top: 0,
                        left: 0,
                        child: ImgBtn(
                          shape: screenWidth * 0.02,
                          width: null,
                          height: screenWidth * 0.04,
                          radius: screenWidth * 0.025,
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
                list[index]["sale"] == 0
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
                "${list[index]["name"]}",
                style: TextStyle(
                    // color: Colors.black,
                    fontSize: screenWidth * 0.027,
                    fontFamily: "Comfortaa"),
                textAlign: TextAlign.center,
              ),
            ), //text
            SizedBox(height: screenWidth * 0.015),
            Text(
              "${(list[index]["price"]).toStringAsFixed(2)}TM",
              style: TextStyle(fontSize: screenWidth * 0.04),
            ),
            SizedBox(height: screenWidth * 0.015),
          ],
        ),
      ),
    );
  }
}
