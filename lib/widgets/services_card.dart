

import 'package:craft_my_plate/model/service_model.dart';
import 'package:flutter/material.dart';

import '../utils/colours.dart';

class ServicesCard extends StatefulWidget {
  const ServicesCard({Key? key}) : super(key: key);

  @override
  State<ServicesCard> createState() => _ServicesCardState();
}

class _ServicesCardState extends State<ServicesCard> {

  List<ServiceModel> items = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    items = [
    ServiceModel(
      title: "Signature",
      discription:['High Quality Disposable Cutlery',
        'Elegant Decorations & Table Settings',
      'Served by Waitstaff',
      'Best for Weddings, Corporate Events etc'],
      icon:"assets/images/signature.png",
      image:"assets/images/cups.png",
      show:true
     ),
      ServiceModel(
          title: "Value",
          discription:[' Disposable Cutlery',
            'Basic Decorations & Table Settings',
            'Served by Buffet style',
            'Best for Birthdays, family...'],
          icon:"assets/images/value_icon.png",
          image:"assets/images/bowl.png",
          show:false
      ),
      ServiceModel(
          title: "Luxury",
          discription:['High end reusable Cutlery',
            'Elegant Decorations & Table Settings',
            'Served by professional Waitstaff',
            'Best for celebrity parties,Wedding,etc'],
          icon:"assets/images/luxury_icon.png",
          image:"assets/images/luxury.png",
          show:false
      ),
    ];

  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.4 ,
        child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, index) {
          var item = items[index];
          return Card(
            elevation: 2,
            surfaceTintColor: Colors.transparent,
            child: Stack(
              children:[

                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [

                      SizedBox(height: 10,),
                      Image.asset(item.image!,fit: BoxFit.fill,),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          Image.asset(item.icon!, ),
                          SizedBox(width: 5,),
                          Text(
                            item.title!,
                            style: TextStyle(
                                color: kPrimary,
                                fontSize: 18,
                                fontWeight: FontWeight.w500
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5,),
                      Row(
                        children: [
                          Image.asset('assets/icons/sparkles.png', ),
                          Text(
                            item.discription![0],
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5,),
                      Row(
                        children: [
                          Image.asset('assets/icons/sparkles.png', ),
                          Text(
                            item.discription![1],
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.left,
                          ),

                        ],
                      ),
                      SizedBox(height: 5,),
                      Row(
                        children: [
                          Image.asset('assets/icons/sparkles.png', ),
                          Text(
                            item.discription![2],
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.left,
                          ),

                        ],
                      ),
                      SizedBox(height: 5,),
                      Row(
                        children: [
                          Image.asset('assets/icons/sparkles.png', ),
                          Text(
                            item.discription![3],
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.275 ),
                        child: Text(
                          "know more",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 12,
                            color: kPrimary,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),


                    ],
                  ),
                ),
                if(items[index].show==true)
                 Positioned(
                  right: 0,
                  top: 0,
                  child: Container(
                    height: 30,
                    width: 120,
                    decoration: BoxDecoration(
                      color: kPrimary,
                      borderRadius: BorderRadius.only(
                          topRight:Radius.circular(10),
                          bottomLeft:Radius.circular(10) ),
                    ),
                    child:   Center(
                      child: Text(
                        "Recommended",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: kPureWhite
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }, separatorBuilder: (BuildContext context, int index) {
          return SizedBox( width: 10,);
        },
    ),
    );
  }
}
