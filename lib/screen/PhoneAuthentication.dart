// import 'package:dmeo1/contant/const.dart';
// import 'package:dmeo1/view/Homescreen.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
//
// class Phone extends StatefulWidget {
//   const Phone({Key? key}) : super(key: key);
//
//   @override
//   _PhoneState createState() => _PhoneState();
// }
//
// class _PhoneState extends State<Phone> {
//   final _phoneController = TextEditingController();
//
//   final _codeController = TextEditingController();
//
//   Future loginUser(String phone, BuildContext context) async {
//     kFirebaseAuth.verifyPhoneNumber(
//       phoneNumber: phone,
//       timeout: Duration(seconds: 30),
//       verificationCompleted: (AuthCredential credential) async {
//         // var result = await kFirebaseAuth.signInWithCredential(credential);
//
//         // var user = result.user;
//
//         // if (user != null) {
//         //   Navigator.push(
//         //       context,
//         //       MaterialPageRoute(
//         //         builder: (context) => HomeScreen(),
//         //       ));
//         // }
//       },
//       verificationFailed: (FirebaseAuthException exception) {
//         print(exception);
//       },
//       codeSent: (String verificationId, [int? forceResendingToken]) {
//         showDialog(
//           context: context,
//           builder: (context) {
//             return AlertDialog(
//               title: Text("Give the Code"),
//               content: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: <Widget>[
//                   TextField(
//                     controller: _codeController,
//                   ),
//                 ],
//               ),
//               actions: <Widget>[
//                 // ignore: deprecated_member_use
//                 FlatButton(
//                   child: Text("Confirm"),
//                   textColor: Colors.white,
//                   color: Colors.blue,
//                   onPressed: () async {
//                     final code = _codeController.text.trim();
//                     AuthCredential credential = PhoneAuthProvider.credential(
//                         verificationId: verificationId, smsCode: code);
//
//                     var result =
//                         await kFirebaseAuth.signInWithCredential(credential);
//
//                     var user = result.user;
//
//                     if (user != null) {
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => HomeScreen()));
//                     } else {
//                       print("Error");
//                     }
//                   },
//                 )
//               ],
//             );
//           },
//         );
//       },
//       codeAutoRetrievalTimeout: (String verificationId) {},
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Container(
//           padding: EdgeInsets.all(32),
//           child: Form(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 Text(
//                   "Login",
//                   style: TextStyle(
//                       color: Colors.lightBlue,
//                       fontSize: 36,
//                       fontWeight: FontWeight.w500),
//                 ),
//                 SizedBox(
//                   height: 16,
//                 ),
//                 TextFormField(
//                   decoration: InputDecoration(
//                       enabledBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.all(Radius.circular(8)),
//                           borderSide: BorderSide(color: Colors.grey)),
//                       focusedBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.all(Radius.circular(8)),
//                           borderSide: BorderSide(color: Colors.grey)),
//                       filled: true,
//                       fillColor: Colors.grey[100],
//                       hintText: "Mobile Number"),
//                   controller: _phoneController,
//                 ),
//                 SizedBox(
//                   height: 16,
//                 ),
//                 Container(
//                   width: double.infinity,
//                   // ignore: deprecated_member_use
//                   child: FlatButton(
//                     child: Text("LOGIN"),
//                     textColor: Colors.white,
//                     padding: EdgeInsets.all(16),
//                     onPressed: () {
//                       final phone = _phoneController.text.trim();
//
//                       loginUser(phone, context);
//                     },
//                     color: Colors.blue,
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
