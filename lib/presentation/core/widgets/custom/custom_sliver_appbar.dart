import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/application/auth/auth_bloc.dart';
import 'package:flutter_template/application/restaurant/restaurant_bloc.dart';
import 'package:flutter_template/presentation/core/styles/app_colors.dart';
import 'package:flutter_template/presentation/core/widgets/layout/circular_progress.dart';
import 'package:flutter_template/presentation/drawer/custom_drawer.dart';

class CustomSliverDelegate extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final bool hideTitleWhenExpanded;

  CustomSliverDelegate({
    required this.expandedHeight,
    this.hideTitleWhenExpanded = true,
  });

  TextEditingController controller = TextEditingController();
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final appBarSize = expandedHeight - shrinkOffset;
    final cardTopPosition = expandedHeight / 2 - shrinkOffset;
    final proportion = 2 - (expandedHeight / appBarSize);
    final percent = proportion < 0 || proportion > 1 ? 0.0 : proportion;
    return SizedBox(
      height: expandedHeight + expandedHeight / 2,
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          return Stack(
            children: [
              SizedBox(
                height:
                    appBarSize < kToolbarHeight ? kToolbarHeight : appBarSize,
                child: AppBar(
                  automaticallyImplyLeading: false,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      bottomLeft:
                          Radius.circular(appBarSize < kToolbarHeight ? 0 : 50),
                      bottomRight:
                          Radius.circular(appBarSize < kToolbarHeight ? 0 : 50),
                    ),
                  ),
                  leading: IconButton(
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                    icon: const Icon(
                      Icons.menu,
                      color: AppColors.white,
                    ),
                  ),
                  // backgroundColor: Colors.green,
                  actions: [
                    InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.location_on_outlined,
                              color: AppColors.white,
                            ),
                            Text(
                              state.street == "" ? "Locality" : state.street,
                              style: TextStyle(
                                  color: AppColors.white, fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                  elevation: 0.0,

                  // title: const Text(
                  //   "User list",
                  // ),
                ),
              ),
              Positioned(
                left: 0.0,
                right: 0.0,
                top: cardTopPosition > 0 ? cardTopPosition : 0,
                bottom: 0.0,
                child: Opacity(
                  opacity: percent,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30 * percent),
                    child: Center(
                      child: Card(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(100),
                          ),
                        ),
                        elevation: 10,
                        child: TextField(
                          controller: controller,
                          textInputAction: TextInputAction.go,
                          onSubmitted: (value) {
                            context.read<RestaurantBloc>().add(
                                RestaurantEvent.searchList(
                                    searchKeyWord: value));
                            controller.clear();
                            showProgress(context);
                          },
                          decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.search,
                              color: Colors.grey,
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.transparent,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                              ),
                              borderRadius: BorderRadius.circular(100.0),
                            ),
                            disabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.transparent,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100.0),
                              borderSide:
                                  const BorderSide(color: Colors.transparent),
                            ),
                            filled: true,
                            hintStyle: TextStyle(color: Colors.grey[800]),
                            hintText: "Search",
                            fillColor: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  @override
  double get maxExtent => expandedHeight + expandedHeight / 2;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
