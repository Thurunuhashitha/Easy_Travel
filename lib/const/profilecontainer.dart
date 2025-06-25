import 'package:easy_travel/const/my_color.dart';
import 'package:easy_travel/const/profileedit.dart';
import 'package:easy_travel/loginpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class profilecontainer extends StatefulWidget {
String txt;
IconData pic;

 profilecontainer({
    required this.txt,
    required this.pic,
    super.key
  
  
  });

  @override
  State<profilecontainer> createState() => _profilecontainerState();
}

class _profilecontainerState extends State<profilecontainer> {
  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    return Column(
      children: [
          GestureDetector(
            onTap: () async {
              if(widget.txt==" Personal information"){
                Navigator.of(context).push(MaterialPageRoute(builder:(context) {
                  return ProfileEditPage();
                },));
              }else if(widget.txt==" Sign out"){
                try {
              await FirebaseAuth.instance.signOut();
              Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => loginpage()),
      (route) => false,
    );
            } catch (e) {
              print("Error signing out: $e");
            }
              }
            },
            child: Container(
              decoration: BoxDecoration(
                color: MyColors.white,
              ),
              child: Row(
                children: [
                     Row(
                      children: [
                         Icon(widget.pic, size: width / 19.63, color: MyColors.remembercolour),
                         SizedBox(width: width / 30),
                         Text(widget.txt,style:TextStyle(fontSize: width / 24.54, color: MyColors.darkblue, fontWeight: FontWeight.w500),),
                  ],
               ),
                  Expanded(
                    child: Container(), 
                  ),
                  Icon(Icons.arrow_forward_ios, color: MyColors.darkblue, size: width / 28.54),
                ],
              ),
            ),
          ),

        SizedBox(height: height/59,),
        Container(
          width: double.infinity,
          child: Divider(
              color:MyColors.dividercolour ,
              indent:0,
              endIndent:0,
                ),
             ),
      ],
    );
  }
}