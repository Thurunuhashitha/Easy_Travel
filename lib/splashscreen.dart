import 'package:easy_travel/const/Createbutton.dart';
import 'package:easy_travel/const/my_color.dart';
import 'package:easy_travel/homepage.dart';
import 'package:easy_travel/loginpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class splashscreen extends StatefulWidget {
  const splashscreen({super.key});

  @override
  State<splashscreen> createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {
var auth=FirebaseAuth.instance;

var isLogin=false;

checkiflogin() async{
auth.authStateChanges().listen((User? user) { 

if (user !=null && mounted) {

  setState(() {
    isLogin=true;

  });

}


});
  }

  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    print(width);
    return Scaffold(
            body:Stack(
              children:[ Container(
                decoration: BoxDecoration(
                  image: DecorationImage(image:AssetImage("sourcess/background.png"),fit: BoxFit.cover)
                ),
                
              ),
    
              Padding(
                padding:  EdgeInsets.only(top:height/13.7),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                  padding:  EdgeInsets.only(left:width/3.2,right:width/3.2),
                        child: Container(
                          decoration: BoxDecoration(
                          color: MyColors.white,
                          borderRadius: BorderRadius.circular(30)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                            Container(
                              height: height/20,
                              width: width/12,
                              decoration: BoxDecoration(image: DecorationImage(image: AssetImage("sourcess/splashlogo.png"),fit:BoxFit.contain)),  
                            ),
                            SizedBox(width:width/56,),
                            Container(
                              height: height/41,
                              width: width/5,
                              decoration: BoxDecoration(image: DecorationImage(image: AssetImage("sourcess/EasyTravelz.png"),fit:BoxFit.contain)),  
                            ),                          
                          ],),
                        ),
                      ),
                      Padding(
                        padding:  EdgeInsets.only(top: height/1.83),
                        child: Text("Let’s explore\nthe world with us",style: TextStyle(color:MyColors.white,fontSize:width/10.9,fontWeight:FontWeight.bold,),textAlign:TextAlign.center,),
                      ),
                      Container(
                        height: height/5.0,
                        color: Color.fromARGB(148, 0, 0, 0),
                        child: Column(
                          children: [
                            Text("World largest digital travelling supporter",style: TextStyle(color:MyColors.white,fontSize:width/24.5,)),
                            Padding(
                               padding:EdgeInsets.only(left: width/25,right: width/25,top: height/24,bottom: height/105),
                               child:  ElevatedButton(
                                         style: ElevatedButton.styleFrom(backgroundColor:MyColors.buttonblue,shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))),
                                         onPressed:() {
                                          checkiflogin();
                                              Navigator.of(context).push(MaterialPageRoute(builder:(context) {
                                              return isLogin ? homepage(): loginpage();
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
    ))
                      )                    
                  
                          ],
                        ),
                      ),  
    
                    ],
                  ),
                ),
              )
              ]
            ) ,
    );
  }
}