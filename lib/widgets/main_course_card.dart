

import 'package:flutter/material.dart';

class MainCourseCard extends StatelessWidget {

   MainCourseCard({Key? key}) : super(key: key);
  List<String> maincourse = ['assets/images/biryani.png','assets/images/bread.png','assets/images/plain_rice.png','assets/images/biryani.png','assets/images/bread.png','assets/images/plain_rice.png'];
  List<String> maincourse_items_name =['Biryani','Bread','Plain rice','Biryani','Bread','Plain rice'];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: maincourse_items_name.length,
        itemBuilder: (context, index) {
          var item = maincourse_items_name[index];
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
                      child: Image.asset(maincourse[index], )),
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
