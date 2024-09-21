import 'package:chat_bubbles/bubbles/bubble_special_one.dart';
import 'package:flutter/material.dart';
import 'package:mizan_app/constants.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../database/cache_helper.dart';

class Masrof extends StatefulWidget {
  const Masrof({super.key});

  @override
  State<Masrof> createState() => _MasrofState();
}

class _MasrofState extends State<Masrof> {
  //var masrof = 300.toString();
  @override
  Widget build(BuildContext context) {
    Size mediaquery=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'ميزان',
          style: TextStyle(
            fontFamily: kfontStyle4,
            fontSize: 40,
          ),
        ),
        backgroundColor: kPrimaryColor,
      ),
      backgroundColor: kPrimaryColor,
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            const Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(8),
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage("assets/images/logo (2).png"),
                  ),
                ),
                BubbleSpecialOne(
                  text:
                      'في هذه الصفحة يتم عرض افضل نسبة لتنظيم مصروفات خلال مرتبك',
                  color: kPrimaryColor2,
                  tail: true,
                  textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontFamily: kfontStyle2,
                  ),
                ),
              ],
            ),

            const SizedBox(
              height: 30,
            ),

            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color:  Color(0xFF708871),
              ),
             // padding: const EdgeInsets.all(20),
              height: 80,
              width: 200,
              child: Text(
                "${CacheHelper.getData(key: 'salary')}",
                style: const TextStyle(
                  fontSize: 40,
                  fontFamily: kfontStyle1,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 40,),
            SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,

              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Container(
                      width: mediaquery.width*.6,
                      height: mediaquery.height*.6,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: kPrimaryColor,
                        border: Border.all(color: kPrimaryColor2,width: 10),
                      ),
                      child:  Column(
                        children: [
                          const Text(
                            'مصروفاتك\nالاساسية الثابتة',
                            style: TextStyle(
                                fontFamily: kfontStyle1,
                                fontWeight: FontWeight.bold,
                                fontSize: 30),
                          ),
                          const SizedBox(height: 30,),
                          CircularPercentIndicator(
                            radius: mediaquery.height*.09,
                            lineWidth: 8.0,
                            percent: 0.5,
                            center:  Column(
                              children: [
                                SizedBox(height: mediaquery.height*.03,),
                                Text("0.50%",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                                Text("4500.0",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                              ],
                            ),
                            backgroundColor: Colors.grey,
                            progressColor: Colors.green,
                          ),
                          const SizedBox(height: 50,),


                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 6),
                            child: Row(
                              children: [
                                Icon(Icons.directions_boat_filled,color: Colors.pinkAccent,),
                                SizedBox(width: 10,),
                                Text("فواتير الكهرباء والماء",style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold),),
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 6),
                            child: Row(
                              children: [
                                Icon(Icons.map_sharp,color: Colors.pinkAccent,),
                                SizedBox(width: 10,),
                                Text("مصاريف التعليم",style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold),)
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 6),
                            child: Row(
                              children: [
                                Icon(Icons.local_hospital,color: Colors.pinkAccent,),
                                SizedBox(width: 10,),
                                Text("الرعايةالصحية",style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold),),
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 6),
                            child: Row(
                              children: [
                                Icon(Icons.bus_alert_sharp,color: Colors.pinkAccent,),
                                SizedBox(width: 10,),
                                Text("النقل",style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold),),
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 6),
                            child: Row(
                              children: [
                                Icon(Icons.call,color: Colors.pinkAccent,),
                                SizedBox(width: 10,),
                                Text("الاتصالات",style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold),),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Container(
                      width: mediaquery.width*.6,
                      height: mediaquery.height*.6,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: kPrimaryColor,
                        border: Border.all(color: kPrimaryColor2,width: 10),
                      ),
                      child:  Column(
                        children: [
                          const Text(
                            'مصروفاتك\nالاساسية الثابتة',
                            style: TextStyle(
                                fontFamily: kfontStyle1,
                                fontWeight: FontWeight.bold,
                                fontSize: 30),
                          ),
                          const SizedBox(height: 30,),
                          CircularPercentIndicator(
                            radius: mediaquery.height*.09,
                            lineWidth: 8.0,
                            percent: 0.5,
                            center:  Column(
                              children: [
                                SizedBox(height: mediaquery.height*.03,),
                                Text("0.50%",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                                Text("4500.0",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                              ],
                            ),
                            backgroundColor: Colors.grey,
                            progressColor: Colors.green,
                          ),
                          const SizedBox(height: 50,),


                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 6),
                            child: Row(
                              children: [
                                Icon(Icons.directions_boat_filled,color: Colors.pinkAccent,),
                                SizedBox(width: 10,),
                                Text("فواتير الكهرباء والماء",style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold),),
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 6),
                            child: Row(
                              children: [
                                Icon(Icons.map_sharp,color: Colors.pinkAccent,),
                                SizedBox(width: 10,),
                                Text("مصاريف التعليم",style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold),)
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 6),
                            child: Row(
                              children: [
                                Icon(Icons.local_hospital,color: Colors.pinkAccent,),
                                SizedBox(width: 10,),
                                Text("الرعايةالصحية",style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold),),
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 6),
                            child: Row(
                              children: [
                                Icon(Icons.bus_alert_sharp,color: Colors.pinkAccent,),
                                SizedBox(width: 10,),
                                Text("النقل",style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold),),
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 6),
                            child: Row(
                              children: [
                                Icon(Icons.call,color: Colors.pinkAccent,),
                                SizedBox(width: 10,),
                                Text("الاتصالات",style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold),),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Container(
                      width: mediaquery.width*.6,
                      height: mediaquery.height*.6,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: kPrimaryColor,
                        border: Border.all(color: kPrimaryColor2,width: 10),
                      ),
                      child:  Column(
                        children: [
                          const Text(
                            'مصروفاتك\nالاساسية الثابتة',
                            style: TextStyle(
                                fontFamily: kfontStyle1,
                                fontWeight: FontWeight.bold,
                                fontSize: 30),
                          ),
                          const SizedBox(height: 30,),
                          CircularPercentIndicator(
                            radius: mediaquery.height*.09,
                            lineWidth: 8.0,
                            percent: 0.5,
                            center:  Column(
                              children: [
                                SizedBox(height: mediaquery.height*.03,),
                                Text("0.50%",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                                Text("4500.0",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                              ],
                            ),
                            backgroundColor: Colors.grey,
                            progressColor: Colors.green,
                          ),
                          const SizedBox(height: 50,),


                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 6),
                            child: Row(
                              children: [
                                Icon(Icons.directions_boat_filled,color: Colors.pinkAccent,),
                                SizedBox(width: 10,),
                                Text("فواتير الكهرباء والماء",style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold),),
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 6),
                            child: Row(
                              children: [
                                Icon(Icons.map_sharp,color: Colors.pinkAccent,),
                                SizedBox(width: 10,),
                                Text("مصاريف التعليم",style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold),)
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 6),
                            child: Row(
                              children: [
                                Icon(Icons.local_hospital,color: Colors.pinkAccent,),
                                SizedBox(width: 10,),
                                Text("الرعايةالصحية",style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold),),
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 6),
                            child: Row(
                              children: [
                                Icon(Icons.bus_alert_sharp,color: Colors.pinkAccent,),
                                SizedBox(width: 10,),
                                Text("النقل",style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold),),
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 6),
                            child: Row(
                              children: [
                                Icon(Icons.call,color: Colors.pinkAccent,),
                                SizedBox(width: 10,),
                                Text("الاتصالات",style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold),),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
