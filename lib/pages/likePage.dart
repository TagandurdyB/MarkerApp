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

class LikePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaflod_all(
      body: Container(
        child: LikeBody(),
      ),
      // IsNew: true,
      //IsDiscount: true,
    );
  }
}

class LikeBody extends StatelessWidget {
  @override
  BoxShadow bowShad1(double int1) {
    return BoxShadow(
        color: Color(0xffC3C3C3),
        offset: Offset(int1, int1),
        blurRadius: 3,
        spreadRadius: 0.5);
  }

  Widget build(BuildContext context) {
    return Container(
      child: ListView(physics: BouncingScrollPhysics(), children: [
        Container(
          padding: EdgeInsets.all(screenWidth * 0.03),
          child: Row(
            children: [
              Text("Halanlarym:  ",
                  style: TextStyle(
                      fontSize: screenWidth * 0.07, fontFamily: "Arciform")),
           Icon(Icons.favorite,size: screenWidth*0.08,color: Colors.red,)
            ],
          ),
        ),
        Column(
          children: List.generate(
              MyLike.isEmpty ? 0 : MyLike.length,
              (index) => ShopProducts(
                    index: index,
                  )),
        ),
      ]),
    );
  }
}

class ShopProducts extends StatefulWidget {
  final int index;
  ShopProducts({this.index});
  // const ShopProducts({Key? key}) : super(key: key);

  @override
  State<ShopProducts> createState() => _ShopProductsState();
}

class _ShopProductsState extends State<ShopProducts> {
  int shtuk = 1;
  bool _changepai = false, _addBasket = false;

