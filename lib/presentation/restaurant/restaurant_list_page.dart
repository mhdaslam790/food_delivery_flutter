import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/application/restaurant/restaurant_bloc.dart';

import 'package:flutter_template/presentation/core/widgets/layout/app_scaffold.dart';
import 'package:flutter_template/presentation/core/widgets/tile/info_tile.dart';
import 'package:flutter_template/presentation/core/widgets/tile/restaurant_tile.dart';

class RestaurantListPage extends StatefulWidget {
  const RestaurantListPage({Key? key}) : super(key: key);

  @override
  State<RestaurantListPage> createState() => _RestaurantListPageState();
}

class _RestaurantListPageState extends State<RestaurantListPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RestaurantBloc, RestaurantState>(
      builder: (context, state) {
        return AppScaffold(
          appBar: AppBar(
            iconTheme: Theme.of(context).primaryIconTheme,
            title: Text(state.categoryTitle),
          ),
          body: WillPopScope(
            onWillPop: () {
              context
                  .read<RestaurantBloc>()
                  .add(const RestaurantEvent.changePageOpened(value: false));
              return Future.value(true);
            },
            child: Padding(
              padding: EdgeInsets.all(10),
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: state.categorySearchedRestaurantList.length,
                physics: const ClampingScrollPhysics(),
                itemBuilder: (context, index) {
                  return RestaurantTile(
                    data: state.categorySearchedRestaurantList[index],
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider(
                    indent: 15,
                    endIndent: 15,
                    thickness: 1.5,
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
