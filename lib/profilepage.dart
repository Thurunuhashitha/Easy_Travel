import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_travel/const/my_color.dart';
import 'package:easy_travel/const/profilecontainer.dart';
import 'package:easy_travel/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class profilepage extends StatefulWidget {
  String img;
  profilepage({

  required this.img,  
  super.key});

  @override
  State<profilepage> createState() => _profilepageState();
}

class _profilepageState extends State<profilepage> {
  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width; 
    final currentuser=FirebaseAuth.instance.currentUser!;

    return StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance.collection("users").doc(currentuser.email!).snapshots(),
        builder:(context, snapshot) {
         if(snapshot.hasData){
           final userdataperson=snapshot.data!.data() as Map<String, dynamic>;
          return Scaffold(
                     bottomNavigationBar: Container(
                height: height/12,
                 child: BottomNavigationBar(
                  backgroundColor: MyColors.white,
                  selectedLabelStyle: TextStyle(fontSize: 0),
                  unselectedLabelStyle: TextStyle(fontSize: 0),
                  items:[BottomNavigationBarItem(
                  
                  icon:IconButton(onPressed:() {
                    Navigator.of(context).push(MaterialPageRoute(builder:(context) {
                      return homepage();
                    },));
                  }, icon: Icon(Icons.home,color: MyColors.remembercolour)),
                     label:''
                  ),
                  BottomNavigationBarItem(
                  
                  icon:IconButton(onPressed:() {}, 
                     icon: Icon(Icons.bookmark,color: MyColors.remembercolour)),
                     label:''
                  
                  ),
                   BottomNavigationBarItem(
                  
                  icon:IconButton(onPressed:() {
                    
                  }, icon: Icon(Icons.receipt,color: MyColors.remembercolour)),
                     label:''
                  
                  ),
                 BottomNavigationBarItem(
                   icon: Container(
                     height: height/39.05,
                     width: width/19.6,
                     decoration: BoxDecoration(
                       shape: BoxShape.circle,
                       image: DecorationImage(
                         image: NetworkImage(userdataperson["image"]),
                         fit: BoxFit.contain,
                       ),
                     ),
                   ),
                   label: '',
                 )
                   
                  
                 
                  
                  ]),
               ),
            backgroundColor: MyColors.white,
            body: SingleChildScrollView(
              child: Padding(
                padding:  EdgeInsets.only(top: height/10.55,left: width/19.63,right: width/19.63),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: height/13,
                          width: width/6.5,
                          decoration: BoxDecoration(shape: BoxShape.circle,image: DecorationImage(image: NetworkImage(userdataperson["image"]),fit: BoxFit.contain)),
                        ),
                        SizedBox(width: width/30,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(userdataperson["name"],style:TextStyle(color: MyColors.darkblue,fontSize: width/16.3,fontWeight: FontWeight.bold),),
                            Row(
                              children: [
                                Text("{\$ - USD} ",style: TextStyle(color: MyColors.remembercolour,fontSize: width/24.5),),
                                Text(" Change currency >>",style: TextStyle(color: MyColors.forgetpassword,fontSize: width/24.5,fontWeight: FontWeight.w500),)
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                    Padding(
                      padding:  EdgeInsets.only(top: height/34),
                      child: Container(
                          width: double.infinity,
                          child: Divider(
                             color:MyColors.dividercolour ,
                             indent:0,
                             endIndent:0,
                        ),
                                   ),
                    ),
                    Padding(
                      padding:  EdgeInsets.only(top: height/59),
                      child: profilecontainer(txt: ' Personal information', pic: Icons.person_2_outlined,),
                    ),
                    SizedBox(height: height/59,),
                    profilecontainer(txt: ' Payment history', pic: Icons.layers,),
                    SizedBox(height: height/59,),
                    profilecontainer(txt: ' Payment method', pic: Icons.wallet,),              
                    SizedBox(height: height/59,),
                    profilecontainer(txt: ' Promocodes', pic: Icons.code,),
                    SizedBox(height: height/59,),
                    profilecontainer(txt: ' My bookings', pic: Icons.shopping_bag,),               
                    SizedBox(height: height/59,),
                    profilecontainer(txt: ' List your Agency', pic: Icons.list,),
                    SizedBox(height: height/59,),
                    profilecontainer(txt: ' FAQ', pic: Icons.question_answer,),
                    SizedBox(height: height/59,),
                    profilecontainer(txt: ' Sign out', pic: Icons.logout,),
                  ],
                ),
              ),
            ),
          );
        }else if(snapshot.hasError){
            return Center(
                child: Text("Error${snapshot.error}"),
           );
         }
        return const Center(
           child: CircularProgressIndicator()
        );    
      }
    );
  }
}