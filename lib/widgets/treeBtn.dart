//import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';
import 'package:marketapp/pages/discountPage.dart';
import 'package:marketapp/pages/likePage.dart';
import 'package:marketapp/pages/newPage.dart';
import 'package:marketapp/pages/orderPage.dart';
import 'package:provider/provider.dart';
import '../Public.dart';
import 'imgBtn.dart';

class TreeBtn extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    void newPage() {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => NewPage()));
    }

    void discountPage() {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => DiscountPage()));
    }

    void likePage() {
      Provider.of<UsesVar>(context,listen: false).falseSepetDate();
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => LikePage()));
    }

    return Container(
      // color: Colors.orange,
      width: screenWidth,
      //height: screenWidth * 0.25,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ImgBtn(
            onTap: newPage,
            width: screenWidth * 0.25,
            height: screenWidth * 0.15,
            color: UsesVar().IsLight() ? Color(0xff90D788) : Color(0xff2370F7),
            shape: 16,
            child: Icon(Icons.fiber_new,size: 30),
          ),
          SizedBox(width: screenWidth * 0.03),
          ImgBtn(
            onTap: likePage,
            //   width: screenWidth * 0.25,
            //  height: screenWidth * 0.25,
            //UsesVar().IsLight()?Colors.green:Colors.green[900],
            radius: screenWidth * 0.25,
            //shape: 16,
            colors: UsesVar().IsLight()
                ? [Colors.green[300], Colors.green[900]]
                : [Color(0xff0E3EF7), Color(0xff0320D6)],
            child: Icon(Icons.favorite_border_sharp,size: screenWidth*0.1,color: Colors.white,),
            ISsCircle: true,
          ),
          SizedBox(width: screenWidth * 0.03),
          ImgBtn(
            onTap: discountPage,
            width: screenWidth * 0.25,
            height: screenWidth * 0.15,
            color: UsesVar().IsLight() ? Color(0xff90D788) : Color(0xff2370F7),
            shape: 16,
            child: Icon(Icons.label_outlined,size: 30,),
          ),
        ],
      ),
    );
  }
}
