import 'package:easy_travel/const/my_color.dart';
import 'package:flutter/material.dart';

class itemcontainer extends StatefulWidget {
String imgpath;
String name;
String country;
String city;
String rate;


   itemcontainer({
    required this.imgpath,
    required this.name,
    required this.country,
    required this.city,
    required this.rate,

    super.key});

  @override
  State<itemcontainer> createState() => _itemcontainerState();
}

class _itemcontainerState extends State<itemcontainer> {
  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width; 
    return Stack(
      children:[
        Container(
          width: double.infinity,
          height: height/4.36,
          decoration: BoxDecoration(
           image: DecorationImage(image: NetworkImage(widget.imgpath),fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(26)
 
          ),
        )
        
        ,Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color.fromARGB(137, 0, 0, 0),
        borderRadius: BorderRadius.circular(26)
        ),
        child: Padding(
          padding:  EdgeInsets.only(right:width/20,left: width/20,top: height/30,bottom: height/35),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                   Container(
                    height:height/20.4 ,
                    width: width/10.3,
                    decoration: BoxDecoration(shape: BoxShape.circle,color: Color.fromARGB(210, 236, 236, 236)),
                    child: Center(
                      child: IconButton(onPressed:() {
                        
                      }, icon:Icon(Icons.bookmark,color: MyColors.white,size: width/15.5,)),
                    ),
                   )
                ],
              ),
              SizedBox(height: height/40,),
              Text(widget.name,style: TextStyle(color: MyColors.white,fontWeight: FontWeight.bold,fontSize: width/16.36),),
              Text("${widget.city},${widget.country}",style: TextStyle(color: MyColors.white,fontSize: width/28.05),),
              Row(
                children: [
                  Icon(Icons.star,size: width/22.5,color: MyColors.star,),
                  Icon(Icons.star,size: width/22.5,color: MyColors.star,),
                  Icon(Icons.star,size: width/22.5,color: MyColors.star,),
                  Icon(Icons.star,size: width/22.5,color: MyColors.star,),
                  Icon(Icons.star,size: width/22.5,color: MyColors.star,),
                  Text("(${widget.rate})",style: TextStyle(color: MyColors.white,fontSize: width/28.05),)
                ],
              )
      
            ],
          ),
        ),
      ),
      ]
    );
  
  }
}