// To parse this JSON data, do
//
//     final user = userFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class User {
  User({
    required this.id,
    required this.name,
    required this.userName,
    required this.email,
    this.wishList,
  });

  String id;
  String name;
  String userName;
  String email;
  List<String>? wishList;

  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory User.fromMap(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        userName: json["userName"],
        email: json["email"],
        wishList: json["wishList"] == null
            ? null
            : List<String>.from(json["wishList"].map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "userName": userName,
        "email": email,
        "wishList": wishList == null
            ? null
            : List<dynamic>.from(wishList!.map((x) => x)),
      };

  @override
  String toString() {
    return "User: [id: $id, name: $name, userName: $userName, email: $email, wishList: $wishList]";
  }
}
