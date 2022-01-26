// import 'package:dmeo1/contant/const.dart';
// import 'package:firebase_auth/firebase_auth.dart';
//
// class AuthRepo {
//   static Future<bool?> loginRepo({String? email, String? pass}) async {
//     try {
//       await kFirebaseAuth.signInWithEmailAndPassword(
//           email: email!, password: pass!);
//       return true;
//     } catch (e) {
//       print("login error ==> $e");
//       return false;
//     }
//   }
//
//   // static Future logout() async {
//   //   await kFirebaseAuth.signOut();
//
//   static deletacount({String? email, String? pass}) async {
//     User? user = kFirebaseAuth.currentUser;
//
//     AuthCredential credential =
//         EmailAuthProvider.credential(email: email!, password: pass!);
//
//     await user!.reauthenticateWithCredential(credential).then((value) {
//       value.user!.delete();
//     });
//   }
// }
