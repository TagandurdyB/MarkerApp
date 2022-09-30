import 'package:flutter/material.dart';
import 'package:marketapp/pages/categoriaPage.dart';
import 'package:provider/provider.dart';
import '../Public.dart';

class Categori extends StatelessWidget {
  int index;
  Categori(
      { @required this.index});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        /////
        Provider.of<UsesVar>(context, listen: false)
            .changeScrol(0, CategoriesList[index]["incategory"][0]["id"]);
        /////
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => CategoriaPage(index: index)),
        );
      },
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
            Container(
              width: screenWidth * 0.25,
              height: screenWidth * 0.20,
              // margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.circular(15),
                // color: Colors.red,
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                      "http://${IP}/files/category/${CategoriesList[index]["img"]}"),
                ),
                //  child: Text("salam"),
              ),
            ), //image
            SizedBox(height: screenWidth * 0.006),
            Container(
              alignment: Alignment.center,
              width: screenWidth * 0.26,
              //height: screenWidth * 0.1,
              //       color: Colors.red,
              //   margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: Text(
                "${CategoriesList[index]["name"]} ",
                style: TextStyle(
                    // color: Colors.black,
                    fontSize: screenWidth * 0.027,
                    fontFamily: "Comfortaa"),
                textAlign: TextAlign.center,
              ),
            ), //text
            SizedBox(height: screenWidth * 0.015),
          ],
        ),
      ),
    );
  }
}
