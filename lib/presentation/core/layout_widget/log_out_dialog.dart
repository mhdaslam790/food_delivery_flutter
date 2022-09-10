import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/presentation/core/layout_widget/progress_dialog.dart';
import 'package:restart_app/restart_app.dart';

import '../../../application/auth/auth_bloc.dart';

class LogOutDialog extends StatelessWidget {
  const LogOutDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      title: const Text(
        "Are you sure you want to Log Out?",
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
      ),
      actions: [
        TextButton(
          onPressed: () {
            AutoRouter.of(context).pop();
          },
          child: const Text(
            "cancel",
            style: TextStyle(fontSize: 15),
          ),
        ),
        TextButton(
          onPressed: () async {
            // AutoRouter.of(context).pop();
            context.read<AuthBloc>().add(const AuthEvent.signOut());
            AutoRouter.of(context).pop();
            showProgressingDialogue(context: context, text: "loging Out");
            await Future.delayed(
              const Duration(seconds: 3),
            );
            Restart.restartApp();
          },
          child: const Text(
            "yes",
            style: TextStyle(fontSize: 15),
          ),
        ),
      ],
    );
  }
}
