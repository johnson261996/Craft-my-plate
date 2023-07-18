

import 'package:flutter/material.dart';

class CraftCard extends StatelessWidget {
   CraftCard({Key? key}) : super(key: key);

  List<String> starter_items = ['assets/images/plate_food_1.png','assets/images/plate_food_2.png',];
  List<String> starter_items_name =['Default Platters','Craft Your Own'];

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 150,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: starter_items.length,
        itemBuilder: (context, index) {
          var item = starter_items_name[index];
          return  Card(
            elevation: 2,
            surfaceTintColor: Colors.transparent,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(15.0),topRight:  Radius.circular(15.0)),
                      child: Image.asset(starter_items[index], )),
                  SizedBox(height: 10,),
                  Text(
                    item,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          );
        }, separatorBuilder: (BuildContext context, int index) {
        return SizedBox( width: 10,);
      },
      ),
    );
  }
}
