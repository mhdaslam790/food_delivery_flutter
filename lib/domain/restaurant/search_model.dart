import 'package:meta/meta.dart';
import 'dart:convert';

class SearchModel {
  SearchModel({
    required this.searchType,
    required this.foodMenuName,
    required this.restaurantId,
    required this.foodMenuImage,
    required this.restaurantName,
    required this.restaurantImage,
  });

  final String? searchType;
  final String? foodMenuName;
  final String? restaurantId;
  final String? foodMenuImage;
  final String? restaurantName;
  final String? restaurantImage;

  SearchModel copyWith({
    String? searchType,
    String? foodMenuName,
    String? restaurantId,
    String? foodMenuImage,
    String? restaurantName,
    String? restaurantImage,
  }) =>
      SearchModel(
        searchType: searchType ?? this.searchType,
        foodMenuName: foodMenuName ?? this.foodMenuName,
        restaurantId: restaurantId ?? this.restaurantId,
        foodMenuImage: foodMenuImage ?? this.foodMenuImage,
        restaurantName: restaurantName ?? this.restaurantName,
        restaurantImage: restaurantImage ?? this.restaurantImage,
      );

  factory SearchModel.fromJson(String str) =>
      SearchModel.fromMap(json.decode(str) as Map<String, dynamic>);

  String toJson() => json.encode(toMap());

  factory SearchModel.fromMap(Map<String, dynamic> json) => SearchModel(
        searchType:
            json["search_type"] == null ? null : json["search_type"] as String,
        foodMenuName: json["food_menu_name"] == null
            ? null
            : json["food_menu_name"] as String,
        restaurantId: json["restaurant_id"] == null
            ? null
            : json["restaurant_id"] as String,
        foodMenuImage: json["food_menu_image"] == null
            ? null
            : json["food_menu_image"] as String,
        restaurantName: json["restaurant_name"] == null
            ? null
            : json["restaurant_name"] as String,
        restaurantImage: json["restaurant_image"] == null
            ? null
            : json["restaurant_image"] as String,
      );

  Map<String, dynamic> toMap() => {
        "search_type": searchType ?? null,
        "food_menu_name": foodMenuName ?? null,
        "restaurant_id": restaurantId ?? null,
        "food_menu_image": foodMenuImage ?? null,
        "restaurant_name": restaurantName ?? null,
        "restaurant_image": restaurantImage ?? null,
      };
}
