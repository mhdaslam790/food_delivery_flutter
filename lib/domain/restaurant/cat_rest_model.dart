import 'package:meta/meta.dart';
import 'dart:convert';

class CategorizedRestaurantModel {
  CategorizedRestaurantModel({
    required this.restaurantId,
    required this.restaurantName,
    required this.restaurantImage,
    required this.currentStatus,
    required this.restaurantAddress,
    required this.lat1,
    required this.lng1,
    required this.restaurantType,
    required this.restaurantEmail,
    required this.restaurantContactNo,
    required this.deliveryCharge,
    required this.restaurantStatus,
    required this.distance,
  });

  String restaurantId;
  String restaurantName;
  String restaurantImage;
  String currentStatus;
  String restaurantAddress;
  String lat1;
  String lng1;
  String restaurantType;
  String restaurantEmail;
  String restaurantContactNo;
  String deliveryCharge;
  String restaurantStatus;
  String distance;

  CategorizedRestaurantModel copyWith({
    String? restaurantId,
    String? restaurantName,
    String? restaurantImage,
    String? currentStatus,
    String? restaurantAddress,
    String? lat1,
    String? lng1,
    String? restaurantType,
    String? restaurantEmail,
    String? restaurantContactNo,
    String? deliveryCharge,
    String? restaurantStatus,
    String? distance,
  }) =>
      CategorizedRestaurantModel(
        restaurantId: restaurantId ?? this.restaurantId,
        restaurantName: restaurantName ?? this.restaurantName,
        restaurantImage: restaurantImage ?? this.restaurantImage,
        currentStatus: currentStatus ?? this.currentStatus,
        restaurantAddress: restaurantAddress ?? this.restaurantAddress,
        lat1: lat1 ?? this.lat1,
        lng1: lng1 ?? this.lng1,
        restaurantType: restaurantType ?? this.restaurantType,
        restaurantEmail: restaurantEmail ?? this.restaurantEmail,
        restaurantContactNo: restaurantContactNo ?? this.restaurantContactNo,
        deliveryCharge: deliveryCharge ?? this.deliveryCharge,
        restaurantStatus: restaurantStatus ?? this.restaurantStatus,
        distance: distance ?? this.distance,
      );

  factory CategorizedRestaurantModel.fromJson(String str) =>
      CategorizedRestaurantModel.fromMap(
          json.decode(str) as Map<String, dynamic>);

  String toJson() => json.encode(toMap());

  factory CategorizedRestaurantModel.fromMap(Map<String, dynamic> json) =>
      CategorizedRestaurantModel(
        restaurantId: json["restaurant_id"] as String,
        restaurantName: json["restaurant_name"] as String,
        restaurantImage: json["restaurant_image"] as String,
        currentStatus: json["current_status"] as String,
        restaurantAddress: json["restaurant_address"] as String,
        lat1: json["lat1"] as String,
        lng1: json["lng1"] as String,
        restaurantType: json["restaurant_type"] as String,
        restaurantEmail: json["restaurant_email"] as String,
        restaurantContactNo: json["restaurant_contact_no"] as String,
        deliveryCharge: json["delivery_charge"] as String,
        restaurantStatus: json["restaurant_status"] as String,
        distance: json["distance"].toString(),
      );

  Map<String, dynamic> toMap() => {
        "restaurant_id": restaurantId,
        "restaurant_name": restaurantName,
        "restaurant_image": restaurantImage,
        "current_status": currentStatus,
        "restaurant_address": restaurantAddress,
        "lat1": lat1,
        "lng1": lng1,
        "restaurant_type": restaurantType,
        "restaurant_email": restaurantEmail,
        "restaurant_contact_no": restaurantContactNo,
        "delivery_charge": deliveryCharge,
        "restaurant_status": restaurantStatus,
        "distance": distance,
      };
}
