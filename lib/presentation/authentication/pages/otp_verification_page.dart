import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/application/auth/auth_bloc.dart';
import 'package:flutter_template/application/restaurant/restaurant_bloc.dart';
import 'package:flutter_template/presentation/core/styles/app_colors.dart';
import 'package:flutter_template/presentation/core/widgets/buttons/rounded_filled_button.dart';
import 'package:flutter_template/presentation/core/widgets/layout/app_scaffold.dart';
import 'package:flutter_template/presentation/core/widgets/layout/circular_progress.dart';
import 'package:flutter_template/presentation/core/widgets/layout/logo_widget.dart';
import 'package:flutter_template/presentation/core/widgets/layout/sized_boxes.dart';
import 'package:flutter_template/presentation/routes/router.gr.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';
import 'package:restart_app/restart_app.dart';

class OtpVerificationPage extends StatefulWidget {
  final String phoneNumber;

  const OtpVerificationPage({
    Key? key,
    required this.phoneNumber,
  }) : super(key: key);

  @override
  _OtpVerificationPageState createState() => _OtpVerificationPageState();
}

class _OtpVerificationPageState extends State<OtpVerificationPage> {
  final TextEditingController otpController = TextEditingController();
  late String number = "";
  late Timer _timer;
  int _start = 60;
  bool isTextButtonEnable = false;
  final _key = GlobalKey<FormState>();

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
            isTextButtonEnable = true;
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _timer.cancel();
    // SmsAutoFill().unregisterListener();
    // AltSmsAutofill().unregisterListener();
    super.dispose();
  }

  @override
  void initState() {
    startTimer();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
        listeners: [
          BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              state.otpVerifyFailureOrSuccessOption.fold(
                () => {},
                (some) => some.fold(
                  (failure) {
                    Fluttertoast.showToast(
                      msg: failure.maybeMap(
                        serverError: (e) => e.error,
                        orElse: () => 'An unexpected error occurred.',
                      ),
                    );
                    Navigator.pop(context);
                  },
                  (success) async {
                    Fluttertoast.showToast(
                      msg:
                          "Registered successfully. Kindly log in to continue.",
                      gravity: ToastGravity.CENTER,
                    );
                    await Future.delayed(Duration(milliseconds: 1000));
                    Restart.restartApp();
                    // context.read<RestaurantBloc>()
                    //   ..add(const RestaurantEvent.fetchSliderList())
                    //   ..add(const RestaurantEvent.fetchRestaurantList())
                    //   ..add(const RestaurantEvent.fetchCategoryList());
                  },
                ),
              );
            },
          ),
        ],
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            return AppScaffold(
              resizeToAvoidBottomInset: false,
              body: Form(
                key: _key,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBoxH10(),
                    const Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 38,
                      ),
                      child: const AppLogo(size: 100),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical:
                              MediaQuery.of(context).size.width < 360 ? 20 : 40,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Text(
                                "Enter One Time Password",
                                style: GoogleFonts.arimo(
                                  fontSize:
                                      MediaQuery.of(context).size.width < 360
                                          ? 18
                                          : 20,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ),

                            MediaQuery.of(context).size.width < 360
                                ? const SizedBoxH20()
                                : const SizedBoxH30(),
                            Center(
                              child: Text(
                                "The One Time Password have been sent to ${widget.phoneNumber}",
                                style: GoogleFonts.arimo(
                                  fontSize:
                                      MediaQuery.of(context).size.width < 360
                                          ? 14
                                          : 15,
                                  // fontWeight: FontWeight.w900,
                                ),
                              ),
                            ),
                            // Text(
                            //   "Enter 6 digits OTP",
                            //   style: TextStyle(
                            //     fontSize: 20,
                            //     fontWeight: FontWeight.w600,
                            //     color: Colors.grey[600],
                            //   ),
                            // ),
                            MediaQuery.of(context).size.width < 360
                                ? const SizedBoxH5()
                                : const SizedBoxH20(),
                            Center(
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width / 1.2,
                                child: PinInputTextField(
                                  pinLength: 5,
                                  decoration: UnderlineDecoration(
                                    lineHeight: 2.5,
                                    colorBuilder: PinListenColorBuilder(
                                      AppColors.primary,
                                      AppColors.grey,
                                    ),
                                    // bgColorBuilder: _solidEnable ? _solidColor : null,
                                  ),
                                  controller: otpController,
                                  // textInputAction: TextInputAction.go,
                                  enabled: true,
                                  keyboardType: TextInputType.phone,
                                  textCapitalization:
                                      TextCapitalization.characters,
                                  onSubmit: (pin) {
                                    debugPrint('submit pin:$pin');
                                  },
                                  onChanged: (pin) {
                                    print(otpController.text);
                                    debugPrint('onChanged execute. pin:$pin');
                                  },
                                  enableInteractiveSelection: false,
                                  cursor: Cursor(
                                    width: 2,
                                    color: Colors.lightBlue,
                                    radius: const Radius.circular(1),
                                    enabled: true,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBoxH20(),
                            Center(
                              child: TextButton(
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  // minimumSize: Size(50, 30),
                                  alignment: Alignment.centerLeft,
                                ),
                                onPressed: isTextButtonEnable
                                    ? () {
                                        setState(() {
                                          _start = 60;
                                          isTextButtonEnable = false;
                                        });
                                        context.read<AuthBloc>().add(
                                              AuthEvent.sendOtp(
                                                  mobileNumber:
                                                      widget.phoneNumber),
                                            );
                                        startTimer();
                                      }
                                    : null,
                                child: Text(
                                  isTextButtonEnable
                                      ? 'Re-Send OTP'
                                      : 'Resend OTP in $_start second(s)',
                                  style: TextStyle(
                                      color: AppColors.primary,
                                      fontSize:
                                          MediaQuery.of(context).size.width <
                                                  360
                                              ? 18
                                              : null),
                                ),
                              ),
                            ),
                            MediaQuery.of(context).size.width < 360
                                ? const SizedBox(
                                    height: 90,
                                  )
                                : const Spacer(),

                            const SizedBox(
                              height: 50,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerFloat,
              floatingActionButton: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
                child: RoundedFilledButton(
                  onTap: () async {
                    if (await InternetConnectionChecker().hasConnection) {
                      if (otpController.text.length == 5) {
                        context.read<AuthBloc>().add(
                              AuthEvent.verifyOtp(
                                  mobileNumber: widget.phoneNumber,
                                  otp: otpController.text),
                            );
                        showProgress(context);
                      } else {
                        Fluttertoast.showToast(
                          msg: "enter 6 digit otp",
                        );
                      }
                    } else {
                      Fluttertoast.showToast(
                        msg: "unable to verify otp no internet found",
                      );
                    }
                  },
                  text: "Continue",
                ),
              ),
            );
          },
        ));
  }
}
