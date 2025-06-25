import 'package:easy_travel/const/my_color.dart';
import 'package:flutter/material.dart';

class dividerbox extends StatelessWidget {
  const dividerbox({super.key});

  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                width: width/3.4,
                child: Divider(
                    color:MyColors.dividercolour ,
                    indent:0,
                    endIndent:width/39.3,
                ),
             ),
                 Center(child: Text("or continue with",style: TextStyle(color: MyColors.dividercolour,fontSize: width/24.5),)), 
                 Container(
                    width: width/3.4,
                    child: Divider(
                       color:MyColors.dividercolour ,
                       indent:width/39.3,
                       endIndent:0,
                     ),
                  ),                  
                ],
              );

  }
}