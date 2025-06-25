import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_travel/const/my_color.dart';
import 'package:file_picker/file_picker.dart' as file_picker;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProfileEditPage extends StatefulWidget {
  const ProfileEditPage({Key? key}) : super(key: key);

  @override
  State<ProfileEditPage> createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {
  final newname = TextEditingController();
  final newemail = TextEditingController();
  final phonenumber = TextEditingController();
  final location = TextEditingController();
late File? _image = null;

void _pickImage() async {
  file_picker.FilePickerResult? result = await file_picker.FilePicker.platform.pickFiles(
    type: file_picker.FileType.image,
  );

  if (result != null) {
    setState(() {
      _image = File(result.files.single.path!);
    });
  } else {

  }
}

  @override
  Widget build(BuildContext context) {
    final currentuser = FirebaseAuth.instance.currentUser!;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    
    return StreamBuilder<DocumentSnapshot>(
      stream: FirebaseFirestore.instance.collection("users").doc(currentuser.email!).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final userdataperson = snapshot.data!.data() as Map<String, dynamic>;
          newname.text = userdataperson["name"];
          newemail.text = userdataperson["email"];
          phonenumber.text = userdataperson["phoneNumber"];
          location.text = userdataperson["location"];
          return SafeArea(
            child: Scaffold(
              backgroundColor: MyColors.white,
              appBar: AppBar(
                backgroundColor: Colors.white,
                automaticallyImplyLeading: false,
                leading: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(Icons.arrow_back_ios, size: width / 30, color: MyColors.darkblue),
                ),
                title: Center(
                  child: Text(
                    "Edit personal info",
                    style: TextStyle(fontSize: width / 19.65, color: MyColors.darkblue),
                  ),
                ),
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(right: width / 30, left: width / 30, top: height / 20),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              _pickImage();
                            },
                            child: CircleAvatar(
              radius: width / 13.01,
              backgroundImage: _image != null ? FileImage(_image!) as ImageProvider : NetworkImage(userdataperson["image"]),
            ),
            
                          ),
                          SizedBox(
                            width: width / 30,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.camera_alt,
                                size: width / 24.54,
                                color: MyColors.forgetpassword,
                              ),
                              SizedBox(
                                width: width / 45,
                              ),
                              GestureDetector(
                                onTap: () {
                                  _pickImage();
                                },
                                child: Text(
                                  "Update photo",
                                  style:TextStyle(color: MyColors.forgetpassword, fontWeight: FontWeight.w500, fontSize: width / 24.54),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: height / 28),
                        child: Container(
                          height: height / 15.62,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: MyColors.black, width: 2),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: width / 30, top: height / 60),
                            child: Text(
                              userdataperson["email"],
                              style: TextStyle(color: MyColors.darkblue, fontSize: width / 24.54),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: height / 70),
                        child: Container(
                          height: height / 15.62,
                          child: TextField(
                            controller: newname,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              hintText: "name",
                              hintStyle: TextStyle(color: MyColors.focusbordercolour, fontSize: width / 24.5),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide(color: MyColors.black),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide(color: MyColors.enablebordercolour),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height / 70,
                      ),
                      Container(
                        height: height / 15.62,
                        child: TextField(
                          controller: phonenumber,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: "Mobile Number",
                            hintStyle: TextStyle(color: MyColors.focusbordercolour, fontSize: width / 24.5),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(color: MyColors.black),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(color: MyColors.enablebordercolour),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height / 70,
                      ),
                      Container(
                        height: height / 15.62,
                        child: TextField(
                          controller: location,
                          keyboardType: TextInputType.streetAddress,
                          decoration: InputDecoration(
                            hintText: "Location",
                            hintStyle: TextStyle(color: MyColors.focusbordercolour, fontSize: width / 24.5),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(color: MyColors.black),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(color: MyColors.enablebordercolour),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: height / 40),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: MyColors.buttonblue,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                            fixedSize: Size(width, height / 15.6),
                          ),
                          onPressed: () {
                            _updateUserData();
                          },
                          child: Text(
                            "Save",
                            style: TextStyle(color: MyColors.white, fontSize: width / 21.8),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text("Error${snapshot.error}"),
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }



  void _updateUserData() async {
    final currentuser = FirebaseAuth.instance.currentUser!;
    final newData = {
      "name": newname.text,
      "email": newemail.text,
      "phoneNumber": phonenumber.text,
      "location": location.text,
    };

    try {
      if (_image != null) {
        final storageRef = FirebaseStorage.instance.ref().child('user_images').child('${currentuser.uid}.jpg');
        await storageRef.putFile(_image!);

        final imageUrl = await storageRef.getDownloadURL();

        newData["image"] = imageUrl;
      }

      await FirebaseFirestore.instance.collection("users").doc(currentuser.email!).update(newData);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Profile updated successfully"),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Failed to update profile: $e"),
        ),
      );
    }
  }
}
