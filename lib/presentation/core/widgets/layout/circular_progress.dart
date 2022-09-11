import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_template/presentation/core/styles/app_colors.dart';

Future<dynamic> showProgress(BuildContext context) {
  return showDialog(
    context: context,
    barrierDismissible: false,
    barrierColor: Colors.transparent,
    builder: (BuildContext context) {
      return const Center(
        child: SizedBox(
          height: 30,
          width: 30,
          child: CircularProgressIndicator(
            color: AppColors.primary,
          ),
        ),
      );
    },
  );
}
