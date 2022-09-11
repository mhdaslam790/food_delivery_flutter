import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/application/restaurant/restaurant_bloc.dart';
import 'package:flutter_template/presentation/core/widgets/layout/sized_boxes.dart';

class MenuTile extends StatelessWidget {
  final String name;
  const MenuTile({
    Key? key,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
      child: InkWell(
        onTap: () {
          context.read<RestaurantBloc>().add(
                RestaurantEvent.fetchCategoryWiseRestaurantList(category: name),
              );
        },
        child: Column(
          children: [
            Text(
              name,
              // style: Theme.of(context).primaryTextTheme.headline6,
            ),
            const SizedBoxH5(),
            Container(
              width: 50,
              height: 50,
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
            // CircleAvatar(
            //   backgroundColor: AppColors.primary,
            //   child: Image.asset(
            //     "assets/images/food.jpg",
            //     fit: BoxFit.fill,
            //     // width: 1000.0,
            //     filterQuality: FilterQuality.low,
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
