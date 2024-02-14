// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  bool? status;
  String? msg;
  int? userId;

  LoginModel({
    this.status,
    this.msg,
    this.userId,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        status: json["status"],
        msg: json["msg"],
        userId: json["userId"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
        "userId": userId,
      };
}
