import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/application/auth/auth_bloc.dart';
import 'package:flutter_template/application/restaurant/restaurant_bloc.dart';
import 'package:flutter_template/domain/restaurant/restaurant_model.dart';
import 'package:flutter_template/presentation/core/styles/app_colors.dart';
import 'package:flutter_template/presentation/core/widgets/bottom_sheet_panel.dart';
import 'package:flutter_template/presentation/core/widgets/custom/custom_sliver_appbar.dart';
import 'package:flutter_template/presentation/core/widgets/layout/app_scaffold.dart';
import 'package:flutter_template/presentation/core/widgets/layout/sized_boxes.dart';
import 'package:flutter_template/presentation/core/widgets/tile/info_tile.dart';
import 'package:flutter_template/presentation/core/widgets/tile/menu_tile.dart';
import 'package:flutter_template/presentation/drawer/custom_drawer.dart';
import 'package:flutter_template/presentation/routes/router.gr.dart';
import 'package:fluttertoast/fluttertoast.dart';

class BasePage extends StatefulWidget {
  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  final CarouselController carouselController = CarouselController();

  final _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      drawer: const CustomDrawer(),
      backgroundColor: const Color(0xFFF0F0F0),
      resizeToAvoidBottomInset: true,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // showModalBottomSheet(
          //   shape: const RoundedRectangleBorder(
          //     borderRadius: BorderRadius.only(
          //       topLeft: Radius.circular(10),
          //       topRight: Radius.circular(10),
          //     ),
          //   ),
          //   isScrollControlled: true,
          //   context: context,
          //   builder: (builder) => BottomSheetPanel(),
          // );
        },
        backgroundColor: AppColors.primary,
        child: const Icon(
          Icons.shopping_cart,
        ),
      ),
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverPersistentHeader(
                pinned: true,
                floating: true,
                delegate: CustomSliverDelegate(
                  expandedHeight: 110,
                ),
              ),
            ];
          },
          body: BlocConsumer<RestaurantBloc, RestaurantState>(
            listener: (context, state) {
              state.fetchcategorySearchedRestaurantListFialureORSuccessOpt.fold(
                () {},
                (some) {
                  some.fold(
                    (failure) {
                      Fluttertoast.showToast(
                        msg: failure.maybeMap(
                          serverError: (e) => e.error,
                          orElse: () =>
                              "An unexpected error occurred. Please try again",
                        ),
                      );
                      // AutoRouter.of(context).pop();
                    },
                    (success) {
                      print("called");
                      AutoRouter.of(context).push(const RestaurantListRoute());
                    },
                  );
                },
              );

              state.restaurantDetailFailureSuccessOpt.fold(
                () {},
                (some) {
                  some.fold(
                    (failure) {
                      // Fluttertoast.showToast(
                      //   msg: failure.maybeMap(
                      //     serverError: (e) => e.error,
                      //     orElse: () =>
                      //         "An unexpected error occurred. Please try again",
                      //   ),
                      // );
                      // AutoRouter.of(context).pop();
                    },
                    (success) {
                      print(context.read<AuthBloc>().state.signedInUser.custId);
                      context.read<RestaurantBloc>().add(
                            RestaurantEvent.getCategoryWiseMenu(
                              restaurantId: success.restaurantId,
                              menu: "Starter",
                              custId: context
                                  .read<AuthBloc>()
                                  .state
                                  .signedInUser
                                  .custId,
                            ),
                          );
                      context.read<RestaurantBloc>().add(
                            RestaurantEvent.getCategoryWiseMenu(
                              restaurantId: success.restaurantId,
                              menu: "Soup",
                              custId: context
                                  .read<AuthBloc>()
                                  .state
                                  .signedInUser
                                  .custId,
                            ),
                          );
                      context.read<RestaurantBloc>().add(
                            RestaurantEvent.getCategoryWiseMenu(
                              restaurantId: success.restaurantId,
                              menu: "Main Course",
                              custId: context
                                  .read<AuthBloc>()
                                  .state
                                  .signedInUser
                                  .custId,
                            ),
                          );
                      context.read<RestaurantBloc>().add(
                            RestaurantEvent.getCategoryWiseMenu(
                              restaurantId: success.restaurantId,
                              menu: "Papad / Raita",
                              custId: context
                                  .read<AuthBloc>()
                                  .state
                                  .signedInUser
                                  .custId,
                            ),
                          );
                      context.read<RestaurantBloc>().add(
                            RestaurantEvent.getCategoryWiseMenu(
                              restaurantId: success.restaurantId,
                              menu: "Chapati / Roti",
                              custId: context
                                  .read<AuthBloc>()
                                  .state
                                  .signedInUser
                                  .custId,
                            ),
                          );
                      context.read<RestaurantBloc>().add(
                            RestaurantEvent.getCategoryWiseMenu(
                              restaurantId: success.restaurantId,
                              menu: "Rice",
                              custId: context
                                  .read<AuthBloc>()
                                  .state
                                  .signedInUser
                                  .custId,
                            ),
                          );
                      context.read<RestaurantBloc>().add(
                            RestaurantEvent.getCategoryWiseMenu(
                              restaurantId: success.restaurantId,
                              menu: "Chinese Food",
                              custId: context
                                  .read<AuthBloc>()
                                  .state
                                  .signedInUser
                                  .custId,
                            ),
                          );
                      context.read<RestaurantBloc>().add(
                            RestaurantEvent.getCategoryWiseMenu(
                              restaurantId: success.restaurantId,
                              menu: "Beverages",
                              custId: context
                                  .read<AuthBloc>()
                                  .state
                                  .signedInUser
                                  .custId,
                            ),
                          );
                      // AutoRouter.of(context).pop();

                      AutoRouter.of(context).push(
                          RestaurantDetailRoute(restaurantDetail: success));
                    },
                  );
                },
              );
              state.searchResultFailureSuccessOption.fold(
                () {},
                (some) {
                  some.fold(
                    (failure) {
                      Fluttertoast.showToast(
                        msg: failure.maybeMap(
                          serverError: (e) => e.error,
                          orElse: () =>
                              "An unexpected error occurred. Please try again",
                        ),
                      );
                      // AutoRouter.of(context).pop();
                    },
                    (success) {
                      AutoRouter.of(context).pop();
                      AutoRouter.of(context).push(const SearchResultRoute());
                    },
                  );
                },
              );
            },
            builder: (context, state) {
              return ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  Column(
                    children: [
                      CarouselSlider(
                        items: state.sliderList.map((i) {
                          return Container(
                            margin: const EdgeInsets.all(5.0),
                            child: ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(5.0)),
                              child: Stack(
                                children: <Widget>[
                                  InkWell(
                                    onTap: () {
                                      print("you click  ${i} ");
                                    },
                                    child: Image.asset(
                                      "assets/images/food.jpg",
                                      fit: BoxFit.cover,
                                      width: 1000.0,
                                      filterQuality: FilterQuality.low,
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: Text(
                                      i.restaurantName,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }).toList(),
                        options: CarouselOptions(
                          height: 150,
                          autoPlay: true,
                          autoPlayInterval: const Duration(seconds: 3),
                          enlargeCenterPage: true,
                          onPageChanged: (index, reason) {
                            // setState(() {
                            context.read<RestaurantBloc>().add(
                                RestaurantEvent.changeCurrentIndex(
                                    current: index));
                            // });
                          },
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: state.sliderList.asMap().entries.map((entry) {
                          return GestureDetector(
                            onTap: () =>
                                carouselController.animateToPage(entry.key),
                            child: Container(
                              width: 12.0,
                              height: 12.0,
                              margin: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 4.0),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: state.current == entry.key
                                    ? const Color.fromRGBO(0, 0, 0, 0.9)
                                    : const Color.fromRGBO(0, 0, 0, 0.4),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Categories",
                        style: Theme.of(context).primaryTextTheme.headline4,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 100,
                    // width: MediaQuery.of(context).size.width * .6,
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: state.categoryList.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return MenuTile(
                          name: state.categoryList[index].foodCategoryName,
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Nearby Restaurants",
                        style: Theme.of(context).primaryTextTheme.headline4,
                      ),
                    ),
                  ),
                  ListView.separated(
                    shrinkWrap: true,
                    itemCount: state.restaurantList.length,
                    physics: const ClampingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return InfoTile(data: state.restaurantList[index]);
                    },
                    separatorBuilder: (context, index) {
                      return const Divider(
                        indent: 15,
                        endIndent: 15,
                        thickness: 1.5,
                      );
                    },
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
