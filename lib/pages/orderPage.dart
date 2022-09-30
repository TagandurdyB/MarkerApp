import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marketapp/pages/basketPage.dart';
import 'package:marketapp/widgets/basket.dart';
import 'package:marketapp/widgets/imgBtn.dart';
import 'package:provider/provider.dart';
import '../Public.dart';
import 'Scaffold_all.dart';


class OrderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaflod_all(
      body: Container(
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            Container(
                padding: EdgeInsets.all(screenWidth * 0.03),
                child: Icon(
                  Icons.account_box_outlined,
                  size: screenWidth * 0.3,
                )),
            SizedBox(height: screenWidth * 0.05),
            MyTable(context),
            TassykBtn(context),
            Column(
              children: List.generate(
                  MyBasket == null ? 0 : MyBasket.length,
                  (index) => ShopProducts(
                        index: index,
                        stuk: MyBasket[index].num,
                      )),
            ),
          ],
        ),
      ),
    );
  }

  Container MyTable(BuildContext context) {
    TextStyle text1 = TextStyle(fontSize: screenWidth * 0.05),
        text2 = TextStyle(fontSize: screenWidth * 0.043);
    return Container(
        width: screenWidth * 0.8,
        padding: EdgeInsets.only(left: screenWidth * 0.13),
        child: Table(
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          children: [
            TableRow(children: [
              Text("Sene : ", style: text1),
              addtime == null
                  ? Text("", style: text2)
                  : Text(
                      "${DateTime.parse(addtime).day}.${DateTime.parse(addtime).month}.${DateTime.parse(addtime).year}   ${DateTime.parse(addtime).hour}:${DateTime.parse(addtime).minute < 10 ? "0" + DateTime.parse(addtime).minute.toString() : DateTime.parse(addtime).minute} ",
                      style: text2),
            ]),
            TableRow(children: [
              Text("Sargyt bahasy : ", style: text1),
              Text("${(Provider.of<UsesVar>(context).getSum().toStringAsFixed(2))}TM", style: text2),
            ]),
            TableRow(children: [
              Text("Dostawka bahasy : ", style: text1),
              Text("${(Provider.of<UsesVar>(context).getDostavka().toStringAsFixed(2))}TM", style: text2),
            ]),
            TableRow(children: [
              Text("Jemi : ", style: text1),
              Text("${(Provider.of<UsesVar>(context).getSum()+Provider.of<UsesVar>(context).getDostavka()).toStringAsFixed(2)}TM", style: text2),
            ])
          ],
        ));
  }

  Container TassykBtn(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(
          left: screenWidth * 0.3,
          right: screenWidth * 0.3,
          top: screenWidth * 0.08,
          bottom: screenWidth * 0.05,
        ),
        child: ImgBtn(
          onTap: () {
            MyBasket.isEmpty
                ? print("empety")
                : showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return CupertinoAlertDialog(
                        title: Center(child: Text(" Matket App ")),
                        content: Text(
                          "Sargytlaryňyzy tassyklansynmy?",
                          textAlign: TextAlign.center,

                        ),
                        actions: [
                          FlatButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text("Yatyr")),
                          FlatButton(
                              onPressed: () {
                                MyBaskets.add(MyBasket);
                                MyBasket=[];
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => BasketPage()));
                              },
                              child: Text("Tassykla"))
                        ],
                      );
                    });
          },
          colors: MyBasket.isEmpty
              ? [Colors.grey[500], Colors.grey[600]]
              : [Colors.green[500], Colors.green[700]],
          width: screenWidth * 0.2,
          height: screenWidth * 0.1,
          shape: screenWidth * 0.07,
          child: Text("Sargytlarymy tassykla",style: TextStyle(color: Colors.white),),
        ),
      ),
    );
  }
}

class ShopProducts extends StatefulWidget {
  final int index, stuk;
  ShopProducts({this.index, this.stuk});
  // const ShopProducts({Key? key}) : super(key: key);

  @override
  State<ShopProducts> createState() => _ShopProductsState(shtuk: stuk);
}

class _ShopProductsState extends State<ShopProducts> {
  int shtuk;
  bool _changepai = true;
  _ShopProductsState({this.shtuk = 0});
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
          child:Stack(
              alignment: Alignment.center,
              children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                    width: screenWidth * 0.18,
                    child: Image.network(MyBasket[index].img)),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("${shtuk} Sany "),
                    SizedBox( height: screenWidth * 0.03  ),
                    Text(
                      "${(MyBasket[index].price * shtuk).toStringAsFixed(2)}TM",
                      style: TextStyle(
                          fontSize: screenWidth * 0.045,
                          color: UsesVar().IsLight() ? Colors.green[800] : Colors.green[500]),
                    ),
                    Text(
                      MyBasket[index].sale == 0
                          ? ""
                          : "${((MyBasket[index].old-MyBasket[index].price).abs() * shtuk).toStringAsFixed(2)}TM",
                      style: TextStyle(
                        fontSize: screenWidth*0.03,
                        color: UsesVar().IsLight()?Colors.grey[600]:Colors.grey[500],
                      ),
                    ),
                    Text(
                      MyBasket[index].sale == 0
                          ? ""
                          : "${(MyBasket[index].old * shtuk).toStringAsFixed(2)}TM",
                      style: TextStyle(
                          fontSize: screenWidth*0.04,
                          color: UsesVar().IsLight()?Colors.grey[700]:Colors.grey[400],
                          decoration: TextDecoration.lineThrough,
                          decorationColor: Colors.black),
                    ),
                  ],
                ),
                ShtukBtn(index),
              ]),
              DelBtn(index, context),
          ]),
        ),
        SizedBox(height: screenWidth * 0.05),
      ],
    );
  }

  Align DelBtn(int index, BuildContext context) {
    return Align(
                alignment: Alignment.topRight,
                child:  GestureDetector(
                  onTap: (){
                    setState(() {
                      MyBasket.removeWhere((element) =>
                      element.id == MyBasket[index].id);
                      Provider.of<UsesVar>(context,listen: false).PPriceSum();
                    });
                  },
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
          shape: 20,
          //width: screenWidth * 0.27,
          width: screenWidth * 0.24,
          height: screenWidth * 0.085,
          color:Colors.green,
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
              MyBasket[index] = BasketElement(
                  num: shtuk,
                  old: MyBasket[index].old,
                  sale: MyBasket[index].sale,
                  price: MyBasket[index].price,
                  img: MyBasket[index].img,
                  id: MyBasket[index].id,
                ThatDate: DateTime.now().toString());
            }
            Provider.of<UsesVar>(context,listen: false).PPriceSum();
          });
        },
        child: Center(
            child: Text(
          isPlus ? "+" : "-",
          style: TextStyle(fontSize: screenWidth * 0.04),
        )),
        ISsCircle: true,
      color:UsesVar().IsLight()?Colors.white:Colors.black,
        radius: screenWidth * 0.06,
      ),
    );
  }
}
