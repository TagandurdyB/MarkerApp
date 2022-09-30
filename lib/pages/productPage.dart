import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:marketapp/widgets/DrawBarBtn.dart';
import 'package:marketapp/widgets/basket.dart';
import 'package:marketapp/widgets/imgBtn.dart';
import 'package:provider/provider.dart';
import '../Public.dart';
import 'Scaffold_all.dart';
import 'discountPage.dart';

class ProductPage extends StatelessWidget {
  final int index;
  final List list;
  ProductPage({@required this.index, @required this.list});
  @override
  Widget build(BuildContext context) {
    String image = "http://${IP}/files/product/${list[index]["photo"]}",
        haryt = list[index]["name"],
        brand = list[index]["brand"];
    double price = list[index]["price"] + 0.0;

    return Scaflod_all(
      body: Container(
        // color: Colors.red,
        width: screenWidth,
        // height: screenWidth * 0.4,
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            SizedBox(height: screenWidth * 0.05),
            Hero(
              tag: "product${list[index]["id"]}",
              child: FittedBox(
                fit: BoxFit.fitWidth,
                child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Zoom(
                          image: image,
                        ),
                      ));
                    },
                    child: Image.network(image)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(haryt,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: screenWidth * 0.07,
                      fontFamily: "ProximaSoftBold")),
            ),
            Container(
              padding: EdgeInsets.all(screenWidth * 0.03),
              child: Text(
                "Brend : ${brand}",
                style: TextStyle(fontFamily: "Itim"),
              ),
            ),
            Container(
                padding: EdgeInsets.all(screenWidth * 0.06),
                child: Stack(
                  alignment: Alignment.centerLeft,
                  children: [
                    Center(
                      child: Text(
                        "Bahasy : ${(price).toStringAsFixed(2)}TM",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: "Itim", fontSize: screenWidth * 0.05),
                      ),
                    ),
                    AnimatedBtn(
                      num: 1,
                        index: index,
                        image: image,
                        list: list,
                        icon: Icon(Icons.favorite_border_sharp)),
                    list[index]["sale"]== 0 ?
                    Container():
                    Align(
                        alignment: Alignment.centerRight,
                        child: AnimatedBtn(
                          num: 2,
                          index: index,
                          image: image,
                          list: list,
                          icon: Text(
                            "%",
                            style: TextStyle(fontSize: 25,color: Colors.white),
                          ),
                          col: Colors.red,
                        )),
                  ],
                )),
            BasketWidget(index: index, list: list, IsEnableBasket: true),
            SizedBox(height: screenWidth * 0.2),
          ],
        ),
      ),
    );
  }
}

class AnimatedBtn extends StatefulWidget {
  const AnimatedBtn(
      {Key key,
      @required this.index,
      @required this.image,
      @required this.list,
      @required this.icon,
        @required this.num,
      this.col})
      : super(key: key);

  final int index,num;
  final String image;
  final List list;
  final Widget icon;
  final Color col;

  @override
  _AnimatedBtnState createState() => _AnimatedBtnState();
}

class _AnimatedBtnState extends State<AnimatedBtn>
    with SingleTickerProviderStateMixin {
/*  AnimationController _controller;
  Animation<double> _sizeAnim;
  void initState() {
    super.initState();
    _controller=AnimationController(
      duration: Duration(microseconds: 200),
      vsync:this
    );

*/
/*    _sizeAnim=TweenSequence(
      <TweenSequenceItem<double>>[
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: 30,end: 40),
          weight: 40
        ),
        TweenSequenceItem<double>(
            tween: Tween<double>(begin: 40,end: 30),
            weight: 40
        )
      ]
    ).animate(_controller);*/ /*

*/ /*    _controller.forward();
    _controller.addListener(() {

    });*/ /*
  }*/
  @override
  Widget build(BuildContext context) {
    double old = (widget.list[widget.index]["old"] == null
            ? 0.0
            : widget.list[widget.index]["old"] + 0.0),
        price = (widget.list[widget.index]["price"] == null
            ? 0.0
            : widget.list[widget.index]["price"] + 0.0);
    return CircleAvatar(
      backgroundColor: widget.col,
      child: GestureDetector(
          onTap: () {
         if (widget.num ==1){
              Provider.of<UsesVar>(context, listen: false).trueLikeDate();
              Provider.of<UsesVar>(context, listen: false).AddLike();
              List _search;
              _search = (MyLike.where((element) =>
                  element.id == widget.list[widget.index]["id"]).toList());
              if (_search.isEmpty) {
                MyLike.add(BasketElement(
                  id: widget.list[widget.index]["id"],
                  img: widget.image,
                  price: price,
                  sale: widget.list[widget.index]["sale"],
                  old: old,
                  ThatDate: DateTime.now().toString(),
                ));
              }
            }else {
           Navigator.of(context).push(
               MaterialPageRoute(builder: (context) => DiscountPage()));
         }
          },
          child: widget.icon),
    );
  }
}

class Zoom extends StatelessWidget {
  final String image;
  Zoom({this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InteractiveViewer(
        child: Hero(tag: "product", child: Image.network(image)),
      ),
    );
  }
}
