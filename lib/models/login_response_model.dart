import 'dart:convert';

import 'package:bel_dashboard/models/user_model.dart';

LoginResponseModel loginResponseModelFromJson(String str) => LoginResponseModel.fromJson(json.decode(str));

String loginResponseModelToJson(LoginResponseModel data) => json.encode(data.toJson());

class LoginResponseModel {
  String status;
  String? token;
  String? message;
  UserModel? user;

  LoginResponseModel({
    required this.status,
    this.token,
    this.message,
    this.user,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) => LoginResponseModel(
    status: json["status"],
    token: json["token"],
    message: json["message"],
    user: UserModel.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "token": token,
    "message": message,
    "user": user?.toJson(),
  };
}