  @override
  Widget build(BuildContext context) {
    int index = widget.index;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ImgBtn(
          width: screenWidth * 0.9,
          boxShadow: BBoxSh().BBSh(),
          colors: UsesVar().IsLight()
              ? [Colors.grey[300], Colors.white]
              : [Colors.grey[800], Colors.grey[700]],
          shape: screenWidth * 0.06,
          child: Stack(
            alignment: Alignment.center,
            children:[
              Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                    width: screenWidth * 0.18,
                    child: Image.network(MyLike[index].img)),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("${shtuk} Sany "),
                    SizedBox(height: screenWidth * 0.03),
                    Text(
                      "${(MyLike[index].price * shtuk).toStringAsFixed(2)}TM",
                      style: TextStyle(
                          fontSize: screenWidth * 0.045,
                          color: UsesVar().IsLight()
                              ? Colors.green[800]
                              : Colors.green[500]),
                    ),
                    Text(
                      MyLike[index].sale == 0
                          ? ""
                          : "${((MyLike[index].old - MyLike[index].price).abs() * shtuk).toStringAsFixed(2)}TM",
                      style: TextStyle(
                        fontSize: screenWidth * 0.03,
                        color: UsesVar().IsLight()
                            ? Colors.grey[600]
                            : Colors.grey[500],
                      ),
                    ),
                    Text(
                      MyLike[index].sale == 0
                          ? ""
                          : "${(MyLike[index].old * shtuk).toStringAsFixed(2)}TM",
                      style: TextStyle(
                          fontSize: screenWidth * 0.04,
                          color: UsesVar().IsLight()
                              ? Colors.grey[700]
                              : Colors.grey[400],
                          decoration: TextDecoration.lineThrough,
                          decorationColor: Colors.black),
                    ),
                  ],
                ),
                ShtukBtn(index),
              ]),
              DelBtn(() {
               setState(() {
                 MyLike.removeWhere((element) => element.id == MyLike[index].id);
                 Provider.of<UsesVar>(context, listen: false).AddLike();
               });
              }),
            ]),
          ),
        SizedBox(height: screenWidth * 0.02),
        _addBasket
            ? ImgBtn(
                onTap: () {
                  addtime = DateTime.now().toString();
                  Provider.of<UsesVar>(context, listen: false)
                      .changeDostawka(10.0);
                  Provider.of<UsesVar>(context, listen: false).trueSepetDate();
                  Provider.of<UsesVar>(context, listen: false).AddSepet();
                  List _search;
                  _search = (MyBasket.where(
                      (element) => element.id == MyLike[index].id).toList());
                  if (_search.isEmpty) {
                    MyBasket.add(BasketElement(
                      id: MyLike[index].id,
                      num: shtuk,
                      img: MyLike[index].img,
                      price: MyLike[index].price,
                      sale: MyLike[index].sale,
                      old: MyLike[index].old,
                      ThatDate: DateTime.now().toString(),
                    ));
                  } else {
                    int _oldstuk;
                    MyBasket.removeWhere((element) =>
                        element.id == ProductsList[widget.index]["id"]);
                    _oldstuk = _search[0].num;
                    MyBasket.add(BasketElement(
                      id: MyLike[index].id,
                      num: shtuk + _oldstuk,
                      img: MyLike[index].img,
                      price: MyLike[index].price,
                      sale: MyLike[index].sale,
                      old: MyLike[index].old,
                      ThatDate: DateTime.now().toString(),
                    ));
                  }
                  MyLike.removeWhere(
                      (element) => element.id == MyLike[index].id);
                },
                width: screenWidth * 0.35,
                height: screenWidth * 0.13,
                shape: screenWidth * 0.05,
                boxShadow:BBoxSh().BBSh(),
                colors: [Colors.green[500], Colors.green[700]],
                child: Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.add_shopping_cart, size: screenWidth * 0.06),
                      SizedBox(width: screenWidth * 0.02),
                      Text(
                        "Sebede goş",
                        style: TextStyle(fontSize: screenWidth * 0.04),
                      ),
                    ],
                  ),
                ),
              )
            : Text(""),
        SizedBox(height: screenWidth * 0.02),
      ],
    );
  }

  Align DelBtn(OnTab) {
    return Align(
        alignment: Alignment.topRight,
        child: GestureDetector(
          onTap:  OnTab,
          child: Padding(
            padding: EdgeInsets.only(top: screenWidth * 0.02,right:screenWidth * 0.02 ),
            child: Icon(Icons.close,size: screenWidth*0.05,),
          ),
        ));
  }

  Padding ShtukBtn(int index) {
    return Padding(
        padding: const EdgeInsets.only(right: 15),
        child: ImgBtn(
          onTap: () {
            if (!_changepai) {
              setState(() {
                _changepai = true;
                _addBasket = true;
              });
            }
          },
          shape: 20,
          //width: screenWidth * 0.27,
          width: screenWidth * 0.24,
          height: screenWidth * 0.085,
          color: Colors.green,
          child: _changepai
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MinPlusBtn(index, false),
                    Text(
                      "${shtuk}",
                      style: TextStyle(fontSize: screenWidth * 0.045),
                    ),
                    MinPlusBtn(index, true),
                  ],
                )
              : Text(
                  "Satyn al",
                  style: TextStyle(fontSize: screenWidth * 0.05),
                ),
        ));
  }

  Padding MinPlusBtn(int index, bool isPlus) {
    return Padding(
      padding: EdgeInsets.all(screenWidth * 0.008),
      child: ImgBtn(
        onTap: () {
          setState(() {
            if (isPlus) shtuk++;
            if (shtuk > 1) {
              if (!isPlus) shtuk--;
            } else if (shtuk == 1 && !isPlus) {
              _changepai = false;
              _addBasket = false;
            }
            Provider.of<UsesVar>(context, listen: false).PPriceSum();
          });
        },
        child: Center(
            child: Text(
          isPlus ? "+" : "-",
          style: TextStyle(fontSize: screenWidth * 0.04),
        )),
        ISsCircle: true,
        color: UsesVar().IsLight() ? Colors.white : Colors.black,
        radius: screenWidth * 0.06,
      ),
    );
  }
}
