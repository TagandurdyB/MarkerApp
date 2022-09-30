import 'package:flutter/material.dart';
import 'package:marketapp/widgets/minus_plus.dart';
import 'package:provider/provider.dart';
import '../Public.dart';
import 'imgBtn.dart';

class BasketWidget extends StatefulWidget {
  final bool IsEnableDel, IsEnableBasket,IsEnablePeai,IsEnableShtukBtn;
  final int index,SShtuk;
  final List list;
  final DelFunc,MinusPlusFunc;
  final String imgUrl;
  BasketWidget(
      {@required this.index,
      @required this.list,
      this.IsEnableDel = false,
      @required this.DelFunc,
      this.IsEnableBasket = false,
      this.IsEnablePeai = true,
      this.MinusPlusFunc,
      this.IsEnableShtukBtn=true,
      this.SShtuk=1,
      this.imgUrl});
  @override
  State<BasketWidget> createState() => _BasketWidgetState(shtuk: SShtuk);
}

class _BasketWidgetState extends State<BasketWidget> {
  int shtuk;
  _BasketWidgetState({this.shtuk});
  bool _shtukEnable = false, _addBasket = false;
  @override
  Widget build(BuildContext context) {
    String image =
        "http://${IP}/files/product/${widget.list[widget.index]["photo"]}";
    double old=(widget.list[widget.index]["old"]==null?0.0:widget.list[widget.index]["old"]+0.0),
        price=(widget.list[widget.index]["price"]==null?0.0:widget.list[widget.index]["price"]+0.0);

    return Padding(
      padding: EdgeInsets.only(left: screenWidth * 0.05),
      child: Column(
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
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: screenWidth * 0.18,
                    child: Image.network(image),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      widget.IsEnableShtukBtn?Text("${shtuk} Sany "):Container(),
                      SizedBox(height: screenWidth * 0.03),
                      Text(
                        "${(price * shtuk).toStringAsFixed(2)}TM",
                        style: TextStyle(
                            fontSize: screenWidth * 0.045,
                            color: UsesVar().IsLight()
                                ? Colors.green[800]
                                : Colors.green[500]),
                      ),
                      Text(
                        widget.list[widget.index]["sale"] == 0
                            ? ""
                            : "${((widget.list[widget.index]["old"] - widget.list[widget.index]["sale"]).abs() * shtuk).toStringAsFixed(2)}TM",
                        style: TextStyle(
                          fontSize: screenWidth * 0.03,
                          color: UsesVar().IsLight()
                              ? Colors.grey[600]
                              : Colors.grey[500],
                        ),
                      ),
                      Text(
                        widget.list[widget.index]["sale"] == 0
                            ? ""
                            : "${(widget.list[widget.index]["old"] * shtuk).toStringAsFixed(2)}TM",
                        style: TextStyle(
                            fontSize: screenWidth * 0.04,
                            color: UsesVar().IsLight()
                                ? Colors.grey[700]
                                : Colors.grey[400],
                            decoration: TextDecoration.lineThrough,
                            decorationColor: Colors.black),
                      )
                    ],
                  ),
                  widget.IsEnableShtukBtn ? ShtukBtn() :Text("${shtuk} Sany",style: TextStyle(fontSize: screenWidth*0.05)),
                ]),
                widget.IsEnableDel ? DelBtn(widget.DelFunc) : Text(""),
            ],)
          ),
          SizedBox(height: screenWidth * 0.04),
          widget.IsEnableBasket && _addBasket
              ? AddBasket(context, image, price,old)
              : Text(""),
        ],
      ),
    );
  }

  Align DelBtn(OnTab) {
    return Align(
        alignment: Alignment.topRight,
        child: GestureDetector(
          onTap: () {
            setState(() {
              OnTab;
            });
          },
          child: Padding(
            padding: EdgeInsets.only(top: screenWidth * 0.02,right:screenWidth * 0.02 ),
            child: Icon(Icons.close,size: screenWidth*0.05,),
          ),
        ));
  }

  Padding AddBasket(BuildContext context, String image, double price,double old) {
    return Padding(
      padding:  EdgeInsets.only(bottom: screenWidth*0.04),
      child: ImgBtn(
        onTap: () {
          addtime = DateTime.now().toString();
          Provider.of<UsesVar>(context, listen: false).changeDostawka(10.0);
          Provider.of<UsesVar>(context, listen: false).trueSepetDate();
          Provider.of<UsesVar>(context, listen: false).AddSepet();
          List _search;
          _search = (MyBasket.where(
                  (element) => element.id == widget.list[widget.index]["id"])
              .toList());
          if (_search.isEmpty) {
            MyBasket.add(BasketElement(
              id: widget.list[widget.index]["id"],
              num: shtuk,
              img: image,
              price: price,
              sale: widget.list[widget.index]["sale"],
              old: old,
              ThatDate: DateTime.now().toString(),
            ));
          } else {
            int _oldstuk;
            MyBasket.removeWhere(
                (element) => element.id == widget.list[widget.index]["id"]);
            _oldstuk = _search[0].num;
            MyBasket.add(BasketElement(
              id: widget.list[widget.index]["id"],
              num: shtuk + _oldstuk,
              img: image,
              price: price,
              sale: widget.list[widget.index]["sale"],
              old: old,
              ThatDate: DateTime.now().toString(),
            ));
          }
        },
        width: screenWidth * 0.35,
        height: screenWidth * 0.13,
        shape: screenWidth * 0.05,
        boxShadow: BBoxSh().BBSh(),
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
      ),
    );
  }

  Padding ShtukBtn() {
    return Padding(
        padding: const EdgeInsets.only(right: 15),
        child: ImgBtn(
          onTap: () {
            if (!_shtukEnable) {
              setState(() {
                widget.IsEnablePeai ? _shtukEnable = true:_shtukEnable=false;
                _addBasket = true;
              });
            }
          },
          shape: 20,
          width: screenWidth * 0.24,
          height: screenWidth * 0.085,
          color: Colors.green,
          child: _shtukEnable || !widget.IsEnablePeai
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MinPlusBtn(false),
                    Text(
                      "${shtuk}",
                      style: TextStyle(fontSize: screenWidth * 0.04),
                    ),
                    MinPlusBtn(true),
                  ],
                )
              : Text(
                  "Satyn al",
                  style: TextStyle(fontSize: screenWidth * 0.05),
                ),
        ));
  }

  Padding MinPlusBtn(bool isPlus) {
    return Padding(
      padding: EdgeInsets.all(screenWidth * 0.008),
      child: ImgBtn(
        onTap: () {
          setState(() {
            if (isPlus)
              shtuk++;
            else {
              if (shtuk > 1)
                shtuk--;
              else if (shtuk == 1) {
                _shtukEnable = false;
                _addBasket = false;
              }
            }
            widget.MinusPlusFunc;
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
