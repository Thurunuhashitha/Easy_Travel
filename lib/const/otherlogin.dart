import 'package:easy_travel/const/my_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class otherlogin extends StatelessWidget {
  String img;
  double Height;
  double Width;
  int radiuss;
  Color colourss;

   otherlogin({
    required this.img,
    required this.Height,
    required this.Width,
    required this.radiuss,
    required this.colourss,



    super.key});

  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color:colourss)
      ),
      child: Padding(
        padding:  EdgeInsets.only(top:height/39,left:width/16.4,right: width/16.4,bottom: height/39),
        child: Container(
          height: Height,
          width: Width,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(img),fit: BoxFit.contain)
          ),
        ),
      ),
    );
  }
}