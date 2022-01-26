import 'package:dmeo1/screen/comman/textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class WidgetScreen extends StatefulWidget {
  const WidgetScreen({Key? key}) : super(key: key);

  @override
  _WidgetScreenState createState() => _WidgetScreenState();
}

class _WidgetScreenState extends State<WidgetScreen> {
  final formkey = GlobalKey<FormState>();
  final email = TextEditingController();
  final  name= TextEditingController();
  final pass = TextEditingController();
  final cpass = TextEditingController();
  bool isselected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: formkey,
              child: Column(
                children: [
                  CustomTextField(
                 controller: name,
                    Data:Icons.person,
                    lebalText: "Enter your name",
                  ),
                  TextFormField(
                    controller: email,
                    decoration: InputDecoration(
                      labelText: "Enter your Email",
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.white,
                              width: 2,
                              style: BorderStyle.solid),
                          borderRadius: BorderRadius.circular(10)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    validator: (email) {
                      if (email!.isEmpty) {
                        return "Enter your email";
                      }
                      if (email.isNotEmpty ||
                          RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(email)) {
                        return "enter valid email";
                      }
                      return null;
                    },
                  ).p2(),
                  20.heightBox,
                  TextFormField(
                    controller: pass,
                    obscureText: isselected ? false : true,
                    decoration: InputDecoration(
                      labelText: "Enter your password",
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.white,
                              width: 2,
                              style: BorderStyle.solid),
                          borderRadius: BorderRadius.circular(10)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(10)),
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isselected = !isselected;
                            });
                          },
                          icon: isselected
                              ? Icon(Icons.visibility)
                              : Icon(Icons.visibility_off)),
                    ),
                    validator: (email) {
                      if (email!.isEmpty) {
                        return "Enter your password";
                      }
                      return null;
                    },
                  ),
                  20.heightBox,
                  TextFormField(
                    controller: cpass,
                    obscureText: isselected ? false : true,
                    decoration: InputDecoration(
                      labelText: "Enter your password",

                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isselected = !isselected;
                            });
                          },
                          icon: isselected
                              ? Icon(Icons.visibility)
                              : Icon(Icons.visibility_off)),
                    ),
                    validator: (cpass) {
                      if (cpass!.isEmpty) {
                        return "enter pass";
                      }
                      if (cpass != pass.text) {
                        return "not match";
                      }
                      return null;
                    },
                  ),
                  20.heightBox,
                  RaisedButton(
                    color: Colors.green,
                    onPressed: () {
                      if (formkey.currentState!.validate()) {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return Container(
                              height: 80,
                              child: Text("success"),
                            );
                          },
                        );
                      }
                    },
                    child: Text(
                      "Submit",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
