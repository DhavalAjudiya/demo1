// To parse this JSON data, do
//
//     final login = loginFromJson(jsonString);

import 'dart:convert';

Login loginFromJson(String str) => Login.fromJson(json.decode(str));

String loginToJson(Login data) => json.encode(data.toJson());

class Login {
  Login({
    this.otp,
    this.msg,
    this.success,
    this.error,
  });

  String? otp;
  String? msg;
  String? success;
  String? error;

  factory Login.fromJson(Map<String, dynamic> json) => Login(
        otp: json["otp"],
        msg: json["msg"],
        success: json["success"],
        error: json["error"],
      );

  Map<String, dynamic> toJson() => {
        "otp": otp,
        "msg": msg,
        "success": success,
        "error": error,
      };
}
