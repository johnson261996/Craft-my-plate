import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselfoodSlider extends StatelessWidget {
   CarouselfoodSlider({Key? key}) : super(key: key);

  List<String> list = ['assets/images/food_coupon.png','assets/images/food_coupon.png','assets/images/food_coupon.png','assets/images/food_coupon.png'];

  @override
  Widget build(BuildContext context) {
    return  CarouselSlider(
        items: list
            .map((item) => Container(
          width: MediaQuery.of(context).size.width * 0.750,
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(item.toString()),fit: BoxFit.fill),
              borderRadius: BorderRadius.all(Radius.circular(20)),
        ),

        )) .toList(),
        options: CarouselOptions(
          autoPlay: true,
          disableCenter: false,
          height: 150,
          viewportFraction: 0.850,

        ));
  }
}
