import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_travel/const/dividerbox.dart';
import 'package:easy_travel/const/my_color.dart';
import 'package:easy_travel/const/otherlogin.dart';
import 'package:easy_travel/const/pagebuttons.dart';
import 'package:easy_travel/homepage.dart';
import 'package:easy_travel/loginpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class singuppage extends StatefulWidget {
  const singuppage({super.key});

  @override
  State<singuppage> createState() => _singuppageState();
}
class _singuppageState extends State<singuppage> {
final email=TextEditingController();
final password=TextEditingController();
final confirm=TextEditingController();
final name=TextEditingController();
bool _password=true;
bool _confirm=true;
bool _isChecked=false;


  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor:MyColors.white,
      appBar: AppBar(
         leading: IconButton(onPressed:() {
           Navigator.of(context).pop();
         }, icon:Icon(Icons.arrow_back_ios,size:width/30,color: MyColors.darkblue,)),
         backgroundColor:MyColors.white,
         title: Center(child: Text("Sing up",style:TextStyle(fontSize:width/19.65,color:MyColors.darkblue,fontWeight:FontWeight.bold),)),
      ),
      body: SingleChildScrollView(
       child: Padding(
         padding:EdgeInsets.only(left:width/20,right: width/20),
         child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              Padding(
                padding:  EdgeInsets.only(top:height/12),
                child: Text("Sign up!",style: TextStyle(color: MyColors.darkblue,fontSize:width/8.1,fontWeight:FontWeight.bold,shadows:[Shadow(blurRadius:2,color:MyColors.black,offset: Offset.zero)]),),
              ),
              Padding(
                padding:  EdgeInsets.only(top: height/28),
                child: Container(
                  height: height/15.62,
                  child: TextField(
                    controller:name,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      hintText: "Enter your Name",
                      hintStyle: TextStyle(color: MyColors.focusbordercolour,fontSize: width/24.5),
                      focusedBorder: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(16),
                       borderSide: BorderSide(color: MyColors.black)
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(color: MyColors.enablebordercolour),
                      )
                    ),
                    
                  ),
                ),
              ),
              Padding(
                padding:  EdgeInsets.only(top: height/70),
                child: Container(
                  height: height/15.62,
                  child: TextField(
                    controller:email,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: "Enter a Email",
                      hintStyle: TextStyle(color: MyColors.focusbordercolour,fontSize: width/24.5),
                      focusedBorder: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(16),
                       borderSide: BorderSide(color: MyColors.black)
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(color: MyColors.enablebordercolour),
                      )
                    ),
                    
                  ),
                ),
              ),
              SizedBox(height:height/70,),
              Container(
                height: height/15.62,
                child: TextField(
                  controller:password,
                  obscureText: _password,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                  suffixIcon:IconButton(onPressed:() {
                    setState(() {
                    _password=!_password;

                    });
                    },icon:Icon(_password? Icons.visibility_off:Icons.visibility,color: MyColors.darkblue,size: width/24.5,)),
                    hintText: "Enter your Password",
                    hintStyle: TextStyle(color: MyColors.focusbordercolour,fontSize: width/24.5),
                    focusedBorder: OutlineInputBorder(
                     borderRadius: BorderRadius.circular(16),
                     borderSide: BorderSide(color: MyColors.black)
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(color: MyColors.enablebordercolour),
                    )
                  ),
                  
                ),
              ),

            SizedBox(height:height/70,),
              Container(
                height: height/15.62,
                child: TextField(
                  controller:confirm,
                  obscureText: _confirm,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                  suffixIcon:IconButton(onPressed:() {
                    setState(() {
                    _confirm=!_confirm;

                    });
                    },icon:Icon(_confirm? Icons.visibility_off:Icons.visibility,color: MyColors.darkblue,size: width/24.5,)),
                    hintText: "Confirm your Password",
                    hintStyle: TextStyle(color: MyColors.focusbordercolour,fontSize: width/24.5),
                    focusedBorder: OutlineInputBorder(
                     borderRadius: BorderRadius.circular(16),
                     borderSide: BorderSide(color: MyColors.black)
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(color: MyColors.enablebordercolour),
                    )
                  ),
                  
                ),
              ),
              Padding(
                padding:  EdgeInsets.only(top:height/40),
                child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                          backgroundColor: MyColors.buttonblue,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                          fixedSize: Size(width, height/15.6)
                                    ),
                           onPressed:() {
                                Singupcheck();
                             }, 
          child:Text("Sign Up",style: TextStyle(color:MyColors.white,fontSize:width/21.8),)
    ),
              ),
              Padding(
                padding:  EdgeInsets.only(top:height/40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                      Text("Already have an account ?",style: TextStyle(color:MyColors.remembercolour,fontSize:width/24.5)),
                      GestureDetector(
                        onTap:() {
                          Navigator.of(context).push(MaterialPageRoute(builder:(context) {
                            return loginpage();
                          },));
                        }, 
                        child: Text(" Sign In",style: TextStyle(color:Color.fromARGB(255, 26, 218, 148),fontSize:width/24.5))),
                
                ],),
              ),
              Padding(
                padding:  EdgeInsets.only(right: width/8.2,top: height/40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Or use: ",style: TextStyle(color:MyColors.remembercolour,fontSize:width/24.5)),
                    otherlogin(img: 'sourcess/facebook.png', Height: height/39, Width: width/36.3, radiuss: 10, colourss: MyColors.enablebordercolour,),
                    otherlogin(img: 'sourcess/twitter.png', Height: height/42.3, Width: width/29.1, radiuss: 10, colourss: MyColors.enablebordercolour,),
                    otherlogin(img: 'sourcess/G+.png', Height: height/48.2, Width: width/25.2, radiuss: 10, colourss: MyColors.enablebordercolour,)
                  ],
                ),
              )
                
          ],
         ),
       ),
      ),

    );
  }
   Future Singupcheck() async {

           if(passwordconfirm()){
                   try {
                    UserCredential userCredential=
                    await FirebaseAuth.instance.createUserWithEmailAndPassword(
                    email:email.text.trim(), 
                    password:password.text.trim()
                           );
                      FirebaseFirestore.instance.collection("users").doc(userCredential.user!.email!).set(
  
                       {'name':name.text.trim(),
                        'email':email.text.trim(),
                        "image":'https://toppng.com/uploads/preview/person-vector-11551054765wbvzeoxz2c.png',
                        "phoneNumber":"123456789",
                        "location":"Sydney, Australia "
                        }
                        );
                             Navigator.of(context).push(MaterialPageRoute(builder:(context) {    
                                 return const homepage();

                              },));

                    }on FirebaseAuthException catch(e) {
     
                           showDialog(context: context, 
                            builder:(context) {
                              return AlertDialog(
                                iconPadding: EdgeInsets.only(bottom:0,right: 20),
                                title: Center(child: Text("${e.message}",style: TextStyle(fontSize: 15),)),
                                icon: IconButton(onPressed:() {
                                      Navigator.of(context).pop();
                                       }, icon: Icon(Icons.close,size: 15,),alignment: Alignment.topRight,)
      
                              );

                            },
  
  
                            );
                      }
                       

            }else{
  showDialog(
    
    context: context, 
  
  builder:(context) {
    return AlertDialog(
      iconPadding: EdgeInsets.only(bottom:0,right: 20),
      title: Center(child: Text("Password dosen't match!",style: TextStyle(fontSize: 15),)),
      icon: IconButton(onPressed:() {
      Navigator.of(context).pop();
      }, icon: Icon(Icons.close,size: 15,),alignment: Alignment.topRight,)
      
     );

  },
  
  
  );
}

                
       } 
       bool passwordconfirm(){

            if(password.text.trim()==confirm.text.trim()){

                  return true;
                     }else{
                        return false;

                      }
             }
             
}