import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Connect.dart';
import '../Public.dart';
//import 'categiri.dart';
import 'discountCategori.dart';
import 'inCategiri.dart';

class discountCategories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return discountCategoriesW();
  }
}

class discountCategoriesW extends StatelessWidget {
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
            ProductsList == null ? 0 : ProductsList.length,
            (index) => DiscountCategori(index: index),
          ),
        ),
      ),
    );
  }
}
