import 'dart:convert';

import 'package:meta/meta.dart';
import 'dart:convert';

class RestaurantModel {
  RestaurantModel({
    required this.foodCategoryName,
    required this.restaurantId,
    required this.restaurantName,
    required this.restaurantContactNo,
    required this.restaurantImage,
    required this.restaurantType,
    required this.currentStatus,
    required this.restaurantLatitude,
    required this.restaurantLongitude,
    required this.deliveryCharge,
    required this.restaurantStatus,
    required this.selfPickup,
    required this.distance,
  });

  String foodCategoryName;
  String restaurantId;
  String restaurantName;
  String restaurantContactNo;
  String restaurantImage;
  String restaurantType;
  String currentStatus;
  String restaurantLatitude;
  String restaurantLongitude;
  String deliveryCharge;
  String restaurantStatus;
  String selfPickup;
  String distance;

  RestaurantModel copyWith({
    String? foodCategoryName,
    String? restaurantId,
    String? restaurantName,
    String? restaurantContactNo,
    String? restaurantImage,
    String? restaurantType,
    String? currentStatus,
    String? restaurantLatitude,
    String? restaurantLongitude,
    String? deliveryCharge,
    String? restaurantStatus,
    String? selfPickup,
    String? distance,
  }) =>
      RestaurantModel(
        foodCategoryName: foodCategoryName ?? this.foodCategoryName,
        restaurantId: restaurantId ?? this.restaurantId,
        restaurantName: restaurantName ?? this.restaurantName,
        restaurantContactNo: restaurantContactNo ?? this.restaurantContactNo,
        restaurantImage: restaurantImage ?? this.restaurantImage,
        restaurantType: restaurantType ?? this.restaurantType,
        currentStatus: currentStatus ?? this.currentStatus,
        restaurantLatitude: restaurantLatitude ?? this.restaurantLatitude,
        restaurantLongitude: restaurantLongitude ?? this.restaurantLongitude,
        deliveryCharge: deliveryCharge ?? this.deliveryCharge,
        restaurantStatus: restaurantStatus ?? this.restaurantStatus,
        selfPickup: selfPickup ?? this.selfPickup,
        distance: distance ?? this.distance,
      );

  factory RestaurantModel.fromJson(String str) =>
      RestaurantModel.fromMap(json.decode(str) as Map<String, dynamic>);

  String toJson() => json.encode(toMap());

  factory RestaurantModel.fromMap(Map<String, dynamic> json) => RestaurantModel(
        foodCategoryName: json["food_category_name"] as String,
        restaurantId: json["restaurant_id"] as String,
        restaurantName: json["restaurant_name"] as String,
        restaurantContactNo: json["restaurant_contact_no"] as String,
        restaurantImage: json["restaurant_image"] as String,
        restaurantType: json["restaurant_type"] as String,
        currentStatus: json["current_status"] as String,
        restaurantLatitude: json["restaurant_latitude"] as String,
        restaurantLongitude: json["restaurant_longitude"] as String,
        deliveryCharge: json["delivery_charge"] as String,
        restaurantStatus: json["restaurant_status"] as String,
        selfPickup: json["selfPickup"] as String,
        distance: json["distance"] as String,
      );

  Map<String, dynamic> toMap() => {
        "food_category_name": foodCategoryName,
        "restaurant_id": restaurantId,
        "restaurant_name": restaurantName,
        "restaurant_contact_no": restaurantContactNo,
        "restaurant_image": restaurantImage,
        "restaurant_type": restaurantType,
        "current_status": currentStatus,
        "restaurant_latitude": restaurantLatitude,
        "restaurant_longitude": restaurantLongitude,
        "delivery_charge": deliveryCharge,
        "restaurant_status": restaurantStatus,
        "selfPickup": selfPickup,
        "distance": distance,
      };
}
