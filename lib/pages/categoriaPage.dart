//import 'package:carousel_pro/carousel_pro.dart';
//import 'package:untitled3/widgets/neonBtn.dart';
//import 'package:untitled3/widgets/inCategiri.dart';
//import 'package:flutter_swiper/flutter_swiper.dart';
//import 'package:provider/provider.dart';
//import 'package:untitled3/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:marketapp/widgets/InCategoriScrol.dart';
import 'package:marketapp/widgets/inCategiries.dart';
import 'package:provider/provider.dart';
import '../Connect.dart';
import '../Public.dart';
import 'Scaffold_all.dart';

class CategoriaPage extends StatelessWidget {
  final int index;
  CategoriaPage({@required this.index});
  @override
  Widget build(BuildContext context) {
    return Scaflod_all(
      EnableMenu: true,
      body: Connect_api(
          URL: "http://${IP}/api/incategory/${CategoriesList[index]["id"]}",
          Return: IncatPage(index: index),
          LIndex: 2),
    );
  }
}

class IncatPage extends StatelessWidget {
  const IncatPage({Key key, @required this.index}) : super(key: key);
  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Container(
            padding: EdgeInsets.all(screenWidth * 0.03),
            child: Text("${CategoriesList[index]["name"]}:  ",
                style: TextStyle(
                    fontSize: screenWidth * 0.07, fontFamily: "Comfortaa")),
          ),
          InCategoriScrol(list: CategoriesList[index]["incategory"],),
          SizedBox(height: screenWidth * 0.05),
          InCategories(list: InCategoriesList[Provider.of<UsesVar>(context).selScrol()]["products_in"],),
        ],
      ),
    );
  }
}
