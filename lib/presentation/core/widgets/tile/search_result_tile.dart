import 'package:flutter/material.dart';
import 'package:flutter_template/domain/restaurant/search_model.dart';
import 'package:flutter_template/presentation/core/widgets/layout/sized_boxes.dart';

class SearchTile extends StatelessWidget {
  const SearchTile({
    Key? key,
    required this.data,
  }) : super(key: key);
  final SearchModel data;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Row(
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
            Flexible(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBoxH5(),
                  Row(
                    children: [
                      const SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: Text(
                          data.foodMenuName != null
                              ? data.foodMenuName!
                              : data.restaurantName!,
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                            fontSize: 16,
                            overflow: TextOverflow.ellipsis,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBoxH10(),
                  // Row(
                  //   children: [
                  //     // Text(
                  //     //   data.currentStatus,
                  //     //   style: const TextStyle(
                  //     //     overflow: TextOverflow.ellipsis,
                  //     //     fontSize: 14,
                  //     //   ),
                  //     // ),
                  //     const SizedBox(
                  //       width: 5,
                  //     ),
                  //     // Text(
                  //     //   data.restaurantType.length > 10
                  //     //       ? data.restaurantType.contains('_')
                  //     //           ? "Veg and Non veg"
                  //     //           : "Veg"
                  //     //       : "Veg",
                  //     //   style: const TextStyle(
                  //     //     overflow: TextOverflow.ellipsis,
                  //     //     fontSize: 14,
                  //     //   ),
                  //     // ),
                  //   ],
                  // ),
                  const SizedBoxH10(),
                  // Row(
                  //   children: [
                  //     Icon(Icons.location_on),
                  //     const SizedBox(
                  //       width: 5,
                  //     ),
                  //     Text(
                  //       "${double.parse(data.distance).toStringAsFixed(1)} KM",
                  //       style: const TextStyle(
                  //         fontSize: 14,
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  const SizedBoxH5(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
