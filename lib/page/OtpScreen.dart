// ignore_for_file: unrelated_type_equality_checks

import 'package:dmeo1/page/modal/otpmodal.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class OtpScreen extends StatefulWidget {
  final String number;

  const OtpScreen({Key? key, required this.number}) : super(key: key);

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  //
  // String? number;
  // void getUserName() async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   setState(() {
  //     number = preferences.getString('number');
  //   });
  //   print('get email ===>>> $number');
  // }
  final formkey = GlobalKey<FormState>();
  final number = TextEditingController();
  final tp = TextEditingController();

  bool isselected = true;

  Future<Otp> OtpPost({
    String? otp,
  }) async {
    var url = Uri.parse("http://olufsen.in/appdata/otp_check.php");
    Map<String, dynamic> reqbody = {
      "mobile": widget.number,
      "otp": otp,
    };
    http.Response response = await http.post(url, body: reqbody);
    print(response.body);
    return otpFromJson(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          SizedBox(
            height: 150,
          ),
          Form(
            key: formkey,
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: TextFormField(
                    onChanged: (value) => print(value),
                    keyboardType: TextInputType.phone,
                    textInputAction: TextInputAction.done,
                    // validator: (tp) {
                    //   if () {
                    //     return "enter value";
                    //   }
                    //   return null;
                    // },
                    controller: tp,
                    style: TextStyle(backgroundColor: Colors.pink,
                        color: Colors.purple[900], fontWeight: FontWeight.w700),
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 3),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 3),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      labelStyle:
                          TextStyle(fontSize: 20.0, color: Colors.yellow[900]),
                      border: OutlineInputBorder(),
                      errorStyle:
                          TextStyle(color: Colors.redAccent, fontSize: 15),
                      labelText: "Otp",
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (formkey.currentState!.validate()) {
                      OtpPost(otp: tp.text);
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          backgroundColor: isselected?Colors.green:Colors.red,
                          actions: [
                            Container(
                              child:  FutureBuilder(
                                future: OtpPost(otp: tp.text),
                                builder: (BuildContext context, AsyncSnapshot<Otp> snapshot) {
                                  if (snapshot.connectionState == ConnectionState.done) {
                                    var data = snapshot.data;
                                    return ListView(
                                      children: [
                                        Text(
                                          "mobile :"
                                              "${data!.mobile}",style: TextStyle(color: Colors.purple),
                                          // style: TextStyle(color: Colors.green),
                                        ),
                                        TextButton(
                                          child: Text(
                                            "error :"
                                                "${data.error}",
                                            // style: TextStyle(color: Colors.green),
                                          ),
                                          onPressed: () {
                                            if (data.error == 1) {
                                              return setState(() {
                                                isselected = false;
                                              });
                                              ;
                                            }
                                          },
                                        ),
                                        TextButton(
                                          child: Text(
                                            "success :"
                                                "${data.success}",
                                            // style: TextStyle(color: Colors.green),
                                          ),
                                          onPressed: () {
                                            if (data.success == 1) {
                                              return setState(() {
                                                isselected = true;
                                              });
                                            }
                                          },
                                        ),
                                        Text(
                                          "msg :"
                                              "${data.msg}",
                                          // style: TextStyle(color: Colors.green),
                                        ),
                                      ],
                                    );
                                  } else {
                                    return Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  }
                                },
                              ),
                              height: 130,
                            ),
                          ],
                        ),
                      );
                    }
                  },
                  child: Text(
                    'Submit',
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
