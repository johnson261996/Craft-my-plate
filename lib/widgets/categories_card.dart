
import 'package:craft_my_plate/utils/colours.dart';
import 'package:flutter/material.dart';

class CategoriesCard extends StatelessWidget {
   CategoriesCard({Key? key}) : super(key: key);

  List<String> categories = ['assets/images/starters.png','assets/images/drinks.png','assets/images/rice.png','assets/images/curry.png','assets/images/starters.png','assets/images/drinks.png'];
  List<String> categories_items_name =['Starters','Drinks','Rice','Curry','Starters','Drinks'];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          var item = categories_items_name[index];
          return  Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(categories[index], ),
              SizedBox(height: 10,),
              Text(
                item,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                ),
              ),
            ],
          );
        }, separatorBuilder: (BuildContext context, int index) {
        return SizedBox( width: 20,);
      },
      ),
    );
  }
}
