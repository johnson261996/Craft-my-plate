import 'package:craft_my_plate/utils/colours.dart';
import 'package:craft_my_plate/widgets/categories_card.dart';
import 'package:craft_my_plate/widgets/services_card.dart';
import 'package:craft_my_plate/widgets/starters_card.dart';
import 'package:flutter/material.dart';

import 'CarouselfoodSlider.dart';
import 'craft_card.dart';
import 'main_course_card.dart';
import 'menu_card.dart';

class BuildBody extends StatelessWidget {
   BuildBody({Key? key}) : super(key: key);


   //List<String> menu_items = ['Default Menu']

   @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height:  MediaQuery.of(context).size.height * 2.8  ,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10,),
          CarouselfoodSlider(),
          const SizedBox(height: 20,),
          SearchBar(
            hintText: 'Search food or events',
            surfaceTintColor: MaterialStateProperty.all(kPureWhite),
            trailing:  const [Icon(Icons.search,color: kPrimary,)],
            padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 10.0)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0))),
          ),
          const SizedBox(height: 20,),
          Text(
            "Start crafting",
            style: TextStyle(
                color: kPrimary,
                fontSize: 20,
                fontWeight: FontWeight.w500
            ),
          ),
        const SizedBox(height: 20,),
         CraftCard(),
        const SizedBox(height: 20,),
        const MenuCard(),
          const SizedBox(height: 20,),
          Text(
            "Top Categories",
            style: TextStyle(
                color: kBlack,
                fontSize: 20,
                fontWeight: FontWeight.w500
            ),
          ),
          CategoriesCard(),
          const SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Starters",
                style: TextStyle(
                    color: kBlack,
                    fontSize: 18,
                    fontWeight: FontWeight.w500
                ),
              ),

              Text(
                "More Starters",
                style: TextStyle(
                    color: kPrimary,
                    fontSize: 12,
                    fontWeight: FontWeight.w500
                ),
              ),
            ],
          ),
          const SizedBox(height: 10,),
          StartersCard(),
          const SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Main Course",
                style: TextStyle(
                    color: kBlack,
                    fontSize: 18,
                    fontWeight: FontWeight.w500
                ),
              ),

              Text(
                "More Main Course",
                style: TextStyle(
                    color: kPrimary,
                    fontSize: 12,
                    fontWeight: FontWeight.w500
                ),
              ),
            ],
          ),
          MainCourseCard(),
          const SizedBox(height: 10,),
          Text(
            "Services",
            style: TextStyle(
                color: kBlack,
                fontSize: 18,
                fontWeight: FontWeight.w500
            ),
          ),
          const SizedBox(height: 10,),
          ServicesCard(),
          const SizedBox(height: 10,),
          Text(
            "How does it work?",
            style: TextStyle(
                color: kBlack,
                fontSize: 18,
                fontWeight: FontWeight.w500
            ),
          ),
          const SizedBox(height: 10,),
          Image.asset("assets/images/how_it_works.png", ),
          Container(
            color: Color(0xffF8F8F8),
            height: 100,
            child: Center(
              child: Text(
                "Delicious food with professional service!",
                style: TextStyle(
                    color: kBlack,
                    fontSize: 25,
                    fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          )
        ],
      ),
    );
  }
}
