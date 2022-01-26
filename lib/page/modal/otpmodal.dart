// To parse this JSON data, do
//
//     final otp = otpFromJson(jsonString);

import 'dart:convert';

Otp otpFromJson(String str) => Otp.fromJson(json.decode(str));

String otpToJson(Otp data) => json.encode(data.toJson());

class Otp {
  Otp({
    this.mobile,
    this.msg,
    this.success,
    this.error,
  });

  String? mobile;
  String? msg;
  String? success;
  String? error;

  factory Otp.fromJson(Map<String, dynamic> json) => Otp(
    mobile: json["mobile"],
    msg: json["msg"],
    success: json["success"],
    error: json["error"],
  );

  Map<String, dynamic> toJson() => {
    "mobile": mobile,
    "msg": msg,
    "success": success,
    "error": error,
  };
}
