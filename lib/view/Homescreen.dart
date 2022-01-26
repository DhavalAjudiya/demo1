// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:dmeo1/contant/const.dart';
// import 'package:dmeo1/repo/login_repo.dart';
// import 'package:dmeo1/view/addscreen.dart';
// import 'package:flutter/material.dart';
//
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({Key? key}) : super(key: key);
//
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   Widget build(BuildContext context) {
//     final screen = MediaQuery.of(context).size;
//
//     return Scaffold(
//       body: SafeArea(
//         child: Column(children: [
//           Expanded(
//             child: StreamBuilder<QuerySnapshot>(
//               stream: userDataCollection.snapshots(),
//               builder: (context, snapshot) {
//                 if (!snapshot.hasData) {
//                   return Center(
//                     child: CircularProgressIndicator(),
//                   );
//                 } else {
//                   List<DocumentSnapshot> docs = snapshot.data!.docs;
//                   return ListView.builder(
//                     itemCount: docs.length,
//                     itemBuilder: (context, index) {
//                       return Padding(
//                         padding: const EdgeInsets.only(left: 30),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Container(
//                               height: 150,
//                               width: 150,
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(20),
//                                 image: DecorationImage(
//                                   fit: BoxFit.cover,
//                                   image: NetworkImage(
//                                       "${docs[index].get("imageUrl")}"),
//                                 ),
//                               ),
//                             ),
//                             SizedBox(
//                               height: screen.height * 0.02,
//                             ),
//                             Row(
//                               children: [
//                                 Text(
//                                   'First Name : ',
//                                   style: TextStyle(
//                                     color: Colors.black,
//                                     fontSize: 20,
//                                     letterSpacing: 1,
//                                   ),
//                                 ),
//                                 Text(
//                                   '${docs[index].get('First name')}',
//                                   style: TextStyle(
//                                     color: Colors.pink,
//                                     fontSize: 20,
//                                     letterSpacing: 1,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             Row(
//                               children: [
//                                 Text(
//                                   'Last Name : ',
//                                   style: TextStyle(
//                                     color: Colors.black,
//                                     fontSize: 20,
//                                     letterSpacing: 1,
//                                   ),
//                                 ),
//                                 Text(
//                                   '${docs[index].get('Last name')}',
//                                   style: TextStyle(
//                                     color: Colors.pink,
//                                     fontSize: 20,
//                                     letterSpacing: 1,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             Row(
//                               children: [
//                                 Text(
//                                   'Email : ',
//                                   style: TextStyle(
//                                     color: Colors.black,
//                                     fontSize: 20,
//                                     letterSpacing: 1,
//                                   ),
//                                 ),
//                                 Text(
//                                   '${docs[index].get('email')}',
//                                   style: TextStyle(
//                                     color: Colors.pinkAccent,
//                                     fontSize: 20,
//                                     letterSpacing: 1,
//                                   ),
//                                 ),
//                               ],
//                             ),
//
//                             Row(
//                               children: [
//                                 Text(
//                                   'City : ',
//                                   style: TextStyle(
//                                     color: Colors.black,
//                                     fontSize: 20,
//                                     letterSpacing: 1,
//                                   ),
//                                 ),
//                                 Text(
//                                   '${docs[index].get('city')}',
//                                   style: TextStyle(
//                                     color: Colors.pinkAccent,
//                                     fontSize: 20,
//                                     letterSpacing: 1,
//                                   ),
//                                 ),
//                               ],
//                             ),
//
//                             Row(
//                               children: [
//                                 Text(
//                                   'PhoneNumber : ',
//                                   style: TextStyle(
//                                     color: Colors.black,
//                                     fontSize: 20,
//                                     letterSpacing: 1,
//                                   ),
//                                 ),
//                                 Text(
//                                   '${docs[index].get('Phone')}',
//                                   style: TextStyle(
//                                     color: Colors.pinkAccent,
//                                     fontSize: 20,
//                                     letterSpacing: 1,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             // Row(
//                             //   children: [
//                             //     Text(
//                             //       'field1 : ',
//                             //       style: TextStyle(
//                             //         color: Colors.black,
//                             //         fontSize: 20,
//                             //         letterSpacing: 1,
//                             //       ),
//                             //     ),
//                             //     Text(
//                             //       '${docs[index].get('field1')}',
//                             //       style: TextStyle(
//                             //         color: Colors.pinkAccent,
//                             //         fontSize: 20,
//                             //         letterSpacing: 1,
//                             //       ),
//                             //     ),
//                             //   ],
//                             // ),
//                             // Row(
//                             //   children: [
//                             //     Text(
//                             //       'field2 : ',
//                             //       style: TextStyle(
//                             //         color: Colors.black,
//                             //         fontSize: 20,
//                             //         letterSpacing: 1,
//                             //       ),
//                             //     ),
//                             //     Text(
//                             //       '${docs[index].get('field2')}',
//                             //       style: TextStyle(
//                             //         color: Colors.pinkAccent,
//                             //         fontSize: 20,
//                             //         letterSpacing: 1,
//                             //       ),
//                             //     ),
//                             //   ],
//                             // ),
//                             SizedBox(
//                               height: screen.height * 0.01,
//                             ),
//                             Row(
//                               children: [
//                                 IconButton(
//                                   onPressed: () {
//                                     AuthRepo.deletacount();
//                                     // ignore: unnecessary_statements
//                                     userDataCollection
//                                         .doc(kFirebaseAuth.currentUser!.uid)
//                                         .delete()
//                                         .then(
//                                             (value) => print("delete success"))
//                                         .catchError((e) {
//                                       print('delete Error $e');
//                                     });
//                                   },
//                                   icon: Icon(Icons.delete),
//                                 ),
//                                 // IconButton(
//                                 //   onPressed: () {
//                                 //     // userDataCollection
//                                 //     //     .add(
//                                 //     //         {'name': 'hii', 'address': 'surat'})
//                                 //     //     .then((value) => print('add success'))
//                                 //     //     .catchError((e) => print(e));
//                                 //     Navigator.push(
//                                 //         context,
//                                 //         MaterialPageRoute(
//                                 //           builder: (context) => Add(),
//                                 //         ));
//                                 //   },
//                                 //   icon: Icon(Icons.add),
//                                 // ),
//                                 IconButton(
//                                   onPressed: () {
//                                     Navigator.push(
//                                         context,
//                                         MaterialPageRoute(
//                                           builder: (context) => Add(),
//                                         ));
//                                     userDataCollection
//                                         .doc(kFirebaseAuth.currentUser!.uid)
//                                         .update({})
//                                         .then(
//                                             (value) => print("delete success"))
//                                         .catchError((e) {
//                                           print('delete Error $e');
//                                         });
//                                   },
//                                   icon: Icon(Icons.update),
//                                 ),
//                               ],
//                             ),
//                             SizedBox(
//                               height: screen.height * 0.04,
//                             ),
//                             // Row(
//                             //   children: [
//                             //     Text(
//                             //       'Education : ',
//                             //       style: TextStyle(
//                             //         color: Colors.black,
//                             //         fontSize: 20,
//                             //         letterSpacing: 1,
//                             //       ),
//                             //     ),
//                             //     Text(
//                             //       '${docs[index].get('education')}',
//                             //       style: TextStyle(
//                             //         color: Colors.pinkAccent,
//                             //         fontSize: 20,
//                             //         letterSpacing: 1,
//                             //       ),
//                             //     ),
//                             //   ],
//                             // ),
//                             // SizedBox(
//                             //   height: screen.height * 0.03,
//                             // ),
//                             // Row(
//                             //   children: [
//                             //     Text(
//                             //       'Skill : ',
//                             //       style: TextStyle(
//                             //         color: Colors.black,
//                             //         fontSize: 20,
//                             //         letterSpacing: 1,
//                             //       ),
//                             //     ),
//                             //     Text(
//                             //       '${docs[index].get('skill')}',
//                             //       style: TextStyle(
//                             //         color: Colors.pinkAccent,
//                             //         fontSize: 20,
//                             //         letterSpacing: 1,
//                             //       ),
//                             //     ),
//                             //   ],
//                             // ),
//                             // SizedBox(
//                             //   height: screen.height * 0.03,
//                             // ),
//                             // Row(
//                             //   children: [
//                             //     Text(
//                             //       'Massage : ',
//                             //       style: TextStyle(
//                             //         color: Colors.black,
//                             //         fontSize: 20,
//                             //         letterSpacing: 1,
//                             //       ),
//                             //     ),
//                             //     Text(
//                             //       '${docs[index].get('massage')}',
//                             //       style: TextStyle(
//                             //         color: Colors.pinkAccent,
//                             //         fontSize: 20,
//                             //         letterSpacing: 1,
//                             //       ),
//                             //     ),
//                             //   ],
//                             // ),
//                           ],
//                         ),
//                       );
//                     },
//                   );
//                 }
//               },
//             ),
//           ),
//         ]),
//       ),
//     );
//   }
// }
