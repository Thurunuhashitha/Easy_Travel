import 'package:easy_travel/const/my_color.dart';
import 'package:easy_travel/homepage.dart';
import 'package:flutter/material.dart';

class pagebuttons extends StatefulWidget {
  String txt;
  pagebuttons({
    
    required this.txt,
    super.key});

  @override
  State<pagebuttons> createState() => _pagebuttonsState();
}

class _pagebuttonsState extends State<pagebuttons> {
  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: MyColors.buttonblue,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        fixedSize: Size(width, height/15.6)
      ),
      onPressed:() {
      Navigator.of(context).push(MaterialPageRoute(builder:(context) {
        return homepage();
      },));
      }, 
          child:Text(widget.txt,style: TextStyle(color:MyColors.white,fontSize:width/21.8),)
    );
  }
}