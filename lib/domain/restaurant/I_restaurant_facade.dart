import 'package:dartz/dartz.dart';
import 'package:flutter_template/domain/restaurant/cat_rest_model.dart';
import 'package:flutter_template/domain/restaurant/category_model.dart';
import 'package:flutter_template/domain/restaurant/menu_model.dart';
import 'package:flutter_template/domain/restaurant/restaurant_failure.dart';
import 'package:flutter_template/domain/restaurant/restaurant_model.dart';
import 'package:flutter_template/domain/restaurant/restuarnt_detail_model.dart';
import 'package:flutter_template/domain/restaurant/search_model.dart';
import 'package:flutter_template/domain/restaurant/slider_model.dart';

abstract class IRestaurantFacade {
  Future<Either<RestaurantFailure, List<SliderList>>> fetchSliderList();
  Future<Either<RestaurantFailure, List<CategoryList>>> fetchCategoryList();
  Future<Either<RestaurantFailure, List<RestaurantModel>>>
      fetchNearbyRestaurantList();
  Future<Either<RestaurantFailure, List<CategorizedRestaurantModel>>>
      fetchCategoryWiseRestaurantList({required String category});
  Future<Either<RestaurantFailure, List<SearchModel>>> fetchSearchResult({
    required String search,
  });
  Future<Either<RestaurantFailure, RestaurantDetailModel>>
      fetchRestaurantDetail({
    required String restaurantID,
  });
  Future<Either<RestaurantFailure, List<MenuModel>>> getCategoryWiseMenu({
    required String restaurantId,
    required String menu,
    required String custId,
  });
}
