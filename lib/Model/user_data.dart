// To parse this JSON data, do
//
//     final userdata = userdataFromJson(jsonString);

import 'dart:convert';

Userdata userdataFromJson(String str) => Userdata.fromJson(json.decode(str));

String userdataToJson(Userdata data) => json.encode(data.toJson());

class Userdata {
  Map<String, User>? users;

  Userdata({
    this.users,
  });

  factory Userdata.fromJson(Map<String, dynamic> json) => Userdata(
    users: Map.from(json["users"]!).map((k, v) => MapEntry<String, User>(k, User.fromJson(v))),
  );

  Map<String, dynamic> toJson() => {
    "users": Map.from(users!).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
  };
}

class User {
  String? email;
  String? firstName;
  String? lastName;
  String? onlineStatus;
  String? profilePicture;
  String? uid;
  String? username;

  User({
    this.email,
    this.firstName,
    this.lastName,
    this.onlineStatus,
    this.profilePicture,
    this.uid,
    this.username,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    email: json["email"],
    firstName: json["first name"],
    lastName: json["last name"],
    onlineStatus: json["online status"],
    profilePicture: json["profile_picture"],
    uid: json["uid"],
    username: json["username"],
  );

  Map<String, dynamic> toJson() => {
    "email": email,
    "first name": firstName,
    "last name": lastName,
    "online status": onlineStatus,
    "profile_picture": profilePicture,
    "uid": uid,
    "username": username,
  };
}
