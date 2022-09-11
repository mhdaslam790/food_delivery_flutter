part of 'restaurant_bloc.dart';

@freezed
class RestaurantState with _$RestaurantState {
  const factory RestaurantState({
    required Option<Either<RestaurantFailure, Unit>>
        fetchcategorySearchedRestaurantListFialureORSuccessOpt,
    required Option<Either<RestaurantFailure, Unit>>
        searchResultFailureSuccessOption,
    required List<SliderList> sliderList,
    required List<CategoryList> categoryList,
    required List<RestaurantModel> restaurantList,
    required List<CategorizedRestaurantModel> categorySearchedRestaurantList,
    required List<SearchModel> searchResultList,
    required String categoryTitle,
    required String searchPageTitle,
    required Option<Either<RestaurantFailure, RestaurantDetailModel>>
        restaurantDetailFailureSuccessOpt,
    required List<MenuModel> starterMenu,
    required List<MenuModel> mainCourseMenu,
    required List<MenuModel> soupMenu,
    required List<MenuModel> rotiMenu,
    required List<MenuModel> raitaMenu,
    required List<MenuModel> riceMenu,
    required List<MenuModel> chineseMenu,
    required List<MenuModel> beverageMenu,
    required int current,
    required bool idPageOpen,
  }) = _RestaurantState;

  factory RestaurantState.initial() => RestaurantState(
        fetchcategorySearchedRestaurantListFialureORSuccessOpt: none(),
        sliderList: [],
        categoryList: [],
        restaurantList: [],
        categorySearchedRestaurantList: [],
        searchResultList: [],
        categoryTitle: '',
        searchResultFailureSuccessOption: none(),
        restaurantDetailFailureSuccessOpt: none(),
        starterMenu: [],
        searchPageTitle: "",
        beverageMenu: [],
        chineseMenu: [],
        mainCourseMenu: [],
        raitaMenu: [],
        riceMenu: [],
        soupMenu: [],
        rotiMenu: [],
        current: 0,
        idPageOpen: false,
      );
}
