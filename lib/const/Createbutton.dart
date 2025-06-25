import 'package:easy_travel/const/my_color.dart';
import 'package:easy_travel/loginpage.dart';
import 'package:flutter/material.dart';

class createbutton extends StatelessWidget {
  const createbutton({super.key});

  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor:MyColors.buttonblue,shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))),
      onPressed:() {
      Navigator.of(context).push(MaterialPageRoute(builder:(context) {
        return loginpage();
      },));
      
      },child:Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Padding(
            padding: EdgeInsets.only(top: height/40,bottom: height/40,right: width/25),
            child: Text("Get Started Now",style: TextStyle(color: MyColors.white,fontSize: width/24.5)),
          ),
          Icon(Icons.arrow_forward,color: MyColors.white,size: width/12.2,)
      ],
    ));
  }
}