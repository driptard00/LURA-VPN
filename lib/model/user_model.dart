// To parse this JSON data, do
//
//     final myUser = myUserFromMap(jsonString);

import 'dart:convert';

MyUser myUserFromMap(String str) => MyUser.fromMap(json.decode(str));

String myUserToMap(MyUser data) => json.encode(data.toMap());

class MyUser {
  String? firstname;
  String? lastname;
  String? email;
  String? role;
  String? serial;
  DateTime? updatedAt;
  DateTime? createdAt;
  int? id;
  String? connectionUsername;
  String? connectionUserId;
  String? connectionPassword;
  int? isActive;
  String? status;
  DateTime? emailVerifiedAt;
  DateTime? lastLogin;

  MyUser({
    this.firstname,
    this.lastname,
    this.email,
    this.role,
    this.serial,
    this.updatedAt,
    this.createdAt,
    this.id,
    this.connectionUsername,
    this.connectionUserId,
    this.connectionPassword,
    this.isActive,
    this.status,
    this.emailVerifiedAt,
    this.lastLogin,
  });

  factory MyUser.fromMap(Map<String, dynamic> json) => MyUser(
    firstname: json["firstname"],
    lastname: json["lastname"],
    email: json["email"],
    role: json["role"],
    serial: json["serial"],
    updatedAt: DateTime.parse(json["updated_at"]),
    createdAt: DateTime.parse(json["created_at"]),
    id: json["id"],
    connectionUsername: json["connection_username"],
    connectionUserId: json["connection_user_id"],
    connectionPassword: json["connection_password"],
    isActive: json["is_active"],
    status: json["status"],
    emailVerifiedAt: DateTime.parse(json["email_verified_at"]),
    lastLogin: DateTime.parse(json["last_login"]),
  );

  Map<String, dynamic> toMap() => {
    "firstname": firstname,
    "lastname": lastname,
    "email": email,
    "role": role,
    "serial": serial,
    "updated_at": updatedAt!.toIso8601String(),
    "created_at": createdAt!.toIso8601String(),
    "id": id,
    "connection_username": connectionUsername,
    "connection_user_id": connectionUserId,
    "connection_password": connectionPassword,
    "is_active": isActive,
    "status": status,
    "email_verified_at": emailVerifiedAt!.toIso8601String(),
    "last_login": lastLogin!.toIso8601String(),
  };
}
