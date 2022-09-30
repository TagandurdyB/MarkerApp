import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marketapp/pages/basketPage.dart';
import 'package:marketapp/widgets/basket.dart';
import 'package:marketapp/widgets/imgBtn.dart';
import 'package:provider/provider.dart';
import '../Public.dart';
import 'Scaffold_all.dart';


class OldOrderPage extends StatelessWidget {
  final index;
  OldOrderPage({this.index});
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
            SizedBox(height: screenWidth * 0.05),
            Column(
              children: List.generate(
                  MyBaskets[index] == null ? 0 : MyBaskets[index].length,
                  (index1) => ShopProducts(
                        index: index,
                        index1: index1,
                        stuk: MyBaskets[index][index1].num,
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
              MyBaskets[index][0].ThatDate == null
                  ? Text("", style: text2)
                  : Text(
                      "${DateTime.parse(MyBaskets[index][0].ThatDate).day}.${DateTime.parse(MyBaskets[index][0].ThatDate).month}.${DateTime.parse(MyBaskets[index][0].ThatDate).year}   ${DateTime.parse(MyBaskets[index][0].ThatDate).hour}:${DateTime.parse(MyBaskets[index][0].ThatDate).minute < 10 ? "0" + DateTime.parse(MyBaskets[index][0].ThatDate).minute.toString() : DateTime.parse(MyBaskets[index][0].ThatDate).minute} ",
                      style: text2),
            ]),
            TableRow(children: [
              Text("Sargyt bahasy : ", style: text1),
              Text("${Provider.of<UsesVar>(context).getSum()}TM", style: text2),
            ]),
            TableRow(children: [
              Text("Dostawka bahasy : ", style: text1),
              Text("${Provider.of<UsesVar>(context).getDostavka()}TM", style: text2),
            ]),
            TableRow(children: [
              Text("Jemi : ", style: text1),
              Text("${Provider.of<UsesVar>(context).getSum()+Provider.of<UsesVar>(context).getDostavka()}TM", style: text2),
            ])
          ],
        ));
  }


}

class ShopProducts extends StatefulWidget {
  final int index,index1, stuk;
  ShopProducts({this.index,this.index1, this.stuk});
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
    int index = widget.index,
        index1 = widget.index1;
    BoxShadow bowShad1(double int1)  {return BoxShadow(
        color: Color(0xffC3C3C3),
        offset: Offset(int1, int1),
        blurRadius: 3,
        spreadRadius: 0.5);}

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ImgBtn(
          width: screenWidth * 0.9,
          boxShadow: [
            bowShad1(2),
            bowShad1(-2),
          ],
          colors: UsesVar().IsLight()
              ? [Colors.grey[300], Colors.white]
              : [Colors.grey[800], Colors.grey[700]],
          shape: screenWidth * 0.06,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                  width: screenWidth * 0.18,
                  child: Image.network(MyBaskets[index][index1].img)),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox( height: screenWidth * 0.03  ),
                  Text(
                    "${MyBaskets[index][index1].price * shtuk}TM",
                    style: TextStyle(
                        fontSize: screenWidth * 0.045,
                        color: UsesVar().IsLight() ? Colors.green[800] : Colors.green[500]),
                  ),
                  Text(
                    MyBaskets[index][index1].sale == 0
                        ? ""
                        : "${(MyBaskets[index][index1].old-MyBaskets[index][index1].price).abs() * shtuk}TM",
                    style: TextStyle(
                        fontSize: screenWidth*0.03,
                        color: UsesVar().IsLight()?Colors.grey[600]:Colors.grey[500],
                        ),
                  ),
                  Text(
                    MyBaskets[index][index1].sale == 0
                        ? ""
                        : "${MyBaskets[index][index1].old * shtuk}TM",
                    style: TextStyle(
                      fontSize: screenWidth*0.04,
                        color: UsesVar().IsLight()?Colors.grey[700]:Colors.grey[400],
                        decoration: TextDecoration.lineThrough,
                        decorationColor: Colors.black),
                  ),
                ],
              ),
              Text("${shtuk} Sany ",style: TextStyle(fontSize: screenWidth*0.05),),
            ],
          ),
        ),
        SizedBox(height: screenWidth * 0.05),
      ],
    );
  }

}
