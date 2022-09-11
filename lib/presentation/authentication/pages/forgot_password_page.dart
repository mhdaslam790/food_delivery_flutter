import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/application/auth/auth_bloc.dart';
import 'package:flutter_template/presentation/core/widgets/buttons/rounded_filled_button.dart';
import 'package:flutter_template/presentation/core/widgets/custom/custom_app_bar.dart';
import 'package:flutter_template/presentation/core/widgets/custom/custom_text_field.dart';
import 'package:flutter_template/presentation/core/widgets/layout/app_scaffold.dart';
import 'package:flutter_template/presentation/core/widgets/layout/logo_widget.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ForgotPasswordPage extends StatelessWidget {
  ForgotPasswordPage({Key? key}) : super(key: key);
  final TextEditingController _emailTEC = TextEditingController();
  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        state.emailSendFailureOrSuccessOption.fold(
          () {},
          (some) {
            some.fold(
              (failure) {
                Fluttertoast.showToast(
                  msg: failure.maybeMap(
                    userNotFound: (e) =>
                        "No user found corresponding to this email address.",
                    serverError: (e) => e.toString(),
                    orElse: () =>
                        "An unexpected error occurred. Please try again",
                  ),
                );
              },
              (success) {
                Fluttertoast.showToast(
                  msg: "Password reset email sent successfully.",
                );
                AutoRouter.of(context).pop();
              },
            );
          },
        );
      },
      builder: (context, state) {
        return AppScaffold(
          // backgroundColor: const Color(0xFFf2cc8f),
          appBar: const CustomAppBar(title: "Reset password"),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const Spacer(),
                const AppLogo(),
                const SizedBox(height: 60),
                Form(
                  key: _key,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      CustomTextField(
                        decoration: InputDecoration(
                          isDense: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          labelText: "Email",
                          labelStyle: const TextStyle(color: Colors.grey),
                        ),
                        controller: _emailTEC,
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(height: 40.0),
                      RoundedFilledButton(
                        onTap: () {
                          if (_key.currentState!.validate()) {}
                        },
                        text: "Reset Password",
                      ),
                    ],
                  ),
                ),
                const Spacer(flex: 2),
              ],
            ),
          ),
        );
      },
    );
  }
}
