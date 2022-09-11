// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i13;
import 'package:flutter/material.dart' as _i14;

import '../../domain/restaurant/restuarnt_detail_model.dart' as _i15;
import '../authentication/pages/forgot_password_page.dart' as _i7;
import '../authentication/pages/otp_verification_page.dart' as _i4;
import '../authentication/pages/signin_page.dart' as _i5;
import '../authentication/pages/signup_page.dart' as _i6;
import '../base/base_page.dart' as _i8;
import '../core/pages/landing_page.dart' as _i3;
import '../core/pages/onboarding_page.dart' as _i2;
import '../core/pages/splash_page.dart' as _i1;
import '../restaurant/restaurant_detail_page.dart' as _i11;
import '../restaurant/restaurant_list_page.dart' as _i10;
import '../restaurant/search_result_page.dart' as _i9;
import '../user/profile_page.dart' as _i12;

class AppRouter extends _i13.RootStackRouter {
  AppRouter([_i14.GlobalKey<_i14.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i13.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: _i1.SplashPage());
    },
    OnboardingRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.OnboardingPage());
    },
    LandingRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.LandingPage());
    },
    OtpVerificationRoute.name: (routeData) {
      final args = routeData.argsAs<OtpVerificationRouteArgs>();
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i4.OtpVerificationPage(
              key: args.key, phoneNumber: args.phoneNumber));
    },
    SigninRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.SigninPage());
    },
    SignupRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.SignupPage());
    },
    ForgotPasswordRoute.name: (routeData) {
      final args = routeData.argsAs<ForgotPasswordRouteArgs>(
          orElse: () => const ForgotPasswordRouteArgs());
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: _i7.ForgotPasswordPage(key: args.key));
    },
    BaseRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: _i8.BasePage());
    },
    SearchResultRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i9.SearchResultPage());
    },
    RestaurantListRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i10.RestaurantListPage());
    },
    RestaurantDetailRoute.name: (routeData) {
      final args = routeData.argsAs<RestaurantDetailRouteArgs>();
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i11.RestaurantDetailPage(
              key: args.key, restaurantDetail: args.restaurantDetail));
    },
    ProfileRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: _i12.ProfilePage());
    }
  };

  @override
  List<_i13.RouteConfig> get routes => [
        _i13.RouteConfig(SplashRoute.name, path: '/'),
        _i13.RouteConfig(OnboardingRoute.name, path: '/onboarding-page'),
        _i13.RouteConfig(LandingRoute.name, path: '/landing-page'),
        _i13.RouteConfig(OtpVerificationRoute.name,
            path: '/otp-verification-page'),
        _i13.RouteConfig(SigninRoute.name, path: '/signin-page'),
        _i13.RouteConfig(SignupRoute.name, path: '/signup-page'),
        _i13.RouteConfig(ForgotPasswordRoute.name,
            path: '/forgot-password-page'),
        _i13.RouteConfig(BaseRoute.name, path: '/base-page'),
        _i13.RouteConfig(SearchResultRoute.name, path: '/search-result-page'),
        _i13.RouteConfig(RestaurantListRoute.name,
            path: '/restaurant-list-page'),
        _i13.RouteConfig(RestaurantDetailRoute.name,
            path: '/restaurant-detail-page'),
        _i13.RouteConfig(ProfileRoute.name, path: '/profile-page')
      ];
}

/// generated route for
/// [_i1.SplashPage]
class SplashRoute extends _i13.PageRouteInfo<void> {
  const SplashRoute() : super(SplashRoute.name, path: '/');

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i2.OnboardingPage]
class OnboardingRoute extends _i13.PageRouteInfo<void> {
  const OnboardingRoute()
      : super(OnboardingRoute.name, path: '/onboarding-page');

  static const String name = 'OnboardingRoute';
}

/// generated route for
/// [_i3.LandingPage]
class LandingRoute extends _i13.PageRouteInfo<void> {
  const LandingRoute() : super(LandingRoute.name, path: '/landing-page');

