import 'package:meta/meta.dart';
import 'dart:convert';

class RestaurantDetailModel {
  RestaurantDetailModel({
    required this.foodCategoryName,
    required this.restaurantId,
    required this.restaurantName,
    required this.restaurantImage,
    required this.currentStatus,
    required this.restaurantAddress,
    required this.lat1,
    required this.lng1,
    required this.restaurantType,
    required this.deliveryCharge,
    required this.totalreview,
    required this.avgreview,
    required this.selfPickup,
    required this.distance,
  });

  final String foodCategoryName;
  final String restaurantId;
  final String restaurantName;
  final String restaurantImage;
  final String currentStatus;
  final String restaurantAddress;
  final String lat1;
  final String lng1;
  final String restaurantType;
  final String deliveryCharge;
  final String totalreview;
  final double avgreview;
  final String selfPickup;
  final String distance;

  RestaurantDetailModel copyWith({
    String? foodCategoryName,
    String? restaurantId,
    String? restaurantName,
    String? restaurantImage,
    String? currentStatus,
    String? restaurantAddress,
    String? lat1,
    String? lng1,
    String? restaurantType,
    String? deliveryCharge,
    String? totalreview,
    double? avgreview,
    String? selfPickup,
    String? distance,
  }) =>
      RestaurantDetailModel(
        foodCategoryName: foodCategoryName ?? this.foodCategoryName,
        restaurantId: restaurantId ?? this.restaurantId,
        restaurantName: restaurantName ?? this.restaurantName,
        restaurantImage: restaurantImage ?? this.restaurantImage,
        currentStatus: currentStatus ?? this.currentStatus,
        restaurantAddress: restaurantAddress ?? this.restaurantAddress,
        lat1: lat1 ?? this.lat1,
        lng1: lng1 ?? this.lng1,
        restaurantType: restaurantType ?? this.restaurantType,
        deliveryCharge: deliveryCharge ?? this.deliveryCharge,
        totalreview: totalreview ?? this.totalreview,
        avgreview: avgreview ?? this.avgreview,
        selfPickup: selfPickup ?? this.selfPickup,
        distance: distance ?? this.distance,
      );

  factory RestaurantDetailModel.fromJson(String str) =>
      RestaurantDetailModel.fromMap(json.decode(str) as Map<String, dynamic>);

  String toJson() => json.encode(toMap());

  factory RestaurantDetailModel.fromMap(Map<String, dynamic> json) =>
      RestaurantDetailModel(
        foodCategoryName: json["food_category_name"] as String,
        restaurantId: json["restaurant_id"] as String,
        restaurantName: json["restaurant_name"] as String,
        restaurantImage: json["restaurant_image"] as String,
        currentStatus: json["current_status"] as String,
        restaurantAddress: json["restaurant_address"] as String,
        lat1: json["lat1"] as String,
        lng1: json["lng1"] as String,
        restaurantType: json["restaurant_type"] as String,
        deliveryCharge: json["delivery_charge"] as String,
        totalreview: json["totalreview"].toString(),
        avgreview: (json["avgreview"] as int).toDouble(),
        selfPickup: json["selfPickup"] as String,
        distance: json["distance"].toString(),
      );

  Map<String, dynamic> toMap() => {
        "food_category_name": foodCategoryName,
        "restaurant_id": restaurantId,
        "restaurant_name": restaurantName,
        "restaurant_image": restaurantImage,
        "current_status": currentStatus,
        "restaurant_address": restaurantAddress,
        "lat1": lat1,
        "lng1": lng1,
        "restaurant_type": restaurantType,
        "delivery_charge": deliveryCharge,
        "totalreview": totalreview,
        "avgreview": avgreview,
        "selfPickup": selfPickup,
        "distance": distance,
      };
}
