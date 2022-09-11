import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';

class NoResultFound extends StatelessWidget {
  const NoResultFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Lottie.asset(
            'assets/animation/no-records-found.json',
            height: 200,
          ),
          Text(
            "No result found.",
            style: Theme.of(context).primaryTextTheme.headline6,
          )
        ],
      ),
    );
  }
}