  static const String name = 'LandingRoute';
}

/// generated route for
/// [_i4.OtpVerificationPage]
class OtpVerificationRoute
    extends _i13.PageRouteInfo<OtpVerificationRouteArgs> {
  OtpVerificationRoute({_i14.Key? key, required String phoneNumber})
      : super(OtpVerificationRoute.name,
            path: '/otp-verification-page',
            args: OtpVerificationRouteArgs(key: key, phoneNumber: phoneNumber));

  static const String name = 'OtpVerificationRoute';
}

class OtpVerificationRouteArgs {
  const OtpVerificationRouteArgs({this.key, required this.phoneNumber});

  final _i14.Key? key;

  final String phoneNumber;

  @override
  String toString() {
    return 'OtpVerificationRouteArgs{key: $key, phoneNumber: $phoneNumber}';
  }
}

/// generated route for
/// [_i5.SigninPage]
class SigninRoute extends _i13.PageRouteInfo<void> {
  const SigninRoute() : super(SigninRoute.name, path: '/signin-page');

  static const String name = 'SigninRoute';
}

/// generated route for
/// [_i6.SignupPage]
class SignupRoute extends _i13.PageRouteInfo<void> {
  const SignupRoute() : super(SignupRoute.name, path: '/signup-page');

  static const String name = 'SignupRoute';
}

/// generated route for
/// [_i7.ForgotPasswordPage]
class ForgotPasswordRoute extends _i13.PageRouteInfo<ForgotPasswordRouteArgs> {
  ForgotPasswordRoute({_i14.Key? key})
      : super(ForgotPasswordRoute.name,
            path: '/forgot-password-page',
            args: ForgotPasswordRouteArgs(key: key));

  static const String name = 'ForgotPasswordRoute';
}

class ForgotPasswordRouteArgs {
  const ForgotPasswordRouteArgs({this.key});

  final _i14.Key? key;

  @override
  String toString() {
    return 'ForgotPasswordRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i8.BasePage]
class BaseRoute extends _i13.PageRouteInfo<void> {
  const BaseRoute() : super(BaseRoute.name, path: '/base-page');

  static const String name = 'BaseRoute';
}

/// generated route for
/// [_i9.SearchResultPage]
class SearchResultRoute extends _i13.PageRouteInfo<void> {
  const SearchResultRoute()
      : super(SearchResultRoute.name, path: '/search-result-page');

  static const String name = 'SearchResultRoute';
}

/// generated route for
/// [_i10.RestaurantListPage]
class RestaurantListRoute extends _i13.PageRouteInfo<void> {
  const RestaurantListRoute()
      : super(RestaurantListRoute.name, path: '/restaurant-list-page');

  static const String name = 'RestaurantListRoute';
}

/// generated route for
/// [_i11.RestaurantDetailPage]
class RestaurantDetailRoute
    extends _i13.PageRouteInfo<RestaurantDetailRouteArgs> {
  RestaurantDetailRoute(
      {_i14.Key? key, required _i15.RestaurantDetailModel restaurantDetail})
      : super(RestaurantDetailRoute.name,
            path: '/restaurant-detail-page',
            args: RestaurantDetailRouteArgs(
                key: key, restaurantDetail: restaurantDetail));

  static const String name = 'RestaurantDetailRoute';
}

class RestaurantDetailRouteArgs {
  const RestaurantDetailRouteArgs({this.key, required this.restaurantDetail});

  final _i14.Key? key;

  final _i15.RestaurantDetailModel restaurantDetail;

  @override
  String toString() {
    return 'RestaurantDetailRouteArgs{key: $key, restaurantDetail: $restaurantDetail}';
  }
}

/// generated route for
/// [_i12.ProfilePage]
class ProfileRoute extends _i13.PageRouteInfo<void> {
  const ProfileRoute() : super(ProfileRoute.name, path: '/profile-page');

  static const String name = 'ProfileRoute';
}
