import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Connect.dart';
import '../Public.dart';
//import 'categiri.dart';
import 'inCategiri.dart';
import 'newCategiri.dart';

class newCategories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
/*    Map<int, String> inharyts = {
      0: "pancel",
      1: "pen",
    };*/
    return newCategoriesW();
  }
}

class newCategoriesW extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(1.0),
        child: Wrap(
          //alignment: WrapAlignment.spaceBetween,
          spacing: screenWidth * 0.04,
          runSpacing: screenWidth * 0.04,
          children: List.generate(
            NewList == null ? 0 : NewList.length,
            (index) => NewCategori(index: index),
          ),
        ),
      ),
    );
  }
}
