import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Public.dart';

class InCategoriScrol extends StatelessWidget {
final List list;
InCategoriScrol({@required this.list});
  @override
  Widget build(BuildContext context) {

    BoxShadow bowShad1(double int1,int index)  {return  BoxShadow(
        color: Provider.of<UsesVar>(context).selScrol() == index
            ? Color(0xFF49B34E)
            : Color(0xffC3C3C3),
        offset: Offset(int1, int1),
        blurRadius: 3,
        spreadRadius: 0.5);}

    return Container(
      height: screenWidth * 0.14,
      width: screenWidth,
      child: FractionallySizedBox(
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount:list.length ?? 0 ,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Provider.of<UsesVar>(context, listen: false)
                    .changeScrol(index,list[index]["id"]);
              },
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(screenWidth * 0.02),
                margin: EdgeInsets.all(screenWidth * 0.011),
                width: screenWidth * 0.35,
                decoration: BoxDecoration(
                  boxShadow: [
                    bowShad1(2,index),
                    bowShad1(-2,index),
                  ],
                  borderRadius: BorderRadius.circular(screenWidth * 0.06),
                  color: UsesVar().IsLight()
                      ? LightCategori
                      : DarkCategori,
                ),
                child: Text(
                  "${list[index]["name"]}",
                  style: TextStyle(
                      fontFamily: "Itim", fontSize: screenWidth * 0.032),
                  textAlign: TextAlign.center,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

