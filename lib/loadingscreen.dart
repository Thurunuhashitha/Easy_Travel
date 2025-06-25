import 'dart:async';

import 'package:easy_travel/const/my_color.dart';
import 'package:easy_travel/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class loadingscreen extends StatefulWidget {
  const loadingscreen({super.key});

  @override
  State<loadingscreen> createState() => _loadingscreenState();
}

class _loadingscreenState extends State<loadingscreen> {
double percent=0.0;

@override
void initState(){
  super.initState();
  startTimer();
}
void startTimer(){
  Timer.periodic(Duration(seconds: 1), (timer) { 
    setState(() {
      if (percent<1.0) {
        percent+=0.2;
      } else {
        timer.cancel();
        Navigator.of(context).push(MaterialPageRoute(builder:(context) {
          return splashscreen();
        },));
        
      }
    });
  });
}





  @override
  Widget build(BuildContext context) {
    //Display height,Width
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
print(height);
    return SafeArea(
      child: Scaffold(
               backgroundColor:MyColors.blue ,
      
               body: Padding(
                 padding:  EdgeInsets.only(top:height/4.8),
                 child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center, 
                        children: [
                          Container(
                            height: width/2.7,
                            decoration: BoxDecoration(
                              image: DecorationImage(image: AssetImage("sourcess/logo1.png"),fit: BoxFit.contain)
                            ),
                          ),
                          Padding(
                            padding:  EdgeInsets.only(top:height/3),
                            child: CircularPercentIndicator(
                              radius:width/19.6,
                              lineWidth: 6,
                              percent: percent,
                              animation: true,
                              progressColor: MyColors.white,
                              animationDuration: 300,
                              
                              
                            ),
                          )
                          
                        ],
                  ),
               ),
      
      ),
    );
  }
}