import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_travel/const/itemcontainer.dart';
import 'package:easy_travel/const/my_color.dart';
import 'package:easy_travel/profilepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  var searchtext='';
  String img='';
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
            backgroundColor: MyColors.white,
            appBar: AppBar(
                automaticallyImplyLeading: false,
                backgroundColor: Colors.transparent,
                title: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                      Text("Hi, ${userdataperson["name"]}!",style: TextStyle(color: MyColors.remembercolour,fontSize:width/24.5),),
                      SizedBox(height: height/80,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.location_on,size: width/19.6,color: MyColors.location,),
                          Text(userdataperson["location"],style: TextStyle(color: MyColors.location,fontSize:width/21.8,fontWeight: FontWeight.bold),),
                          Icon(Icons.arrow_drop_down,size: width/19.6,color: MyColors.location,),
                       ],
                      )
          
          
                  ],
                ),
          
                actions: [
          
                  Padding(
                    padding:  EdgeInsets.only(right: width/20),
                    child: Stack(
                      children:[
                        Icon(Icons.chat_bubble,color:MyColors.bellicon,size:width/12.5,),
                        Positioned(
                          top: height/310,
                          left: width/18,
                          child: Container(
                            height: height/80,
                            width: width/40,
                            decoration: BoxDecoration(shape:BoxShape.circle,color:Colors.green),
                          ),
                        )
                        
                      ],
                    
                    ),
                  ),            
                  Padding(
                    padding:  EdgeInsets.only(right: width/30),
                    child: Stack(
                      children:[
                        Icon(Icons.notifications,color:MyColors.bellicon,size:width/12.2,),
                        Positioned(
                          top: height/200,
                          left: width/21,
                          child: Container(
                            height: height/90,
                            width: width/40,
                            decoration: BoxDecoration(shape:BoxShape.circle,color:MyColors.red),
                          ),
                        )
                        
                      ],
                    
                    ),
                  ),
          
                ],
          
               ),
               //bottombar
               bottomNavigationBar: Container(
                height: height/12,
                 child: BottomNavigationBar(
                  backgroundColor: MyColors.white,
                  selectedLabelStyle: TextStyle(fontSize: 0),
                  unselectedLabelStyle: TextStyle(fontSize: 0),
                  items:[BottomNavigationBarItem(
                  
                  icon:IconButton(onPressed:() {
                    
                  }, icon: Icon(Icons.home,color: MyColors.forgetpassword)),
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
                   icon: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder:(context) {
                        return profilepage(img: userdataperson["image"]);
                      },));
                    },
                     child: Container(
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
                   ),
                   label: '',
                 )
                   
                  
                 
                  
                  ]),
               ),
               body: SingleChildScrollView(
                 child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                      Padding(
                        padding:  EdgeInsets.only(right: width/20,left: width/20,top: height/25),
                        child: Container(
                            height: height/13.62,
                            decoration: BoxDecoration(boxShadow: [BoxShadow(blurRadius: 2,color: Color.fromARGB(255, 212, 212, 212),blurStyle: BlurStyle.outer)],borderRadius: BorderRadius.circular(16)),
                            child: TextField(
                              onChanged: (value) {
                                setState(() {
                                 searchtext=value;
                                 
                                });
                                searchtext=value;
                              },
                              keyboardType: TextInputType.name,
                              cursorColor: MyColors.black,
                              decoration: InputDecoration(
                                hintText: "Sri lanka",
                                prefixIcon: Icon(Icons.search,color: MyColors.black,size: width/16.36,),
                                hintStyle: TextStyle(color: MyColors.focusbordercolour,fontSize: width/24.5),
                                focusedBorder: OutlineInputBorder(
                                 borderRadius: BorderRadius.circular(16),
                                 borderSide: BorderSide(color: Colors.transparent)
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide: BorderSide(color: Colors.transparent),
                                )
                              ),
                              
                            ),
                          ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: width/20,left: width/20,top: height/30),
                        child: Container(
                          height: height/1.6,
                          child: StreamBuilder<QuerySnapshot>(
                            stream:FirebaseFirestore.instance.collection("travel").where("country",isGreaterThanOrEqualTo:searchtext).where("country",isLessThan: '${searchtext}z').snapshots(),
                            builder: (context, snapshot) {
                              if(snapshot.hasError){
                                return Text("Connection Error");
                              }
                              if(snapshot.connectionState==ConnectionState.waiting){
                                return Text("Loading....");
                              }
                              var travelldoc=snapshot.data!.docs;
                 
                              return ListView.builder(
                                itemCount: travelldoc.length,
                                itemBuilder:(context, index) {
                                  return Padding(
                                    padding:  EdgeInsets.only(bottom: height/30),
                                    child: itemcontainer(
                                      imgpath: travelldoc[index]['imgpath'], 
                                      name: travelldoc[index]["name"], 
                                      country: travelldoc[index]["country"], 
                                      city: travelldoc[index]["city"], 
                                      rate: travelldoc[index]["rate"]
                                      ),
                                  );
                                },
                                
                                );
                            },
                          ),
                        ),
                      )
                      
                  ],
                 ),
               ),
          
          );
      }else if(snapshot.hasError){
     return Center(
    
     child: Text("Error${snapshot.error}"));       
      } else {
          return CircularProgressIndicator();
        }
        }
      
    );
  }
}