import 'package:auto_route/annotations.dart';
import 'package:flutter_template/presentation/authentication/pages/forgot_password_page.dart';
import 'package:flutter_template/presentation/authentication/pages/otp_verification_page.dart';
import 'package:flutter_template/presentation/authentication/pages/signin_page.dart';
import 'package:flutter_template/presentation/authentication/pages/signup_page.dart';
import 'package:flutter_template/presentation/base/base_page.dart';
import 'package:flutter_template/presentation/core/pages/landing_page.dart';
import 'package:flutter_template/presentation/core/pages/onboarding_page.dart';
import 'package:flutter_template/presentation/core/pages/splash_page.dart';
import 'package:flutter_template/presentation/restaurant/restaurant_detail_page.dart';
import 'package:flutter_template/presentation/restaurant/restaurant_list_page.dart';
import 'package:flutter_template/presentation/restaurant/search_result_page.dart';
import 'package:flutter_template/presentation/user/profile_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: "Page,Route",
  routes: <AutoRoute>[
    ///[Core]
    AutoRoute(page: SplashPage, initial: true),
    AutoRoute(page: OnboardingPage),
    AutoRoute(page: LandingPage),
    AutoRoute(page: OtpVerificationPage),

    ///[Authentication]
    AutoRoute(page: SigninPage),
    AutoRoute(page: SignupPage),
    AutoRoute(page: ForgotPasswordPage),

    ///[Base]
    AutoRoute(page: BasePage),

    ///[Restuaurant]
    AutoRoute(page: SearchResultPage),
    AutoRoute(page: RestaurantListPage),
    AutoRoute(page: RestaurantDetailPage),

    ///[profile]
    AutoRoute(page: ProfilePage),
  ],
)
class $AppRouter {}
