part of 'restaurant_bloc.dart';

@freezed
class RestaurantEvent with _$RestaurantEvent {
  const factory RestaurantEvent.fetchSliderList() = _FetchSliderList;
  const factory RestaurantEvent.fetchCategoryList() = _FetchCateegoryList;
  const factory RestaurantEvent.fetchRestaurantList() = _FetchRestaurantList;
  const factory RestaurantEvent.fetchCategoryWiseRestaurantList(
      {required String category}) = _fetchCategoryWiseRestaurantList;
  const factory RestaurantEvent.searchList({required String searchKeyWord}) =
      _SearchList;
  const factory RestaurantEvent.getRestaurantDetail(
      {required String restaurantId}) = _GetRestaurantDetail;
  const factory RestaurantEvent.getCategoryWiseMenu({
    required String restaurantId,
    required String menu,
    required String custId,
  }) = _GetCategoryWiseMenu;
  const factory RestaurantEvent.changeCurrentIndex({required int current}) =
      _ChangeCurrentIndex;
  const factory RestaurantEvent.changePageOpened({required bool value}) =
      _ChangePageOpened;
}
