import 'package:flutter/material.dart';
import 'package:marketapp/Public.dart';
import 'package:marketapp/pages/productPage.dart';
import 'package:marketapp/widgets/InCategoriScrol.dart';
import 'package:marketapp/widgets/basket.dart';
import 'package:marketapp/widgets/inCategiries.dart';
import 'package:provider/provider.dart';

import '../Connect.dart';
import 'Scaffold_all.dart';
//import '../Public.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController txt = TextEditingController();
  String _text = "";
  int _selectCategori = -1;
  int _selectCategoriID = -1;
  int _selectInCategori = -1;
  int _selectInCategoriID = -1;

  BoxShadow bowShad1(double int1, int index, int selec) {
    return BoxShadow(
        color: selec == index ? Color(0xFF49B34E) : Color(0xffC3C3C3),
        offset: Offset(int1, int1),
        blurRadius: 3,
        spreadRadius: 0.5);
  }

  @override
  Widget build(BuildContext context) {
    //IsSearch=true;
    return Scaflod_all(
      body: SafeArea(
          child: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              onChanged: (input) {
                setState(() {
                  _text = input;
                });
              },
              controller: txt,
              style: TextStyle(
                  color: UsesVar().IsLight() ? Colors.black : Colors.white),
              decoration: InputDecoration(
                hintText: "Search same thing",
                // labelText: "Gözlemek üçin bas",
                prefixIcon: Icon(
                  Icons.search,
                  color: UsesVar().IsLight() ? Colors.green : Colors.blue,
                ),
                suffix: GestureDetector(
                    onTap: () {setState(() {
                      txt.clear();
                    });},
                    child: Icon(Icons.cancel_rounded)),
              ),
            ),
          ),
          /* Text("${_text}"),*/
          Divider(
              color: UsesVar().IsLight() ? Colors.black : Colors.white,
              height: 25),
          txt.text.isEmpty
              ? Column(
                  children: [
                    Wrap(
                      spacing: screenWidth * 0.01,
                      runSpacing: screenWidth * 0.02,
                      children: List.generate(
                        CategoriesList.length ?? 0,
                        (index) => GestureDetector(
                          onTap: () {
                            setState(() {
                              if (_selectCategori == index) {
                                _selectCategori = -1;
                                _selectCategoriID = -1;
                              } else {
                                _selectCategori = index;
                                _selectCategoriID = CategoriesList[index]["id"];
                              }
                              _selectInCategori = -1;
                            });
                          },
                          child: Container(
                            height: screenWidth * 0.15,
                            alignment: Alignment.center,
                            margin: EdgeInsets.all(screenWidth * 0.011),
                            width: screenWidth * 0.3,
                            padding: EdgeInsets.all(screenWidth * 0.01),
                            decoration: BoxDecoration(
                              boxShadow: [
                                bowShad1(2, index, _selectCategori),
                                bowShad1(-2, index, _selectCategori),
                              ],
                              borderRadius:
                                  BorderRadius.circular(screenWidth * 0.06),
                              color: UsesVar().IsLight()
                                  ? LightCategori
                                  : DarkCategori,
                            ),
                            child: Text(
                              "${CategoriesList[index]["name"]}",
                              style: TextStyle(
                                  fontFamily: "Itim",
                                  fontSize: screenWidth * 0.032),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ),
                    _selectCategori == -1
                        ? Text("")
                        : Column(children: [
                            Divider(
                                color: UsesVar().IsLight()
                                    ? Colors.black
                                    : Colors.white,
                                height: 25),
                            Container(
                              child: Wrap(
                                spacing: screenWidth * 0.01,
                                runSpacing: screenWidth * 0.02,
                                children: List.generate(
                                  CategoriesList[_selectCategori]["incategory"]
                                          .length ??
                                      0,
                                  (index) => GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        if (_selectInCategori == index) {
                                          _selectInCategori = -1;
                                          _selectInCategoriID = -1;
                                        } else {
                                          _selectInCategori = index;
                                          _selectInCategoriID =
                                              CategoriesList[_selectCategori]
                                                  ["incategory"][index]["id"];
                                        }
                                      });
                                    },
                                    child: Container(
                                      height: screenWidth * 0.15,
                                      alignment: Alignment.center,
                                      margin:
                                          EdgeInsets.all(screenWidth * 0.011),
                                      width: screenWidth * 0.3,
                                      padding:
                                          EdgeInsets.all(screenWidth * 0.01),
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          bowShad1(2, index, _selectInCategori),
                                          bowShad1(
                                              -2, index, _selectInCategori),
                                        ],
                                        borderRadius: BorderRadius.circular(
                                            screenWidth * 0.06),
                                        color: UsesVar().IsLight()
                                            ? LightCategori
                                            : DarkCategori,
                                      ),
                                      child: Text(
                                        "${CategoriesList[_selectCategori]["incategory"][index]["name"]}",
                                        style: TextStyle(
                                            fontFamily: "Itim",
                                            fontSize: screenWidth * 0.032),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ]),
                    Divider(
                        color:
                            UsesVar().IsLight() ? Colors.black : Colors.white,
                        height: 25),
                    _selectCategori == -1
                        ? InCategories(list: AllProducts)
                        : _selectInCategori == -1
                            ? InCategories(
                                list: AllProducts.where((element) =>
                                    element["category"] ==
                                    _selectCategoriID).toList())
                            : InCategories(
                                list: AllProducts.where((element) =>
                                    element["incategory"] ==
                                    _selectInCategoriID).toList()),
                  ],
                )
              : Column(children: _builSearchList()),
        ],
      )),
      IsSearch: true,
    );
  }

  List<Widget> _builSearchList() {
    List _searchList = [];
    for (int i = 0; i < AllProducts.length; i++) {
      String name = AllProducts[i]["name"];
      if (name.toLowerCase().contains(txt.text.toLowerCase())) {
        _searchList.add(AllProducts[i]);
      }
    }
    return List.generate(
        _searchList.isEmpty ? 0 : _searchList.length,
        (index) => GestureDetector(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ProductPage(
                  index: index,
                  list: _searchList,
                ),
              )),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:EdgeInsets.only(left: screenWidth * 0.1,bottom: 10),
                    child: Text("${_searchList[index]["name"]}",textAlign: TextAlign.center,),
                  ),
                  BasketWidget(
                      index: index,
                      list: _searchList,
                      IsEnableBasket: true,
                      IsEnableShtukBtn: false),
                ],
              ),
            ));
  }
}
