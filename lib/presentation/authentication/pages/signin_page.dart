import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/application/auth/auth_bloc.dart';
import 'package:flutter_template/application/restaurant/restaurant_bloc.dart';
import 'package:flutter_template/domain/core/validators.dart';
import 'package:flutter_template/presentation/core/styles/app_colors.dart';
import 'package:flutter_template/presentation/core/widgets/buttons/rounded_filled_button.dart';
import 'package:flutter_template/presentation/core/widgets/custom/custom_app_bar.dart';
import 'package:flutter_template/presentation/core/widgets/layout/app_scaffold.dart';
import 'package:flutter_template/presentation/core/widgets/layout/logo_widget.dart';
import 'package:flutter_template/presentation/routes/router.gr.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/widgets/layout/circular_progress.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({Key? key}) : super(key: key);

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  final TextEditingController _emailTEC = TextEditingController();

  final TextEditingController _passwordTEC = TextEditingController();

  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        state.authFailureOrSuccessOption.fold(
          () {},
          (some) {
            some.fold(
              (failure) {
                Fluttertoast.showToast(
                  msg: failure.maybeMap(
                    userNotFound: (e) => "User not found.",
                    invalidEmailAndPasswordCombination: (e) =>
                        "Invalid email and password combination. Please try again",
                    serverError: (e) => e.error,
                    orElse: () =>
                        "An unexpected error occurred. Please try again",
                  ),
                );
                AutoRouter.of(context).pop();
              },
              (success) {
                context.read<RestaurantBloc>()
                  ..add(const RestaurantEvent.fetchSliderList())
                  ..add(const RestaurantEvent.fetchRestaurantList())
                  ..add(const RestaurantEvent.fetchCategoryList());
                AutoRouter.of(context).popUntilRoot();
                AutoRouter.of(context).replace(const BaseRoute());
              },
            );
          },
        );
      },
      builder: (context, state) {
        return AppScaffold(
          resizeToAvoidBottomInset: false,
          appBar: const CustomAppBar(title: "Sign in"),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const Spacer(),
                  const AppLogo(size: 100),
                  const Text(
                    "Food delivery app",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 50),
                  Form(
                    key: _key,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        TextFormField(
                          controller: _emailTEC,
                          keyboardType: TextInputType.emailAddress,
                          textAlign: TextAlign.center,
                          // style: const TextStyle(color: AppColors.black),
                          onTap: () {
                            HapticFeedback.selectionClick();
                          },
                          decoration: InputDecoration(
                            isDense: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            labelText: "Mobile number",
                            labelStyle: const TextStyle(color: Colors.grey),
                          ),
                          enableSuggestions: false,
                          validator: Validators.phone,
                          autocorrect: false,
                        ),
                        const SizedBox(height: 15),
                        TextFormField(
                          controller: _passwordTEC,
                          obscureText: true,
                          keyboardType: TextInputType.visiblePassword,
                          textAlign: TextAlign.center,
                          //  style: const TextStyle(color: AppColors.black),
                          onTap: () {
                            HapticFeedback.selectionClick();
                          },
                          decoration: InputDecoration(
                            isDense: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            labelText: "Password",
                            labelStyle: const TextStyle(color: Colors.grey),
                          ),
                          enableSuggestions: false,
                          validator: Validators.password,
                          autocorrect: false,
                        ),
                        const SizedBox(
                          height: 40.0,
                        ),
                        RoundedFilledButton(
                          onTap: () {
                            if (_key.currentState!.validate()) {
                              context.read<AuthBloc>().add(
                                    AuthEvent.signInWithEmailAndPassword(
                                      mobileNumber: _emailTEC.text,
                                      password: _passwordTEC.text,
                                    ),
                                  );
                              showProgress(context);
                            }
                          },
                          text: "Login",
                        ),
                        const SizedBox(height: 15),
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: "Forgot password?",
                            style: GoogleFonts.poppins(
                                color: Theme.of(context)
                                    .primaryTextTheme
                                    .headline1!
                                    .color),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                HapticFeedback.selectionClick();
                                AutoRouter.of(context)
                                    .replace(ForgotPasswordRoute());
                              },
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(flex: 3),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
