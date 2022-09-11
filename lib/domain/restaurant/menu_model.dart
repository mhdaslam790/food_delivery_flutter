import 'package:meta/meta.dart';
import 'dart:convert';

class MenuModel {
  MenuModel({
    required this.id,
    required this.restaurantId,
    required this.foodMenuId,
    required this.foodMenuName,
    required this.foodMenuCategory,
    required this.foodMenuType,
    required this.foodMenuImage,
    required this.foodQuantity,
    required this.menuStartTime,
    required this.menuEndTime,
    required this.customerPrice,
    required this.superAdminPrice,
    required this.foodMenuStatus,
    required this.addon,
    required this.variation,
    required this.cartQty,
  });

  final String id;
  final String restaurantId;
  final String foodMenuId;
  final String foodMenuName;
  final String foodMenuCategory;
  final String foodMenuType;
  final String foodMenuImage;
  final String foodQuantity;
  final String menuStartTime;
  final String menuEndTime;
  final String customerPrice;
  final String superAdminPrice;
  final String foodMenuStatus;
  final String addon;
  final String variation;
  final String cartQty;

  MenuModel copyWith({
    String? id,
    String? restaurantId,
    String? foodMenuId,
    String? foodMenuName,
    String? foodMenuCategory,
    String? foodMenuType,
    String? foodMenuImage,
    String? foodQuantity,
    String? menuStartTime,
    String? menuEndTime,
    String? customerPrice,
    String? superAdminPrice,
    String? foodMenuStatus,
    String? addon,
    String? variation,
    String? cartQty,
  }) =>
      MenuModel(
        id: id ?? this.id,
        restaurantId: restaurantId ?? this.restaurantId,
        foodMenuId: foodMenuId ?? this.foodMenuId,
        foodMenuName: foodMenuName ?? this.foodMenuName,
        foodMenuCategory: foodMenuCategory ?? this.foodMenuCategory,
        foodMenuType: foodMenuType ?? this.foodMenuType,
        foodMenuImage: foodMenuImage ?? this.foodMenuImage,
        foodQuantity: foodQuantity ?? this.foodQuantity,
        menuStartTime: menuStartTime ?? this.menuStartTime,
        menuEndTime: menuEndTime ?? this.menuEndTime,
        customerPrice: customerPrice ?? this.customerPrice,
        superAdminPrice: superAdminPrice ?? this.superAdminPrice,
        foodMenuStatus: foodMenuStatus ?? this.foodMenuStatus,
        addon: addon ?? this.addon,
        variation: variation ?? this.variation,
        cartQty: cartQty ?? this.cartQty,
      );

  factory MenuModel.fromJson(String str) =>
      MenuModel.fromMap(json.decode(str) as Map<String, dynamic>);

  String toJson() => json.encode(toMap());

  factory MenuModel.fromMap(Map<String, dynamic> json) => MenuModel(
        id: json["id"] as String,
        restaurantId: json["restaurant_id"] as String,
        foodMenuId: json["food_menu_id"] as String,
        foodMenuName: json["food_menu_name"] as String,
        foodMenuCategory: json["food_menu_category"] as String,
        foodMenuType: json["food_menu_type"] as String,
        foodMenuImage: json["food_menu_image"] as String,
        foodQuantity: json["food_quantity"] as String,
        menuStartTime: json["menu_start_time"] as String,
        menuEndTime: json["menu_end_time"] as String,
        customerPrice: json["customer_price"] as String,
        superAdminPrice: json["super_admin_price"] as String,
        foodMenuStatus: json["food_menu_status"] as String,
        addon: json["addon"] as String,
        variation: json["variation"] as String,
        cartQty: json["cartQty"] as String,
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "restaurant_id": restaurantId,
        "food_menu_id": foodMenuId,
        "food_menu_name": foodMenuName,
        "food_menu_category": foodMenuCategory,
        "food_menu_type": foodMenuType,
        "food_menu_image": foodMenuImage,
        "food_quantity": foodQuantity,
        "menu_start_time": menuStartTime,
        "menu_end_time": menuEndTime,
        "customer_price": customerPrice,
        "super_admin_price": superAdminPrice,
        "food_menu_status": foodMenuStatus,
        "addon": addon,
        "variation": variation,
        "cartQty": cartQty,
      };
}
