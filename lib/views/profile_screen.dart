import 'package:flutter/material.dart';
import 'package:mizan_app/database/cache_helper.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class ProfileScreen extends StatefulWidget {
  static const String routeName = "profileScreen";
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    Size mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          Center(
            child: Container(
              width: mediaQuery.width * .9,
              height: mediaQuery.height * .6,
              decoration: BoxDecoration(
                  color: const Color(0xFFBEC6A0),
                borderRadius: BorderRadius.circular(25)
              ),
            ),
          ),
          Positioned(
            top: mediaQuery.height * .12,
            left: mediaQuery.height * .16,
            child: CircleAvatar(
              foregroundColor: const Color(0xFFBEC6A0),
              radius: mediaQuery.width * .2,
              backgroundColor: const Color(0xFFBEC6A0),
              child: CircleAvatar(
                  backgroundColor: const Color(0xFFBEC6A0),
                  radius: mediaQuery.width * .17,
                  backgroundImage: const AssetImage("assets/images/slogan.gif")),
            ),
          ),
          Positioned(
              top: mediaQuery.height * .32,
              left: mediaQuery.height * .12,
              child: Container(

                child: Column(
                  children: [
                    Text(
                      "${CacheHelper.getData(key: 'name')}",
                      style: const TextStyle(fontSize: 25),
                    ),
                    Text(
                      "${CacheHelper.getData(key: 'email')}",
                      style: const TextStyle(fontSize: 25),
                    ),

                  ],
                ),
              )),

          Positioned(
              top: mediaQuery.height * .45,
              left: mediaQuery.height * .15,
              child: Container(

                child:   Container(
                  alignment: Alignment.center,
                  width: mediaQuery.width * .4,
                  height: mediaQuery.height * .06,
                  child: Text( "${CacheHelper.getData(key: 'name')}",style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                  ),),
                  decoration: BoxDecoration(
                      color: const  Color(0xFF708871),
                      borderRadius: BorderRadius.circular(20)
                  ),
                ),
              )),

          Positioned(
              top: mediaQuery.height * .55,
              left: mediaQuery.height * .07,
              child: Container(

                child: Row(

                  children: [
                    Container(
                      child: Column(
                        children: [
                          CircularPercentIndicator(
                            radius: mediaQuery.height*.06,
                            lineWidth: 8.0,
                            percent: 0.5,
                            center:    Text(
                              "${CacheHelper.getData(key: 'salary')}",
                              style: const TextStyle(fontSize: 17),
                            ),
                            backgroundColor: Colors.white,
                            progressColor: Colors.white,
                          ),
                          Text("الحساب الينكي",style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                          ))
                        ],
                      ),
                    ),

                    SizedBox(width: mediaQuery.width*.2,),

                    Container(
                      child: Column(
                        children: [
                          CircularPercentIndicator(
                            radius: mediaQuery.height*.06,
                            lineWidth: 8.0,
                            percent: 0.5,
                            center:    Text(
                              "${CacheHelper.getData(key: 'value')}",
                              style: const TextStyle(fontSize: 17),
                            ),
                            backgroundColor: Colors.white,
                            progressColor: Colors.white,
                          ),
                          Text("الحساب الشهري",style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                          ))
                        ],
                      ),
                    ),
                  ],
                ),
              )),


          Positioned(
              top: mediaQuery.height * .73,
              left: mediaQuery.height * .1,
              child: Container(
                width:  mediaQuery.width*.6,
                height: mediaQuery.height*.05,
                child: ElevatedButton(
                  style: ButtonStyle(),
                    onPressed: () {

                }, child: Text("تعديل")),
              )),
        ],
      ),
    );
  }
}
