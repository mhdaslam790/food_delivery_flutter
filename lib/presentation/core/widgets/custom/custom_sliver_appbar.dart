import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/application/auth/auth_bloc.dart';
import 'package:flutter_template/presentation/core/styles/app_colors.dart';

class CustomSliverDelegate extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final bool hideTitleWhenExpanded;

  CustomSliverDelegate({
    required this.expandedHeight,
    this.hideTitleWhenExpanded = true,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final appBarSize = expandedHeight - shrinkOffset;
    final cardTopPosition = expandedHeight / 2 - shrinkOffset;
    final proportion = 2 - (expandedHeight / appBarSize);
    final percent = proportion < 0 || proportion > 1 ? 0.0 : proportion;
    return SizedBox(
      height: expandedHeight + expandedHeight / 2,
      child: Stack(
        children: [
          SizedBox(
            height: appBarSize < kToolbarHeight ? kToolbarHeight : appBarSize,
            child: AppBar(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft:
                      Radius.circular(appBarSize < kToolbarHeight ? 0 : 50),
                  bottomRight:
                      Radius.circular(appBarSize < kToolbarHeight ? 0 : 50),
                ),
              ),
              leading: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.menu,
                  color: AppColors.white,
                ),
              ),
              // backgroundColor: Colors.green,
              actions: [
                IconButton(
                  icon: const Icon(
                    Icons.sort,
                    color: AppColors.white,
                  ),
                  onPressed: () async {
                    await showMenu(
                      context: context,
                      position: const RelativeRect.fromLTRB(100, 0, 0, 0),
                      items: [
                        PopupMenuItem<String>(
                          value: 'name',
                          onTap: () {
                            context.read<AuthBloc>().add(
                                const AuthEvent.changeSortByOrder(
                                    orderBy: 'name'));
                          },
                          child: const Text('Order by name'),
                        ),
                        PopupMenuItem<String>(
                          value: 'city',
                          onTap: () {
                            context.read<AuthBloc>().add(
                                const AuthEvent.changeSortByOrder(
                                    orderBy: 'city'));
                          },
                          child: const Text('Order by city'),
                        ),
                        PopupMenuItem<String>(
                          value: 'age',
                          onTap: () {
                            context.read<AuthBloc>().add(
                                const AuthEvent.changeSortByOrder(
                                    orderBy: 'age'));
                          },
                          child: const Text('Order by age'),
                        ),
                      ],
                      elevation: 8.0,
                    );
                  },
                ),
              ],
              elevation: 0.0,
              title: const Text(
                "User list",
              ),
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
