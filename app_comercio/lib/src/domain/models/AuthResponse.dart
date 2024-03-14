import 'dart:convert';

import 'package:app_comercio/src/domain/models/Users.dart';

AuthResponse authResponseFromJson(String str) =>
    AuthResponse.fromJson(json.decode(str));

String authResponseToJson(AuthResponse data) => json.encode(data.toJson());

class AuthResponse {
  Users data;
  bool isSuccess;
  String message;

  AuthResponse({
    required this.data,
    required this.isSuccess,
    required this.message,
  });

  factory AuthResponse.fromJson(Map<String, dynamic> json) => AuthResponse(
        data: Users.fromJson(json["Data"]),
        isSuccess: json["IsSuccess"],
        message: json["Message"],
      );

  Map<String, dynamic> toJson() => {
        "Data": data.toJson(),
        "IsSuccess": isSuccess,
        "Message": message,
      };
}
