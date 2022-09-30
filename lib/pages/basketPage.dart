import 'package:flutter/material.dart';
import 'package:marketapp/widgets/imgBtn.dart';
import 'package:marketapp/widgets/newCategiries.dart';
import 'package:provider/provider.dart';
import '../Connect.dart';
import '../Public.dart';
import 'Scaffold_all.dart';
//import 'package:intl/intl.dart';

import 'oldorderPage.dart';
import 'orderPage.dart';

class BasketPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaflod_all(
      body: Container(
        child: BasketBody(),
      ),
      // IsNew: true,
      //IsDiscount: true,
    );
  }
}

class BasketBody extends StatelessWidget {
  @override

  BoxShadow bowShad1(double int1)  {return  BoxShadow(
      color: Color(0xffC3C3C3),
      offset: Offset(int1, int1),
      blurRadius: 3,
      spreadRadius: 0.5);}

  Widget build(BuildContext context) {
    return Container(
      child: ListView(physics: BouncingScrollPhysics(), children: [
        Container(
          padding: EdgeInsets.all(screenWidth * 0.03),
          child: Text("Sebedim:  ",
              style: TextStyle(
                  fontSize: screenWidth * 0.07, fontFamily: "Arciform")),
        ),
        Column(
          children: List.generate(
              MyBaskets.isEmpty ? 0 : MyBaskets.length,
              (index) => Padding(
                    padding: EdgeInsets.all(screenWidth * 0.02),
                    child: ImgBtn(
                      onTap: () {
                        Provider.of<UsesVar>(context,listen: false).oldPPriceSum(MyBaskets[index]);
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => OldOrderPage(index: index,)));
                      },
                      boxShadow: [
                        bowShad1(2),
                        bowShad1(-2),
                      ],
                      shape: screenWidth * 0.05,
                      width: screenWidth * 0.9,
                      height: screenWidth * 0.2,
                      color:
                          UsesVar().IsLight() ? Colors.white : Colors.grey[800],
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Icon(Icons.add_task),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Kabul edilen"),
                              SizedBox( height: screenWidth * 0.02  ),
                              MyBaskets[index][0].ThatDate == ""
                                  ? Text("")
                                  : Text(
                                      "${DateTime.parse(MyBaskets[index][0].ThatDate).day}.${DateTime.parse(MyBaskets[index][0].ThatDate).month}.${DateTime.parse(MyBaskets[index][0].ThatDate).year}"),
                            ],
                          ),
                          MyBaskets[index][0].ThatDate == ""
                              ? Text("")
                              : Text(
                                  "${DateTime.parse(MyBaskets[index][0].ThatDate).hour}:${DateTime.parse(MyBaskets[index][0].ThatDate).minute < 10 ?
                                  "0" + DateTime.parse(MyBaskets[index][0].ThatDate).minute.toString() :
                                  DateTime.parse(MyBaskets[index][0].ThatDate).minute}",
                                  style:
                                      TextStyle(fontSize: screenWidth * 0.05)),
                        ],
                      ),
                    ),
                  )
              //   Text("Sebedim:  ${MyBasket[index].id} ,  ${MyBasket[index].num}"),

              ),
        ),
        Padding(
          padding: EdgeInsets.all(screenWidth * 0.02),
          child: ImgBtn(
            onTap: () {
              Provider.of<UsesVar>(context,listen: false).PPriceSum();
              Provider.of<UsesVar>(context, listen: false).falseSepetDate();
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => OrderPage()));
            },
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
            shape: screenWidth * 0.05,
            width: screenWidth * 0.9,
            height: screenWidth * 0.2,
            color: UsesVar().IsLight() ? Colors.white : Colors.grey[800],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(Icons.app_registration),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Täze sargytlar"),
                    SizedBox(
                      height: screenWidth * 0.02,
                    ),
                    addtime == null
                        ? Text("")
                        : Text(
                        "${DateTime.parse(addtime).day}.${DateTime.parse(addtime).month}.${DateTime.parse(addtime).year}"),
                  ],
                ),
                addtime == null
                    ? Text("")
                    : Text(
                    "${DateTime.parse(addtime).hour}:${DateTime.parse(addtime).minute < 10 ?
                    "0" + DateTime.parse(addtime).minute.toString() :
                    DateTime.parse(addtime).minute}",
                    style:
                    TextStyle(fontSize: screenWidth * 0.05)),
              ],
            ),
          ),
        )
      ]),
    );
  }
}
