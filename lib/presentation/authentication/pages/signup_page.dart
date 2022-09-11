import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/application/auth/auth_bloc.dart';
import 'package:flutter_template/domain/core/validators.dart';
import 'package:flutter_template/presentation/core/styles/app_colors.dart';
import 'package:flutter_template/presentation/core/widgets/buttons/rounded_filled_button.dart';
import 'package:flutter_template/presentation/core/widgets/custom/custom_app_bar.dart';
import 'package:flutter_template/presentation/core/widgets/layout/app_scaffold.dart';
import 'package:flutter_template/presentation/core/widgets/layout/circular_progress.dart';
import 'package:flutter_template/presentation/core/widgets/layout/logo_widget.dart';
import 'package:flutter_template/presentation/routes/router.gr.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);
  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController _emailTEC = TextEditingController();
  final TextEditingController _passwordTEC = TextEditingController();
  final TextEditingController _nameTEC = TextEditingController();
  final TextEditingController _mobileNumberTEC = TextEditingController();
  final _key = GlobalKey<FormState>();
  // bool isChecked = false;

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
                    serverError: (e) => e.error,
                    orElse: () => "An unexpected error occurred",
                  ),
                  gravity: ToastGravity.CENTER,
                );
                AutoRouter.of(context).pop();
              },
              (success) {
                context.read<AuthBloc>().add(
                      AuthEvent.sendOtp(mobileNumber: _mobileNumberTEC.text),
                    );
                AutoRouter.of(context).pop();
                AutoRouter.of(context).push(
                  OtpVerificationRoute(
                    phoneNumber: _mobileNumberTEC.text,
                  ),
                );
              },
            );
          },
        );
      },
      builder: (context, state) {
        return AppScaffold(
          resizeToAvoidBottomInset: false,
          appBar: const CustomAppBar(title: "Sign up"),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const Spacer(),
                const AppLogo(size: 100),
                const Text(
                  "Food delivery app",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 30),
                Form(
                  key: _key,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      TextFormField(
                        controller: _nameTEC,
                        // style: const TextStyle(color: Colors.white),
                        onTap: () {
                          HapticFeedback.selectionClick();
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          isDense: true,
                          labelText: "Full name",
                          labelStyle: const TextStyle(color: Colors.grey),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        textAlign: TextAlign.center,
                        enableSuggestions: false,
                        validator: Validators.name,
                        autocorrect: false,
                      ),
                      const SizedBox(height: 15),
                      TextFormField(
                        controller: _mobileNumberTEC,
                        // style: const TextStyle(color: Colors.white),
                        onTap: () {
                          HapticFeedback.selectionClick();
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          isDense: true,
                          labelText: "Mobile number",
                          labelStyle: const TextStyle(color: Colors.grey),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        textAlign: TextAlign.center,
                        enableSuggestions: false,
                        validator: Validators.phone,
                        autocorrect: false,
                      ),
                      const SizedBox(height: 15),
                      TextFormField(
                        controller: _emailTEC,
                        // style: const TextStyle(color: Colors.white),
                        onTap: () {
                          HapticFeedback.selectionClick();
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          isDense: true,
                          labelText: "Email Address",
                          labelStyle: const TextStyle(color: Colors.grey),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        textAlign: TextAlign.center,
                        enableSuggestions: false,
                        validator: Validators.email,
                        autocorrect: false,
                      ),
                      const SizedBox(height: 15),
                      TextFormField(
                        controller: _passwordTEC,
                        // style: const TextStyle(color: Colors.grey),
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
                        obscureText: true,
                        keyboardType: TextInputType.visiblePassword,
                        textAlign: TextAlign.center,
                        enableSuggestions: false,
                        validator: Validators.password,
                      ),
                      const SizedBox(height: 20.0),
                      RoundedFilledButton(
                        onTap: () {
                          if (_key.currentState!.validate()) {
                            context.read<AuthBloc>().add(
                                  AuthEvent.registerWithEmailAndPassword(
                                    mobileNumber: _mobileNumberTEC.text,
                                    name: _nameTEC.text,
                                    email: _emailTEC.text,
                                    password: _passwordTEC.text,
                                  ),
                                );
                           showProgress(context);
                            // } else {
                            //   Fluttertoast.showToast(
                            //     msg: "Please check the box to continue",
                            //   );
                            // }
                          }
                        },
                        text: "Register",
                      ),
                    ],
                  ),
                ),
                const Spacer(flex: 10),
              ],
            ),
          ),
        );
      },
    );
  }
}
