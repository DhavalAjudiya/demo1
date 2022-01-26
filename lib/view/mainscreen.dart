// import 'dart:io';
//
// import 'package:cloud_firestore/cloud_firestore.dart' as firebase_storage;
// import 'package:dmeo1/contant/const.dart';
// import 'package:dmeo1/repo/ragitration_repo.dart';
// import 'package:dmeo1/view/Homescreen.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:image_picker/image_picker.dart';
//
// class userprofile extends StatefulWidget {
//   @override
//   _userprofileState createState() => _userprofileState();
// }
//
// class _userprofileState extends State<userprofile> {
//   // File _image;
//   bool boxvalue = true;
//   bool boxvalueis = false;
//   bool _value = false;
//   int val = 0;
//
//   File? _image;
//   final picker = ImagePicker();
//
//   Future? getImage() async {
//     final pickedFile = await picker.getImage(source: ImageSource.camera);
//     setState(() {
//       if (pickedFile != null) {
//         _image = File(pickedFile.path);
//         print("image?${_image!.path}");
//         Navigator.pop(context);
//       } else {
//         print("no image Selected ");
//       }
//     });
//   }
//
//   Future? openGallery() async {
//     final pickedFile = await picker.getImage(source: ImageSource.gallery);
//     setState(() {
//       if (pickedFile != null) {
//         _image = File(pickedFile.path);
//         print("image?${_image!.path}");
//         Navigator.pop(context);
//       } else {
//         print("no image Selected ");
//       }
//     });
//   }
//
//   final _email = TextEditingController();
//   final _name = TextEditingController();
//   final _lastname = TextEditingController();
//   final _phone = TextEditingController();
//   final _city = TextEditingController();
//   final _pass = TextEditingController();
//   final formKey = GlobalKey<FormState>();
//
//   // CollectionReference _usercollection =
//   //     FirebaseFirestore.instance.collection("users");
//
//   Future<String?> uploadFile(File file, String filename) async {
//     print("File path:${file.path}");
//     try {
//       var response =
//           await kFirebaseStorage.ref("user_image/$filename").putFile(file);
//       return response.storage.ref("user_image/$filename").getDownloadURL();
//     } on firebase_storage.FirebaseException catch (e) {
//       print(e);
//     }
//   }
//
//   clearImage() {
//     setState(() {
//       print("remove:$_image");
//       _image = null;
//     });
//   }
//
//   @override
//   void dispose() {
//     _email.dispose();
//     _pass.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final screen = MediaQuery.of(context).size;
//     return Container(
//       width: screen.width * 1,
//       height: screen.height * 1,
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//           stops: [0.1, 0.4, 0.12, 0.9],
//           colors: [
//             // Colors.blue,
//             // Colors.white,
//             // Colors.white,
//             //  Colors.white,
//             Color(0XFF61CEFF),
//             Color(0XFFF8F0E3),
//             Color(0XFFF8F0E3),
//             Color(0XB3FFFFFF),
//           ],
//         ),
//       ),
//       child: Scaffold(
//         backgroundColor: Colors.transparent,
//         body: SingleChildScrollView(
//           child: Column(
//             children: [
//               SizedBox(
//                 height: screen.height * 0.055,
//               ),
//               Center(
//                 child: MaterialButton(
//                   onPressed: () {
//                     showModalBottomSheet(
//                         backgroundColor: Colors.grey,
//                         context: context,
//                         builder: (builder) {
//                           return Container(
//                             height: screen.height * 0.12,
//                             color: Color(0XFF61CEFF),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                               children: [
//                                 IconButton(
//                                   onPressed: getImage,
//                                   icon: Icon(
//                                     Icons.camera_alt,
//                                     size: 40,
//                                     color: Colors.black,
//                                   ),
//                                 ),
//                                 IconButton(
//                                   onPressed: openGallery,
//                                   icon: Icon(
//                                     Icons.panorama,
//                                     size: 40,
//                                     color: Colors.black,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           );
//                         });
//                   },
//                   child: Container(
//                     child: _image == null
//                         ? Center(
//                             child: Text("Image Not Found"),
//                           )
//                         : Image.file(
//                             _image!,
//                             fit: BoxFit.cover,
//                           ),
//                     height: screen.height * 0.25,
//                     width: screen.width * 0.5,
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(height: screen.height * 0.06),
//               Text(
//                 'Setup your profile',
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               ),
//               SizedBox(
//                 height: screen.height * 0.02,
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(right: 10, left: 10),
//                 child: Text(
//                   'Update your profile to connect your doctor with better impression',
//                   style: TextStyle(
//                     fontSize: 18,
//                   ),
//                 ),
//               ),
//               SizedBox(height: screen.height * 0.03),
//               Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.only(left: 13),
//                     child: Text(
//                       'Registration',
//                       style:
//                           TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
//                     ),
//                   )
//                 ],
//               ),
//               SizedBox(height: screen.height * 0.02),
//               Form(
//                 key: formKey,
//                 child: Padding(
//                   padding: const EdgeInsets.only(left: 12, right: 12),
//                   child: Column(
//                     children: [
//                       Row(
//                         children: [
//                           Container(
//                             child: TextFormField(
//                               controller: _name,
//                               autovalidateMode:
//                                   AutovalidateMode.onUserInteraction,
//                               validator: (value) {
//                                 if (value!.isEmpty) {
//                                   return "enter name";
//                                 } else {
//                                   return null;
//                                 }
//                               },
//                               decoration:
//                                   InputDecoration(hintText: 'First Name'),
//                             ),
//                             height: screen.height * 0.06,
//                             width: screen.width * 0.45,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                           ),
//                           Container(
//                             child: TextFormField(
//                               controller: _lastname,
//                               autovalidateMode:
//                                   AutovalidateMode.onUserInteraction,
//                               validator: (value) {
//                                 if (value!.isEmpty) {
//                                   return "enter name";
//                                 } else {
//                                   return null;
//                                 }
//                               },
//                               decoration:
//                                   InputDecoration(hintText: 'Last Name'),
//                             ),
//                             height: screen.height * 0.06,
//                             width: screen.width * 0.45,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                           )
//                         ],
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       ),
//                       SizedBox(height: screen.height * 0.01),
//                       TextFormField(
//                         controller: _email,
//                         autovalidateMode: AutovalidateMode.onUserInteraction,
//                         validator: (value) {
//                           if (value!.isEmpty) {
//                             return "enter your Email";
//                           } else {
//                             return null;
//                           }
//                         },
//                         decoration: InputDecoration(hintText: 'Email'),
//                       ),
//                       SizedBox(height: screen.height * 0.01),
//                       TextFormField(
//                         controller: _phone,
//                         inputFormatters: [LengthLimitingTextInputFormatter(10)],
//                         autovalidateMode: AutovalidateMode.onUserInteraction,
//                         validator: (value) {
//                           if (value!.length < 10) {
//                             return "enter your Number";
//                           } else {
//                             return null;
//                           }
//                         },
//                         decoration: InputDecoration(hintText: 'Phone Number'),
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceAround,
//                         children: [
//                           Text(
//                             "Gender",
//                             style: TextStyle(fontSize: 18),
//                           ),
//                           Radio(
//                             value: 1,
//                             groupValue: val,
//                             onChanged: (value) {
//                               setState(() {
//                                 val = (value) as int;
//                               });
//                             },
//                           ),
//                           Text("Male"),
//                           Radio(
//                             value: 2,
//                             groupValue: val,
//                             onChanged: (value) {
//                               setState(() {
//                                 val = (value) as int;
//                               });
//                             },
//                           ),
//                           Text("FeMale"),
//                         ],
//                       ),
//                       SizedBox(
//                         height: screen.height * 0.02,
//                       ),
//                       TextFormField(
//                         controller: _city,
//                         autovalidateMode: AutovalidateMode.onUserInteraction,
//                         validator: (value) {
//                           if (value!.isEmpty) {
//                             return "enter your City";
//                           } else {
//                             return null;
//                           }
//                         },
//                         decoration: InputDecoration(
//                             // suffixIcon: DropdownButton<String>(
//                             //   items: City.map((String value) {
//                             //     return DropdownMenuItem<String>(
//                             //       value: value,
//                             //       child: new Text(value),
//                             //       onTap: () {
//                             //         setState(() {
//                             //           _city.text = value;
//                             //         });
//                             //       },
//                             //     );
//                             //   }).toList(),
//                             //   onChanged: (_) {},
//                             // ),
//                             contentPadding: EdgeInsets.symmetric(vertical: 10),
//                             hintText: 'City'),
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceAround,
//                         children: [
//                           Text(
//                             'Hobbies',
//                             style: TextStyle(fontSize: 18),
//                           ),
//                           Checkbox(
//                               checkColor: Colors.white,
//                               value: boxvalue,
//                               onChanged: (bool? value) {
//                                 setState(() {
//                                   boxvalue = value!;
//                                 });
//                               }),
//                           Text(
//                             'Singing',
//                             style: TextStyle(fontSize: 18),
//                           ),
//                           Checkbox(
//                               checkColor: Colors.white,
//                               value: boxvalueis,
//                               onChanged: (bool? value) {
//                                 setState(() {
//                                   boxvalueis = value!;
//                                 });
//                               }),
//                           Text(
//                             'Dancing',
//                             style: TextStyle(fontSize: 18),
//                           ),
//                         ],
//                       ),
//                       SizedBox(height: screen.height * 0.02),
//                       GestureDetector(
//                         onTap: () async {
//                           if (formKey.currentState!.validate()) {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => HomeScreen(),
//                               ),
//                             );
//                             String? imageUrl =
//                                 await uploadFile(_image!, '${_name.text}.jpg');
//                             print("image url: $imageUrl");
//
//                             // AuthRepo.registrationRepo(
//                             //     email: _email.text, pass: _pass.text);
//
//                             print(
//                                 'current user ${FirebaseAuth.instance.currentUser!.uid}');
//
//                             userDataCollection
//                                 .doc(
//                                     '${FirebaseAuth.instance.currentUser!.uid}')
//                                 .set({
//                                   "First name": _name.text,
//                                   "Last name": _lastname.text,
//                                   "email": _email.text,
//                                   "Phone": _phone.text,
//                                   "city": _city.text,
//                                   "imageUrl": imageUrl,
//                                 })
//                                 .then((value) => print('add success'))
//                                 .catchError(
//                                   (e) => print('add error ===>>>$e}'),
//                                 );
//                           }
//                         },
//                         child: Container(
//                           child: Center(
//                             child: Text(
//                               'Submit',
//                               style: TextStyle(fontSize: 20),
//                             ),
//                           ),
//                           width: 480,
//                           height: 60,
//                           decoration: BoxDecoration(
//                             color: Colors.lightBlue,
//                             borderRadius: BorderRadius.circular(8),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
