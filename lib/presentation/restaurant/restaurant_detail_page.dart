import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_template/application/restaurant/restaurant_bloc.dart';
import 'package:flutter_template/domain/restaurant/restuarnt_detail_model.dart';
import 'package:flutter_template/presentation/core/styles/app_colors.dart';
import 'package:flutter_template/presentation/core/widgets/custom/restaurant_page_appbar.dart';
import 'package:flutter_template/presentation/core/widgets/layout/app_scaffold.dart';
import 'package:flutter_template/presentation/core/widgets/layout/sized_boxes.dart';

class RestaurantDetailPage extends StatelessWidget {
  final RestaurantDetailModel restaurantDetail;
  const RestaurantDetailPage({Key? key, required this.restaurantDetail})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: WillPopScope(
        onWillPop: () {
          context
              .read<RestaurantBloc>()
              .add(const RestaurantEvent.changePageOpened(value: false));
          return Future.value(true);
        },
        child: SafeArea(
          child: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverPersistentHeader(
                  pinned: true,
                  floating: true,
                  delegate: RestaurantPageCustomSliverDelegate(
                    expandedHeight: 150,
                    restaurantDetail: restaurantDetail,
                  ),
                ),
              ];
            },
            body: BlocBuilder<RestaurantBloc, RestaurantState>(
              builder: (context, state) {
                return ListView(
                  // mainAxisSize: MainAxisSize.min,
                  // shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    if (state.starterMenu.length > 0)
                      const MenuTitle(
                        title: "Starter",
                      ),
                    ListView.builder(
                      itemCount: state.starterMenu.length,
                      physics: const ClampingScrollPhysics(),
                      shrinkWrap: true,
                      // physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return ItemMenu(
                          title: state.starterMenu[index].foodMenuName,
                          price: state.starterMenu[index].customerPrice,
                        );
                      },
                    ),
                    if (state.soupMenu.length > 0)
                      const MenuTitle(
                        title: "Soup",
                      ),
                    ListView.builder(
                      itemCount: state.soupMenu.length,
                      physics: const ClampingScrollPhysics(),
                      shrinkWrap: true,
                      // physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return ItemMenu(
                          title: state.soupMenu[index].foodMenuName,
                          price: state.soupMenu[index].customerPrice,
                        );
                      },
                    ),
                    if (state.mainCourseMenu.length > 0)
                      const MenuTitle(
                        title: "Main Course",
                      ),
                    ListView.builder(
                      itemCount: state.mainCourseMenu.length,
                      physics: const ClampingScrollPhysics(),
                      shrinkWrap: true,
                      // physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return ItemMenu(
                          title: state.mainCourseMenu[index].foodMenuName,
                          price: state.mainCourseMenu[index].customerPrice,
                        );
                      },
                    ),
                    if (state.raitaMenu.length > 0)
                      const MenuTitle(
                        title: "Papad / Raita",
                      ),
                    ListView.builder(
                      itemCount: state.raitaMenu.length,
                      physics: const ClampingScrollPhysics(),
                      shrinkWrap: true,
                      // physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return ItemMenu(
                          title: state.raitaMenu[index].foodMenuName,
                          price: state.raitaMenu[index].customerPrice,
                        );
                      },
                    ),
                    if (state.rotiMenu.length > 0)
                      const MenuTitle(
                        title: "Chapati / Roti",
                      ),
                    ListView.builder(
                      itemCount: state.rotiMenu.length,
                      physics: const ClampingScrollPhysics(),
                      shrinkWrap: true,
                      // physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return ItemMenu(
                          title: state.rotiMenu[index].foodMenuName,
                          price: state.rotiMenu[index].customerPrice,
                        );
                      },
                    ),
                    if (state.riceMenu.length > 0)
                      const MenuTitle(
                        title: "Rice",
                      ),
                    ListView.builder(
                      itemCount: state.riceMenu.length,
                      physics: const ClampingScrollPhysics(),
                      shrinkWrap: true,
                      // physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return ItemMenu(
                          title: state.riceMenu[index].foodMenuName,
                          price: state.riceMenu[index].customerPrice,
                        );
                      },
                    ),
                    if (state.chineseMenu.length > 0)
                      const MenuTitle(
                        title: "Chinese Food",
                      ),
                    ListView.builder(
                      itemCount: state.chineseMenu.length,
                      physics: const ClampingScrollPhysics(),
                      shrinkWrap: true,
                      // physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return ItemMenu(
                          title: state.chineseMenu[index].foodMenuName,
                          price: state.chineseMenu[index].customerPrice,
                        );
                      },
                    ),
                    if (state.beverageMenu.length > 0)
                      const MenuTitle(
                        title: "Beverages",
                      ),
                    ListView.builder(
                      itemCount: state.beverageMenu.length,
                      physics: const ClampingScrollPhysics(),
                      shrinkWrap: true,
                      // physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return ItemMenu(
                          title: state.beverageMenu[index].foodMenuName,
                          price: state.beverageMenu[index].customerPrice,
                        );
                      },
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class ItemMenu extends StatelessWidget {
  const ItemMenu({
    Key? key,
    required this.title,
    required this.price,
  }) : super(key: key);
  final String title;
  final String price;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(
                  "assets/images/food.jpg",
                ), // picked file
                fit: BoxFit.fill,
              ),
            ),
          ),
          const SizedBoxW5(),
          SizedBox(
            width: MediaQuery.of(context).size.width * .45,
            height: 50,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBoxW5(),
                Flexible(
                  child: Text(
                    title,
                    style: Theme.of(context).primaryTextTheme.bodyText2,
                  ),
                ),
                const SizedBoxH5(),
                Text(
                  "Rs $price",
                  style: Theme.of(context)
                      .primaryTextTheme
                      .bodyText2!
                      .copyWith(color: AppColors.grey),
                ),
              ],
            ),
          ),
          // SizedBox(
          //   width: MediaQuery.of(context).size.width * .09,
          // ),
          SizedBox(
            height: 40,
            width: 100,
            child: Card(
              elevation: 5,
              child: InkWell(
                onTap: () {},
                child: const Center(
                    child: Text(
                  "ADD",
                  style: TextStyle(
                      color: Colors.amber, fontWeight: FontWeight.w700),
                )),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class MenuTitle extends StatelessWidget {
  final String title;
  const MenuTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          title,
          style: Theme.of(context).primaryTextTheme.headline1,
        ),
      ),
    );
  }
}
