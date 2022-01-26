import 'dart:io';

import 'package:dmeo1/page/OtpScreen.dart';
import 'package:dmeo1/page/modal/modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formkey = GlobalKey<FormState>();
  final number = TextEditingController();

  File? _image;

  Future getImage() async {
    final Image =
        await ImagePicker.platform.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = File(_image!.path);
    });
  }

  Future<Login> Post({String? mobile}) async {
    var url = Uri.parse("http://olufsen.in/appdata/login.php");

    Map<String, dynamic> reqbody = {"mobile": mobile};

    http.Response response = await http.post(url, body: reqbody);

    print(response.body);
    return loginFromJson(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
              key: formkey,
              child: Column(
                children: [
                  // Image.file(_image!),

                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: TextFormField(
                      keyboardType: TextInputType.phone,
                      textInputAction: TextInputAction.done,
                      validator: (value) {
                        if (value!.length < 10) {
                          return "enter valid number";
                        }
                        return null;
                      },
                      inputFormatters: [LengthLimitingTextInputFormatter(10)],
                      controller: number,
                      style: TextStyle(
                          color: Colors.purple[900],
                          fontWeight: FontWeight.w700),
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        labelStyle: TextStyle(
                            fontSize: 20.0, color: Colors.yellow[900]),
                        labelText: "Mobile number",
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white, width: 3),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white, width: 3),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      // Validate returns true if the form is valid, otherwise false.
                      if (formkey.currentState!.validate()) {
                        Post(mobile: number.text);
                        final SharedPreferences sharedPreferences =
                            await SharedPreferences.getInstance();
                        sharedPreferences.setString('mobile', number.text);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => OtpScreen(
                                number: number.text,
                              ),
                            ));
                      }
                    },
                    child: Text(
                      'Submit',
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
