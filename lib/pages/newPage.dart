import 'package:flutter/material.dart';
import 'package:marketapp/widgets/newCategiries.dart';
import '../Connect.dart';
import '../Public.dart';
import 'Scaffold_all.dart';

class NewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaflod_all(
      body: Container(
          child: Connect_api(
              URL: "http://${IP}/api/news",
              Return: NewBody(),
              LIndex: 4)),
     // IsNew: true,
      //IsDiscount: true,
    );
  }
}

class NewBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Container(
            padding: EdgeInsets.all(screenWidth * 0.03),
            child: Text("Täzeler:  ",
                style: TextStyle(
                    fontSize: screenWidth * 0.07, fontFamily: "Comfortaa")),
          ),
          // InCategoriScrol(),
          SizedBox(height: screenWidth * 0.05),
          newCategories(),
          /* //   NeonBtn(),
            // Text(haryt),
            //  Image.asset(image),
            //   Container(child: MySlider()),*/
        ],
      ),
    );
  }
}
