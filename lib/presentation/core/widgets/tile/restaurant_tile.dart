import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/application/restaurant/restaurant_bloc.dart';
import 'package:flutter_template/domain/restaurant/cat_rest_model.dart';
import 'package:flutter_template/presentation/core/widgets/layout/sized_boxes.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RestaurantTile extends StatelessWidget {
  const RestaurantTile({
    Key? key,
    required this.data,
  }) : super(key: key);
  final CategorizedRestaurantModel data;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Fluttertoast.showToast(msg: "Loading menu items");

        context.read<RestaurantBloc>().add(
              RestaurantEvent.getRestaurantDetail(
                restaurantId: data.restaurantId,
              ),
            );
      },
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
                          data.restaurantName,
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
                  Row(
                    children: [
                      // Text(
                      //   data.currentStatus,
                      //   style: const TextStyle(
                      //     overflow: TextOverflow.ellipsis,
                      //     fontSize: 14,
                      //   ),
                      // ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        data.restaurantType.length > 10
                            ? data.restaurantType.contains('_')
                                ? "Veg and Non veg"
                                : "Veg"
                            : "Veg",
                        style: const TextStyle(
                          overflow: TextOverflow.ellipsis,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  const SizedBoxH10(),
                  Row(
                    children: [
                      Icon(Icons.location_on),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        "${double.parse(data.distance).toStringAsFixed(1)} KM",
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
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
