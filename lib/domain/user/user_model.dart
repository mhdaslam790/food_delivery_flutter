import 'package:meta/meta.dart';
import 'dart:convert';

class UserModel {
  UserModel({
    required this.status,
    required this.message,
    required this.mobNo,
    required this.userName,
    required this.custId,
    required this.email,
    required this.userToken,
    required this.addressList,
  });

  String status;
  String message;
  String mobNo;
  String userName;
  String custId;
  String email;
  String userToken;
  List<dynamic> addressList;

  UserModel copyWith({
    String? status,
    String? message,
    String? mobNo,
    String? userName,
    String? custId,
    String? email,
    String? userToken,
    List<dynamic>? addressList,
  }) =>
      UserModel(
        status: status ?? this.status,
        message: message ?? this.message,
        mobNo: mobNo ?? this.mobNo,
        userName: userName ?? this.userName,
        custId: custId ?? this.custId,
        email: email ?? this.email,
        userToken: userToken ?? this.userToken,
        addressList: addressList ?? this.addressList,
      );

  factory UserModel.fromJson(String str) =>
      UserModel.fromMap(json.decode(str) as Map<String, dynamic>);

  String toJson() => json.encode(toMap());

  factory UserModel.fromMap(Map<String, dynamic> json) => UserModel(
        status: json["status"] as String,
        message: json["message"] as String,
        mobNo: json["mob_no"] as String,
        userName: json["user_name"] as String,
        custId: json["cust_id"] as String,
        email: json["email"] as String,
        userToken: json["userToken"] as String,
        addressList: json["addressList"] as List<dynamic>,
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "message": message,
        "mob_no": mobNo,
        "user_name": userName,
        "cust_id": custId,
        "email": email,
        "userToken": userToken,
        "addressList": List<dynamic>.from(addressList.map((x) => x)),
      };
}
