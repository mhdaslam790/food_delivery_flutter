// ignore_for_file: avoid_dynamic_calls

import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_template/domain/restaurant/cat_rest_model.dart';
import 'package:flutter_template/domain/restaurant/menu_model.dart';
import 'package:flutter_template/domain/restaurant/restaurant_model.dart';
import 'package:flutter_template/domain/core/constants.dart';
import 'package:flutter_template/domain/restaurant/I_restaurant_facade.dart';
import 'package:flutter_template/domain/restaurant/category_model.dart';
import 'package:flutter_template/domain/restaurant/restuarnt_detail_model.dart';
import 'package:flutter_template/domain/restaurant/search_model.dart';
import 'package:flutter_template/domain/restaurant/slider_model.dart';
import 'package:flutter_template/domain/restaurant/restaurant_failure.dart';
import 'package:injectable/injectable.dart';
import 'package:http/http.dart' as http;

@LazySingleton(as: IRestaurantFacade)
class RestaurantFacade implements IRestaurantFacade {
  @override
  Future<Either<RestaurantFailure, List<SliderList>>> fetchSliderList() async {
    final url = Uri.parse(
      ApiConstants.apiURL + ApiConstants.sliderAPI,
    );
    final response = await http.get(
      url,
    );

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);

      final List<SliderList> sliderData = (jsonResponse['sliderList'] as List)
          .map((p) => SliderList.fromMap(p as Map<String, dynamic>))
          .toList();

      // print(sliderData);
      return right(sliderData);
    } else {
      return left(
        const RestaurantFailure.serverError(
          "An unexpected error occurred while signing in. Please try again",
        ),
      );
    }
  }

  @override
  Future<Either<RestaurantFailure, List<CategoryList>>>
      fetchCategoryList() async {
    final url = Uri.parse(
      ApiConstants.apiURL + ApiConstants.categoryAPI,
    );
    final response = await http.get(
      url,
    );

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);

      if (jsonResponse['status'] == '1') {
        final List<CategoryList> sliderData =
            (jsonResponse['categoryList'] as List)
                .map((p) => CategoryList.fromMap(p as Map<String, dynamic>))
                .toList();

        return right(sliderData);
      } else {
        return left(
          RestaurantFailure.serverError(
            jsonResponse['message'].toString(),
          ),
        );
      }
    } else {
      return left(
        const RestaurantFailure.serverError(
          "An unexpected error occurred while signing in. Please try again",
        ),
      );
    }
  }

  @override
  Future<Either<RestaurantFailure, List<RestaurantModel>>>
      fetchNearbyRestaurantList() async {
    final jsonBody = {
      'userlat': '21.362230',
      'userlng': '74.898978',
      // 'userToken': ApiConstants.apiUserToken,
    };

    final url = Uri.parse(
      ApiConstants.apiURL + ApiConstants.nearbyRestaurantAPI,
    );
    final response = await http.post(url, body: jsonBody);

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);

      if (jsonResponse['status'] == '1') {
        final List<RestaurantModel> restaurantData =
            (jsonResponse['restaurantList'] as List)
                .map((p) => RestaurantModel.fromMap(p as Map<String, dynamic>))
                .toList();

        
        return right(restaurantData);
      } else {
        return left(
          RestaurantFailure.serverError(
            jsonResponse['message'].toString(),
          ),
        );
      }
    } else {
      return left(
        const RestaurantFailure.serverError(
          "An unexpected error occurred while signing in. Please try again",
        ),
      );
    }
  }

  @override
  Future<Either<RestaurantFailure, List<CategorizedRestaurantModel>>>
      fetchCategoryWiseRestaurantList({required String category}) async {
    final jsonBody = {
      'serach_keyword': category,
      'userlat': '21.362230',
      'userlng': '74.898978',
    };

    final url = Uri.parse(
      ApiConstants.apiURL + ApiConstants.categorySearch,
    );
    final response = await http.post(url, body: jsonBody);

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);

      if (jsonResponse['status'] == '1') {
        final List<CategorizedRestaurantModel> restaurantData =
            (jsonResponse['restaurantList'] as List)
                .map(
                  (p) => CategorizedRestaurantModel.fromMap(
                    p as Map<String, dynamic>,
                  ),
                )
                .toList();

        return right(restaurantData);
      } else {
        return left(
          RestaurantFailure.serverError(
            jsonResponse['message'].toString(),
          ),
        );
      }
    } else {
      return left(
        const RestaurantFailure.serverError(
          "An unexpected error occurred while signing in. Please try again",
        ),
      );
    }
  }

  @override
  Future<Either<RestaurantFailure, List<SearchModel>>> fetchSearchResult({
    required String search,
  }) async {
    final jsonBody = {
      'serach_keyword': search,
      'userlat': '21.362230',
      'userlng': '74.898978',
    };

    final url = Uri.parse(
      ApiConstants.apiURL + ApiConstants.searchAPI,
    );
    final response = await http.post(url, body: jsonBody);

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);

      if (jsonResponse['status'] == '1') {
        final List<SearchModel> restaurantData =
            (jsonResponse['searchList'] as List)
                .map(
                  (p) => SearchModel.fromMap(
                    p as Map<String, dynamic>,
                  ),
                )
                .toList();
       
        return right(restaurantData);
      } else {
        print("error");
        return right([]);
      }
    } else {
      print("error");
      return left(
        const RestaurantFailure.serverError(
          "An unexpected error occurred while signing in. Please try again",
        ),
      );
    }
  }

  @override
  Future<Either<RestaurantFailure, RestaurantDetailModel>>
      fetchRestaurantDetail({required String restaurantID}) async {
    final jsonBody = {
      'restaurantId': restaurantID,
      'userlat': '21.362230',
      'userlng': '74.898978',
    };

    final url = Uri.parse(
      ApiConstants.apiURL + ApiConstants.restaurantDetailAPI,
    );
    final response = await http.post(url, body: jsonBody);

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);

      if (jsonResponse['status'] == '1') {
        final RestaurantDetailModel restaurantData =
            RestaurantDetailModel.fromMap(
                jsonResponse['restaurantDetails'] as Map<String, dynamic>);
      
        return right(restaurantData);
      } else {
        return left(
          RestaurantFailure.serverError(
            jsonResponse['message'].toString(),
          ),
        );
      }
    } else {
      print("error");
      return left(
        const RestaurantFailure.serverError(
          "An unexpected error occurred while signing in. Please try again",
        ),
      );
    }
  }

  @override
  Future<Either<RestaurantFailure, List<MenuModel>>> getCategoryWiseMenu({
    required String restaurantId,
    required String menu,
    required String custId,
  }) async {
    print("id $custId");
    final jsonBody = {
      'restaurantId': restaurantId,
      'categoryName': menu,
      'custId': custId,
    };

    final url = Uri.parse(
      ApiConstants.apiURL + ApiConstants.categoryWiseMenuAPI,
    );
    final response = await http.post(url, body: jsonBody);
    print(response.statusCode);
    
    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);

      if (jsonResponse['status'] == '1') {
        final List<MenuModel> restaurantData =
            (jsonResponse['menuList'] as List)
                .map(
                  (p) => MenuModel.fromMap(
                    p as Map<String, dynamic>,
                  ),
                )
                .toList();

        return right(restaurantData);
      } else {
        return left(
          RestaurantFailure.serverError(
            jsonResponse['message'].toString(),
          ),
        );
      }
    } else {
      return left(
        const RestaurantFailure.serverError(
          "An unexpected error occurred while signing in. Please try again",
        ),
      );
    }
  }
}
