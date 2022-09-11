import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_template/domain/restaurant/I_restaurant_facade.dart';
import 'package:flutter_template/domain/restaurant/cat_rest_model.dart';
import 'package:flutter_template/domain/restaurant/category_model.dart';
import 'package:flutter_template/domain/restaurant/menu_model.dart';
import 'package:flutter_template/domain/restaurant/restaurant_failure.dart';
import 'package:flutter_template/domain/restaurant/restaurant_model.dart';
import 'package:flutter_template/domain/restaurant/restuarnt_detail_model.dart';
import 'package:flutter_template/domain/restaurant/search_model.dart';
import 'package:flutter_template/domain/restaurant/slider_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'restaurant_bloc.freezed.dart';
part 'restaurant_event.dart';
part 'restaurant_state.dart';

@injectable
class RestaurantBloc extends Bloc<RestaurantEvent, RestaurantState> {
  final IRestaurantFacade _iRestaurantFacade;

  RestaurantBloc(this._iRestaurantFacade) : super(RestaurantState.initial());

  @override
  Stream<RestaurantState> mapEventToState(
    RestaurantEvent event,
  ) async* {
    yield* event.map(
      fetchSliderList: (e) async* {
        final opt = await _iRestaurantFacade.fetchSliderList();
        yield opt.fold(
          (failure) => state.copyWith(
            fetchcategorySearchedRestaurantListFialureORSuccessOpt: none(),
          ),
          (r) => state.copyWith(
            sliderList: r,
            fetchcategorySearchedRestaurantListFialureORSuccessOpt: none(),
          ),
        );
      },
      fetchCategoryList: (_) async* {
        final opt = await _iRestaurantFacade.fetchCategoryList();
        yield opt.fold(
          (failure) => state.copyWith(
            fetchcategorySearchedRestaurantListFialureORSuccessOpt: none(),
          ),
          (r) => state.copyWith(
            categoryList: r,
            fetchcategorySearchedRestaurantListFialureORSuccessOpt: none(),
          ),
        );
      },
      fetchRestaurantList: (e) async* {
        final opt = await _iRestaurantFacade.fetchNearbyRestaurantList();
        yield opt.fold(
          (failure) => state.copyWith(
            fetchcategorySearchedRestaurantListFialureORSuccessOpt: none(),
          ),
          (r) => state.copyWith(
            restaurantList: r,
            fetchcategorySearchedRestaurantListFialureORSuccessOpt: none(),
          ),
        );
      },
      fetchCategoryWiseRestaurantList: (e) async* {
        print(e.category);
        final opt = await _iRestaurantFacade.fetchCategoryWiseRestaurantList(
          category: e.category,
        );
        yield state.copyWith(
          fetchcategorySearchedRestaurantListFialureORSuccessOpt: none(),
        );
        yield opt.fold(
            (failure) => state.copyWith(
                  categoryTitle: e.category,
                  fetchcategorySearchedRestaurantListFialureORSuccessOpt:
                      some(left(failure)),
                  searchResultFailureSuccessOption: none(),
                  restaurantDetailFailureSuccessOpt: none(),
                ), (r) {
          print("length${r.length}");
          return state.copyWith(
            categoryTitle: e.category,
            categorySearchedRestaurantList: r,
            fetchcategorySearchedRestaurantListFialureORSuccessOpt: some(
              right(unit),
            ),
            searchResultFailureSuccessOption: none(),
            restaurantDetailFailureSuccessOpt: none(),
          );
        });
        // yield state.copyWith(
        //   fetchcategorySearchedRestaurantListFialureORSuccessOpt: none(),
        // );
      },
      searchList: (e) async* {
        final opt = await _iRestaurantFacade.fetchSearchResult(
          search: e.searchKeyWord,
        );
        yield opt.fold(
            (failure) => state.copyWith(
                  categoryTitle: e.searchKeyWord,
                  fetchcategorySearchedRestaurantListFialureORSuccessOpt:
                      none(),
                  searchResultFailureSuccessOption: none(),
                ), (r) {
          print(r.length);
          return state.copyWith(
            searchPageTitle:
                r.length > 0 ? r.first.searchType! : e.searchKeyWord,
            searchResultList: r,
            searchResultFailureSuccessOption: some(right(unit)),
            fetchcategorySearchedRestaurantListFialureORSuccessOpt: none(),
            restaurantDetailFailureSuccessOpt: none(),
          );
        });
      },
      getRestaurantDetail: (e) async* {
        final opt = await _iRestaurantFacade.fetchRestaurantDetail(
          restaurantID: e.restaurantId,
        );
        yield opt.fold(
            (failure) => state.copyWith(
                  // categoryTitle: e.searchKeyWord,
                  fetchcategorySearchedRestaurantListFialureORSuccessOpt:
                      none(),
                  searchResultFailureSuccessOption: none(),
                  restaurantDetailFailureSuccessOpt: some(
                    left(failure),
                  ),
                ), (r) {
          // print(r.length);
          return state.copyWith(
            restaurantDetailFailureSuccessOpt: some(
              right(r),
            ),
            fetchcategorySearchedRestaurantListFialureORSuccessOpt: none(),
            searchResultFailureSuccessOption: none(),
          );
        });
      },
      getCategoryWiseMenu: (e) async* {
        final opt = await _iRestaurantFacade.getCategoryWiseMenu(
            restaurantId: e.restaurantId, custId: e.custId, menu: e.menu);
        yield opt.fold(
            (failure) => state.copyWith(
                  // categoryTitle: e.searchKeyWord,
                  fetchcategorySearchedRestaurantListFialureORSuccessOpt:
                      none(),
                  searchResultFailureSuccessOption: none(),
                  restaurantDetailFailureSuccessOpt: some(
                    left(failure),
                  ),
                ), (r) {
          // print(r.length);
          return state.copyWith(
            starterMenu: e.menu == 'Starter' ? r : state.starterMenu,
            beverageMenu: e.menu == 'Beverages' ? r : state.beverageMenu,
            chineseMenu: e.menu == 'Chinese Food' ? r : state.chineseMenu,
            mainCourseMenu: e.menu == 'Main Course' ? r : state.mainCourseMenu,
            raitaMenu: e.menu == 'Papad / Raita' ? r : state.raitaMenu,
            riceMenu: e.menu == 'Rice' ? r : state.riceMenu,
            soupMenu: e.menu == 'Soup' ? r : state.soupMenu,
            rotiMenu: e.menu == 'Chapati / Roti' ? r : state.rotiMenu,
            restaurantDetailFailureSuccessOpt: none(),
            fetchcategorySearchedRestaurantListFialureORSuccessOpt: none(),
            searchResultFailureSuccessOption: none(),
          );
        });
      },
      changeCurrentIndex: (e) async* {
        yield state.copyWith(current: e.current);
      },
      changePageOpened: (e) async* {
        yield state.copyWith(
          idPageOpen: e.value,
          restaurantDetailFailureSuccessOpt: none(),
          fetchcategorySearchedRestaurantListFialureORSuccessOpt: none(),
          searchResultFailureSuccessOption: none(),
        );
      },
    );
  }
}
