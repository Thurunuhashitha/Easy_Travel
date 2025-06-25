import 'package:easy_travel/const/dividerbox.dart';
import 'package:easy_travel/const/my_color.dart';
import 'package:easy_travel/const/otherlogin.dart';
import 'package:easy_travel/const/pagebuttons.dart';
import 'package:easy_travel/homepage.dart';
import 'package:easy_travel/singuppage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class loginpage extends StatefulWidget {
  const loginpage({super.key});

  @override
  State<loginpage> createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {
final email=TextEditingController();
final password=TextEditingController();
bool _password=true;
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
         title: Center(child: Text("Sing in",style:TextStyle(fontSize:width/19.65,color:MyColors.darkblue,fontWeight:FontWeight.bold),)),
      ),
      body: SingleChildScrollView(
       child: Padding(
         padding:EdgeInsets.only(left:width/20,right: width/20),
         child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              Padding(
                padding:  EdgeInsets.only(top:height/12),
                child: Text("Welcome\nback!",style:TextStyle(color: MyColors.darkblue,fontSize:width/8.1,fontWeight:FontWeight.bold,shadows:[Shadow(blurRadius:2,color:MyColors.black,offset: Offset.zero)]),),
              ),
              Padding(
                padding:  EdgeInsets.only(top: height/28),
                child: Container(
                  height: height/15.62,
                  child: TextField(
                    controller:email,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: "Enter Email",
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
                    hintText: "Enter Password",
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
                padding:  EdgeInsets.only(top: height/65),
                child: Container(
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Checkbox(
                            value: _isChecked,
                            side: BorderSide(color: MyColors.forgetpassword),
                            checkColor: MyColors.blue,
                            activeColor: Colors.transparent,
                            onChanged: (bool? value) {
                              setState(() {
                                _isChecked = value!;
                              });
                            }
                          ),
                          Text("Remember me",style: TextStyle(color: MyColors.remembercolour,fontSize:width/24.5),),
                        ],
                      ),                        
                          GestureDetector(
                            child: Text("Forgot password?",style: TextStyle(fontSize: width/24.5,color:MyColors.forgetpassword),)),
                  
                    ],
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
                              singin();
                             }, 
          child:Text("Sign In",style: TextStyle(color:MyColors.white,fontSize:width/21.8),)
    )
              ),
              Padding(
                padding:  EdgeInsets.only(top:height/40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                      Text("No account?",style: TextStyle(color:MyColors.remembercolour,fontSize:width/24.5)),
                      GestureDetector(
                        onTap:() {
                          Navigator.of(context).push(MaterialPageRoute(builder:(context) {
                            return singuppage();
                          },));
                        }, 
                        child: Text(" Register now",style: TextStyle(color:MyColors.forgetpassword,fontSize:width/24.5))),
                
                ],),
              ),
              Padding(
                padding:  EdgeInsets.only(top: height/65),
                child: dividerbox(),
              ),
              Padding(
                padding:  EdgeInsets.only(left: width/10.2,right: width/10.2,top: height/40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    otherlogin(img: 'sourcess/facebook.png', Height: height/39, Width: width/36.3, radiuss: 22, colourss: MyColors.forgetpassword,),
                    otherlogin(img: 'sourcess/twitter.png', Height: height/42.3, Width: width/29.1, radiuss: 22, colourss: MyColors.forgetpassword,),
                    otherlogin(img: 'sourcess/G+.png', Height: height/48.2, Width: width/25.2, radiuss: 22, colourss:MyColors.forgetpassword,)
                  ],
                ),
              )
                
          ],
         ),
       ),
      ),

    );
  }
  Future singin() async{

    try {
  await FirebaseAuth.instance.signInWithEmailAndPassword
(
email: email.text.trim(), 

password: password.text.trim()

);
Navigator.of(context).push(MaterialPageRoute(builder:(context) {
  return homepage();
},));
      
    }on FirebaseAuthException catch (e) {
      
 showDialog(context: context, 
  
  builder:(context) {
    return AlertDialog(
      iconPadding: EdgeInsets.only(bottom:0,right: 20),
      title: Center(child: Text("Invalid Email or Password!\nTry again",style: TextStyle(fontSize: 15),)),
      icon: IconButton(onPressed:() {
      Navigator.of(context).pop();
      }, icon: Icon(Icons.close,size: 15,),alignment: Alignment.topRight,)
      
     );

  },
  
  
  );

      
    }


  }
}