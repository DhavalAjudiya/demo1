// import 'package:dmeo1/repo/ragitration_repo.dart';
// import 'package:dmeo1/view/Login.dart';
// import 'package:dmeo1/view/mainscreen.dart';
// import 'package:flutter/material.dart';
//
// class Ragitration extends StatefulWidget {
//   const Ragitration({Key? key}) : super(key: key);
//
//   @override
//   _RagitrationState createState() => _RagitrationState();
// }
//
// class _RagitrationState extends State<Ragitration> {
//   final _email = TextEditingController();
//
//   final _pass = TextEditingController();
//
//   final formkey = GlobalKey<FormState>();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(top: 100),
//             child: Column(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 10),
//                   child: Form(
//                     key: formkey,
//                     child: Column(
//                       children: [
//                         TextFormField(
//                           textInputAction: TextInputAction.next,
//                           keyboardAppearance: Brightness.dark,
//                           validator: (value) {
//                             if (value!.isEmpty) {
//                               return "* required";
//                             } else {
//                               return null;
//                             }
//                           },
//                           cursorColor: Colors.white,
//                           cursorHeight: 20,
//                           style: TextStyle(color: Colors.amber),
//                           controller: _email,
//                           decoration: InputDecoration(
//                               labelText: "Email",
//                               labelStyle: TextStyle(color: Colors.white),
//                               enabledBorder: UnderlineInputBorder(
//                                   borderSide: BorderSide.none),
//                               focusedBorder: UnderlineInputBorder(
//                                   borderSide: BorderSide.none),
//                               contentPadding: EdgeInsets.symmetric(
//                                   vertical: 5, horizontal: 10),
//                               filled: true,
//                               fillColor: Colors.black38),
//                         ),
//                         SizedBox(
//                           height: 20,
//                         ),
//                         TextFormField(
//                           textInputAction: TextInputAction.next,
//                           validator: (value) {
//                             if (value!.isEmpty) {
//                               return "* required";
//                             } else {
//                               return null;
//                             }
//                           },
//                           cursorColor: Colors.white,
//                           cursorHeight: 20,
//                           style: TextStyle(color: Colors.amber),
//                           controller: _pass,
//                           decoration: InputDecoration(
//                               labelText: "password",
//                               labelStyle: TextStyle(color: Colors.white),
//                               enabledBorder: UnderlineInputBorder(
//                                   borderSide: BorderSide.none),
//                               focusedBorder: UnderlineInputBorder(
//                                   borderSide: BorderSide.none),
//                               contentPadding: EdgeInsets.symmetric(
//                                   vertical: 5, horizontal: 10),
//                               filled: true,
//                               fillColor: Colors.black38),
//                         ),
//                         SizedBox(
//                           height: 20,
//                         ),
//                         RaisedButton(
//                           color: Colors.pink,
//                           splashColor: Colors.black,
//                           highlightColor: Colors.red,
//                           onPressed: () {
//                             if (formkey.currentState!.validate()) {
//                               AuthRepo.registrationRepo(
//                                   email: _email.text, pass: _pass.text);
//
//                               Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                     builder: (context) => Login(),
//                                   ));
//                             }
//                           },
//                           child: Text("Registration"),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
