import 'package:meta/meta.dart';
import 'dart:convert';

class SliderList {
  SliderList({
    required this.bannerName,
    required this.bannerImage,
    required this.restaurantId,
    required this.restaurantName,
  });

  String bannerName;
  String bannerImage;
  String restaurantId;
  String restaurantName;

  SliderList copyWith({
    String? bannerName,
    String? bannerImage,
    String? restaurantId,
    String? restaurantName,
  }) =>
      SliderList(
        bannerName: bannerName ?? this.bannerName,
        bannerImage: bannerImage ?? this.bannerImage,
        restaurantId: restaurantId ?? this.restaurantId,
        restaurantName: restaurantName ?? this.restaurantName,
      );

  factory SliderList.fromJson(String str) =>
      SliderList.fromMap(json.decode(str) as Map<String, dynamic>);

  String toJson() => json.encode(toMap());

  factory SliderList.fromMap(Map<String, dynamic> json) => SliderList(
        bannerName: json["banner_name"] as String,
        bannerImage: json["banner_image"] as String,
        restaurantId: json["restaurant_id"] as String,
        restaurantName: json["restaurant_name"] as String,
      );

  Map<String, dynamic> toMap() => {
        "banner_name": bannerName,
        "banner_image": bannerImage,
        "restaurant_id": restaurantId,
        "restaurant_name": restaurantName,
      };
}
