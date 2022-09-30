import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:marketapp/pages/likePage.dart';
import 'package:marketapp/pages/searchPage.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../NavigationDrawer.dart';
import '../Public.dart';
import 'basketPage.dart';
import 'discountPage.dart';
import 'orderPage.dart';

void inDirectCall(String number)async{
launch("tel://$number");
}

class Scaflod_all extends StatelessWidget {
  final bool EnableMenu, IsSearch, IsNew, IsDiscount;
  final Widget body;
  const Scaflod_all(
      {this.body,
      this.EnableMenu = false,
      this.IsSearch = false,
      this.IsNew = false,
      this.IsDiscount = false});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        primary: true,
        toolbarHeight: 50,
        elevation: 10,
        brightness: UsesVar().IsLight() ? Brightness.light : Brightness.dark,
        iconTheme: IconThemeData(color: Colors.green),
        title: Text(
          "${Provider.of<UsesVar>(context).IsLight() ? "Light mod" : "Dark mod"}",
          style: TextStyle(color: Colors.green, fontFamily: "Soft"),
        ),
        centerTitle: true,
        shadowColor: Colors.green,
        actions: [
          Provider.of<UsesVar>(context).IsLikeDate()
              ? AppbarBildirimBtn(Icons.favorite, MyLike.length, () {
                  Provider.of<UsesVar>(context, listen: false).falseLikeDate();
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => LikePage()));
                })
              : Container(),
          SizedBox(width: 5),
          Provider.of<UsesVar>(context).IsSepetDate()
              ? AppbarBildirimBtn(Icons.shop_sharp, MyBasket.length, () {
                  Provider.of<UsesVar>(context, listen: false).PPriceSum();
                  Provider.of<UsesVar>(context, listen: false).falseSepetDate();
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => OrderPage()));
                })
              : Container(),
          AppbarBildirimBtn(
              Icons.search,
              0,
              () => IsSearch
                  ? {}
                  : Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => SearchPage()))),
        ],
      ),
      //  endDrawer: SearchPage(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () {
          Navigator.popUntil(context, (route) => route.isFirst);
        },
        child: Icon(Icons.home),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomBar(context),
      drawer: EnableMenu ? NavigationDrawer() : null,
      body: SafeArea(
        child: body,
      ),
    );
  }

  AnimatedBottomNavigationBar BottomBar(BuildContext context) {
    return AnimatedBottomNavigationBar(
      shadow: Shadow(color: Colors.green, blurRadius: 10),
      backgroundColor: Provider.of<UsesVar>(context).IsLight()
          ? Colors.white
          : Colors.black,
      gapLocation: GapLocation.center,
      icons: [Icons.shop_sharp, Icons.phone],
      iconSize: 30,
      activeIndex: NavBar_activ,
      activeColor: Provider.of<UsesVar>(context).IsLight()
          ? Colors.green
          : Colors.white,
      inactiveColor: Provider.of<UsesVar>(context).IsLight()
          ? Colors.green
          : Colors.white,
      onTap: (int) {
        //NavBar_activ = int;
        Provider.of<UsesVar>(context, listen: false).navBar_act_change(int);
        if (int == 0 && !IsNew) {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => BasketPage()));
        } else if (int == 1 && !IsDiscount) {
          inDirectCall("+99360000000");
         /* Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => DiscountPage()));*/
        }
      },
    );
  }

  Builder AppbarBildirimBtn(IconData icond, int num, Ontab) {
    return Builder(
      builder: (context) => num > 0
          ? GestureDetector(
              onTap: Ontab,
              child: Container(
                width: 27,
                child: Stack(
                  alignment: Alignment.centerLeft,
                  children: [
                    Icon(icond, size: 20),
                    Positioned(
                        top: 10,
                        right: 1,
                        child: CircleAvatar(
                            backgroundColor: Colors.red,
                            radius: screenWidth * 0.019,
                            child: Text(
                              "${num}",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            )))
                  ],
                ),
              ),
            )
          : IconButton(onPressed: Ontab, icon: Icon(icond)),
    );
  }
}
