import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/application/restaurant/restaurant_bloc.dart';

import 'package:flutter_template/presentation/core/widgets/layout/app_scaffold.dart';
import 'package:flutter_template/presentation/core/widgets/layout/no_result_found.dart';
import 'package:flutter_template/presentation/core/widgets/tile/info_tile.dart';
import 'package:flutter_template/presentation/core/widgets/tile/restaurant_tile.dart';
import 'package:flutter_template/presentation/core/widgets/tile/search_result_tile.dart';

class SearchResultPage extends StatelessWidget {
  const SearchResultPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RestaurantBloc, RestaurantState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return AppScaffold(
          appBar: AppBar(
            iconTheme: Theme.of(context).primaryIconTheme,
            title: Text(state.searchPageTitle),
          ),
          body: WillPopScope(
            onWillPop: () {
              context
                  .read<RestaurantBloc>()
                  .add(const RestaurantEvent.changePageOpened(value: false));
              return Future.value(true);
            },
            child: Padding(
                padding: const EdgeInsets.all(10),
                child: state.searchResultList.length > 0
                    ? ListView.separated(
                        shrinkWrap: true,
                        itemCount: state.searchResultList.length,
                        physics: const ClampingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return SearchTile(
                            data: state.searchResultList[index],
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const Divider(
                            indent: 15,
                            endIndent: 15,
                            thickness: 1.5,
                          );
                        },
                      )
                    : const NoResultFound()),
          ),
        );
      },
    );
  }
}
