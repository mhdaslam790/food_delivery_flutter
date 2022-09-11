import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_template/domain/restaurant/restuarnt_detail_model.dart';

class RestaurantPageCustomSliverDelegate
    extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final bool hideTitleWhenExpanded;
  final RestaurantDetailModel restaurantDetail;
  RestaurantPageCustomSliverDelegate({
    required this.restaurantDetail,
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
      child: Stack(
        children: [
          SizedBox(
            height: appBarSize < kToolbarHeight ? kToolbarHeight : appBarSize,
            child: AppBar(
              iconTheme: Theme.of(context).primaryIconTheme,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft:
                      Radius.circular(appBarSize < kToolbarHeight ? 0 : 50),
                ),
              ),
              elevation: 0.0,
              title: Opacity(
                  opacity: hideTitleWhenExpanded ? 1.0 - percent : 1.0,
                  child: Text(restaurantDetail.restaurantName)),
            ),
          ),
          Positioned(
            left: 0.0,
            right: MediaQuery.of(context).size.width * .55,
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
                    child: Container(
                      width: 100,
                      height: 100,
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
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: MediaQuery.of(context).size.width * .3,
            right: 0.0,
            top: cardTopPosition > 0
                ? cardTopPosition +
                    (restaurantDetail.restaurantName.length > 23 ? 25 : 40)
                : 0,
            bottom: 0.0,
            child: Opacity(
              opacity: percent,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30 * percent),
                child: Text(
                  restaurantDetail.restaurantName,
                  style: const TextStyle(
                    color: Colors.white, 
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: MediaQuery.of(context).size.width * .3,
            right: 0.0,
            top: cardTopPosition > 0 ? cardTopPosition + 80 : 0,
            bottom: 0.0,
            child: Opacity(
              opacity: percent,
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30 * percent),
                  child: IgnorePointer(
                    child: RatingBar.builder(
                      initialRating: 3.5,
                      minRating: 1,
                      allowHalfRating: true,
                      itemSize: 25,
                      itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),
                  )),
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
