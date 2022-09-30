import 'package:flutter/material.dart';
import '../Connect.dart';
import '../Public.dart';
import 'categiri.dart';

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Items();
  }
}

class Items extends StatelessWidget {
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
            CategoriesList == null ? 0 : CategoriesList.length,
            (index) => Categori(index: index),
          ),
        ),
      ),
    );
  }
}
