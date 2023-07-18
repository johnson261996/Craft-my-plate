
import 'package:flutter/material.dart';

class StartersCard extends StatelessWidget {
   StartersCard({Key? key}) : super(key: key);

   List<String> starters = ['assets/images/grill.png','assets/images/mushroom_fry.png','assets/images/veggie_fry.png','assets/images/grill.png','assets/images/mushroom_fry.png','assets/images/veggie_fry.png'];
   List<String> categories_items_name =['Grill chicken','Mushroom Fry','Veggie Fry','Grill chicken','Mushroom Fry','Veggie Fry'];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: categories_items_name.length,
        itemBuilder: (context, index) {
          var item = categories_items_name[index];
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
                      child: Image.asset(starters[index], )),
                  SizedBox(height: 10,),
                  Text(
                    item,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
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
