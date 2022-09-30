import 'package:flutter/material.dart';
import 'package:marketapp/widgets/discountCategories.dart';
import 'package:marketapp/widgets/inCategiries.dart';
import '../Connect.dart';
import '../Public.dart';
import 'Scaffold_all.dart';

class DiscountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaflod_all(
      body: Container(
          child: Connect_api(
              URL:
              "http://${IP}/api/sales",
              Return: DiscountBody(),
              LIndex: 3)),
      // IsNew: true,
      //IsDiscount: true,
    );
  }
}

class DiscountBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Container(
            padding: EdgeInsets.all(screenWidth * 0.03),
            child: Text("Arzanladyş:  ",
                style: TextStyle(
                    fontSize: screenWidth * 0.07, fontFamily: "Comfortaa")),
          ),
          // InCategoriScrol(),
          SizedBox(height: screenWidth * 0.05),
          InCategories(list: ProductsList),
          /* //   NeonBtn(),
            // Text(haryt),
            //  Image.asset(image),
            //   Container(child: MySlider()),*/
        ],
      ),
    );
  }
}
