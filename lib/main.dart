import 'package:dmeo1/screen/PhoneAuthentication.dart';
import 'package:dmeo1/screen/google_map.dart';
import 'package:dmeo1/page/loginpage.dart';
import 'package:dmeo1/screen/ragitration%20.dart';
import 'package:dmeo1/view/ragitrastion_screen.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
