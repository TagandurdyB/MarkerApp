import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../Public.dart';

class MySlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Carusel_sld();
  }
}

class Carusel_sld extends StatefulWidget {
  //const Carusel_sld({Key? key}) : super(key: key);
  @override
  State<Carusel_sld> createState() => _Carusel_sldState();
}

class _Carusel_sldState extends State<Carusel_sld> {
  CarouselController buttonCarouselController = CarouselController();
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: screenWidth,
          height: screenWidth * 0.5,
          margin: EdgeInsets.all(screenWidth * 0.02),
          child: CarouselSlider.builder(
            carouselController: buttonCarouselController,
            options: CarouselOptions(
                // height: 400,
                // aspectRatio: 16 / 9,
                //  viewportFraction: 0.8,
                //scrollDirection: Axis.horizontal,
                //autoPlayCurve: Curves.fastOutSlowIn,
                initialPage: 1,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(milliseconds: 1000),
                enlargeCenterPage: true,
                onPageChanged: (i, r) {
                  setState(() {
                    _current = i;
                  });
                }),
            itemCount:GaleryList.isEmpty ? 0 :GaleryList.length,
            itemBuilder: (BuildContext context, int index, int pageViewIndex) =>
            GaleryList.isEmpty
                    ? Container()
                    : Container(
                        width: screenWidth,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadiusDirectional.circular(
                              screenWidth * 0.08),
                          color: Colors.black, //list[index % 4],
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(
                                'http://${IP}/files/gallery/${GaleryList[index]["img"]}'),
                          ),
                        ),
                      ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
          child: AnimatedSmoothIndicator(
            activeIndex: _current,
            count: GaleryList == null ? 0 : GaleryList.length,
            effect: ExpandingDotsEffect(
                activeDotColor: UsesVar().IsLight() ? LightDot : DarkDot,
                dotWidth: 8,
                dotHeight: 8),
          ),
        )
      ],
    );
  }
}
