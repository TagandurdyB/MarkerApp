import 'package:flutter/material.dart';
import '../Public.dart';

class Slider_rek extends StatelessWidget {
  //const Slider_rek({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var list = [
      Colors.black,
      Colors.orange,
      Colors.purple,
      Colors.green,
    ];
    List<String> img_names = [
      "0.jpg",
      "1.jpg",
      "2.jpg",
      "3.jpg",
      "4.jpg",
      "5.jpg",
      '6.jpg',
    ];

    return Container(
      height: screenWidth * 0.6,
      width: screenWidth,
      child: FractionallySizedBox(
        heightFactor: 1,
         child: ListView.builder(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: 6,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.all(8),
              width: screenWidth * 0.8,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadiusDirectional.circular(36),
                color: Colors.black,//list[index % 4],
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: ExactAssetImage('assets/images/${index}.jpg'),
                ),
              ),


        /* child: Center(
                    child: Text(
                  "${list_str[index % 4]}  index=$index",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 50, color: Colors.white),
                )), */
            );
          },
          padding: EdgeInsets.all(8),
        ),


     /*   child: CarouselSlider(
          options: CarouselOptions(autoPlay: true),
        items: img_names.map((e) {
         return Container(child: Text("$e"),);
        }).toList(),
        )*/



    ),
    );
  }
}
