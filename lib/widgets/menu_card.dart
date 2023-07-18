
import 'package:flutter/material.dart';

import '../utils/colours.dart';

class MenuCard extends StatelessWidget {
  const MenuCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView.builder(
          itemCount: 10,
          scrollDirection: Axis.horizontal,

          shrinkWrap: true,
          itemBuilder: (context, i) {
            return Stack(
              children: [
                Container(
                  height: 150,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      return Container(
                        width: 150,
                        child: Card(
                          elevation: 2,
                          surfaceTintColor: Colors.transparent,
                          child: Column(
                            children: [
                              Text(
                                "Default Menu $i",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                ),
                              ),
                              const Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        '3 Starters',
                                        style: TextStyle(
                                          color: kBlack,
                                          fontSize: 10,
                                        ),),

                                      Text(
                                        '3 mainCourse',
                                        style: TextStyle(
                                          color: kBlack,
                                          fontSize: 10,
                                        ),),
                                      Text(
                                        '3 desserts',
                                        style: TextStyle(
                                          color: kBlack,
                                          fontSize: 10,
                                        ),),
                                      Text(
                                        '3 drinks',
                                        style: TextStyle(
                                          color: kBlack,
                                          fontSize: 10,
                                        ),),
                                    ],
                                  ),
                                  SizedBox(width: 15,)
                                ],
                              ),
                              SizedBox(height: 20,),
                              Row(
                                children: [
                                  SizedBox(width: 10,),
                                  Icon(
                                    Icons.person,
                                    color: kGray,
                                    size: 15.0, // Announced in accessibility modes (e.g TalkBack/VoiceOver). This label does not show in the UI.
                                  ),
                                  SizedBox(width: 5,),
                                  Text(
                                    'Min 800',
                                    style: TextStyle(
                                      color: kGray,
                                      fontSize: 10,
                                    ),),
                                ],
                              ),
                              SizedBox(height: 10,),
                              Text(
                                "Starts at ₹777",
                                style: TextStyle(
                                    color: kPrimary,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(width: 10);
                    },
                  ),
                ),
                Positioned(
                  left:-5,
                  top:15,
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Image.asset('assets/images/menu.png',)),
                ),
              ],
            );
          }
      ),
    );
  }
}
