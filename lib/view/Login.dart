// import 'package:dmeo1/repo/login_repo.dart';
// import 'package:dmeo1/view/mainscreen.dart';
// import 'package:flutter/material.dart';
//
// class Login extends StatefulWidget {
//   const Login({Key? key}) : super(key: key);
//
//   @override
//   _LoginState createState() => _LoginState();
// }
//
// class _LoginState extends State<Login> {
//   final _email = TextEditingController();
//
//   final _pass = TextEditingController();
//
//   final _formkey = GlobalKey<FormState>();
//
//   @override
//   void dispose() {
//     _email.dispose();
//     _pass.dispose();
//
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final screen = MediaQuery.of(context).size;
//
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Container(
//           height: screen.height * 1,
//           width: screen.width * 1,
//           child: Column(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(top: 200, right: 10, left: 10),
//                 child: Form(
//                   key: _formkey,
//                   child: Column(
//                     children: [
//                       Text(
//                         "LOG-IN",
//                         style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 20,
//                             letterSpacing: 2,
//                             fontWeight: FontWeight.w500),
//                       ),
//                       SizedBox(
//                         height: screen.height * 0.024,
//                       ),
//                       TextFormField(
//                         autovalidateMode: AutovalidateMode.onUserInteraction,
//                         textInputAction: TextInputAction.next,
//                         validator: (value) {
//                           if (value!.isEmpty) {
//                             return "* required";
//                           } else {
//                             return null;
//                           }
//                         },
//                         cursorColor: Colors.white,
//                         cursorHeight: 20,
//                         style: TextStyle(color: Colors.amber),
//                         controller: _email,
//                         decoration: InputDecoration(
//                           prefixIcon: Icon(
//                             Icons.email,
//                             color: Colors.white,
//                             size: 30,
//                           ),
//                           labelText: "Email",
//                           labelStyle: TextStyle(color: Colors.white),
//                           enabledBorder:
//                               UnderlineInputBorder(borderSide: BorderSide.none),
//                           focusedBorder:
//                               UnderlineInputBorder(borderSide: BorderSide.none),
//                           contentPadding:
//                               EdgeInsets.symmetric(vertical: 5, horizontal: 10),
//                         ),
//                       ),
//                       SizedBox(
//                         height: screen.height * 0.02,
//                       ),
//                       TextFormField(
//                           autovalidateMode: AutovalidateMode.onUserInteraction,
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
//                             prefixIcon: Icon(
//                               Icons.lock,
//                               color: Colors.white,
//                               size: 30,
//                             ),
//                             labelText: "password",
//                             labelStyle: TextStyle(color: Colors.white),
//                             enabledBorder: UnderlineInputBorder(
//                                 borderSide: BorderSide.none),
//                             focusedBorder: UnderlineInputBorder(
//                                 borderSide: BorderSide.none),
//                             contentPadding: EdgeInsets.symmetric(
//                                 vertical: 5, horizontal: 10),
//                           )),
//                       SizedBox(
//                         height: screen.height * 0.024,
//                       ),
//                       RaisedButton(
//                         color: Colors.teal[200],
//                         splashColor: Colors.black,
//                         highlightColor: Colors.red,
//                         onPressed: () async {
//                           if (_formkey.currentState!.validate()) {
//                             bool? status = await AuthRepo.loginRepo(
//                                 email: _email.text, pass: _pass.text);
//
//                             if (status == true) {
//                               ScaffoldMessenger.of(context)
//                                   .showSnackBar(
//                                     SnackBar(
//                                       duration: Duration(milliseconds: 400),
//                                       content: Text("Login success!"),
//                                     ),
//                                   )
//                                   .closed
//                                   .then((value) => Navigator.push(
//                                       context,
//                                       MaterialPageRoute(
//                                         builder: (context) => userprofile(),
//                                       )));
//                             } else {
//                               ScaffoldMessenger.of(context).showSnackBar(
//                                 SnackBar(
//                                   content: Text("Login Failed!"),
//                                 ),
//                               );
//                             }
//                           }
//                         },
//                         child: Text(
//                           "Login",
//                           style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 20,
//                               letterSpacing: 2,
//                               fontWeight: FontWeight.w500),
//                         ),
//                       ),
//                       SizedBox(
//                         height: screen.height * 0.024,
//                       ),
//                       // TextButton(
//                       //   onPressed: () {
//                       //     Navigator.push(
//                       //         context,
//                       //         MaterialPageRoute(
//                       //           builder: (context) => SingUp(),
//                       //         ));
//                       //   },
//                       //   child: Text(
//                       //     "RAGISTRATION",
//                       //     style: TextStyle(
//                       //         decoration: TextDecoration.underline,
//                       //         color: Colors.white,
//                       //         wordSpacing: 2,
//                       //         fontSize: 15),
//                       //   ),
//                       // ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           decoration: BoxDecoration(
//             color: Colors.grey,
//             image: DecorationImage(
//               fit: BoxFit.cover,
//               image: AssetImage("assets/img/a.jpg"),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
