import 'package:app_comercio/src/domain/models/Role.dart';

class Users {
  int userId;
  String firstName;
  String lastName;
  String userName;
  dynamic password;
  String token;
  List<Role> roles;

  Users({
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.userName,
    required this.password,
    required this.token,
    required this.roles,
  });

  factory Users.fromJson(Map<String, dynamic> json) => Users(
        userId: json["UserId"],
        firstName: json["FirstName"],
        lastName: json["LastName"],
        userName: json["UserName"],
        password: json["Password"],
        token: json["Token"],
        roles: List<Role>.from(json["Roles"].map((x) => Role.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "UserId": userId,
        "FirstName": firstName,
        "LastName": lastName,
        "UserName": userName,
        "Password": password,
        "Token": token,
        "Roles": List<dynamic>.from(roles.map((x) => x.toJson())),
      };
}
