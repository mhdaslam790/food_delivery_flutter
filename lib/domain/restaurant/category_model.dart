import 'dart:convert';

class CategoryList {
  CategoryList({
    required this.id,
    required this.foodCategoryId,
    required this.foodCategoryName,
    required this.foodCategoryImage,
    required this.foodCategoryStatus,
    required this.sequence,
  });

  String id;
  String foodCategoryId;
  String foodCategoryName;
  String foodCategoryImage;
  String foodCategoryStatus;
  String sequence;

  CategoryList copyWith({
    String? id,
    String? foodCategoryId,
    String? foodCategoryName,
    String? foodCategoryImage,
    String? foodCategoryStatus,
    String? sequence,
  }) =>
      CategoryList(
        id: id ?? this.id,
        foodCategoryId: foodCategoryId ?? this.foodCategoryId,
        foodCategoryName: foodCategoryName ?? this.foodCategoryName,
        foodCategoryImage: foodCategoryImage ?? this.foodCategoryImage,
        foodCategoryStatus: foodCategoryStatus ?? this.foodCategoryStatus,
        sequence: sequence ?? this.sequence,
      );

  factory CategoryList.fromJson(String str) =>
      CategoryList.fromMap(json.decode(str) as Map<String, dynamic>);

  String toJson() => json.encode(toMap());

  factory CategoryList.fromMap(Map<String, dynamic> json) => CategoryList(
        id: json["id"] as String,
        foodCategoryId: json["food_category_id"] as String,
        foodCategoryName: json["food_category_name"] as String,
        foodCategoryImage: json["food_category_image"] as String,
        foodCategoryStatus: json["food_category_status"] as String,
        sequence: json["sequence"] as String,
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "food_category_id": foodCategoryId,
        "food_category_name": foodCategoryName,
        "food_category_image": foodCategoryImage,
        "food_category_status": foodCategoryStatus,
        "sequence": sequence,
      };
}
