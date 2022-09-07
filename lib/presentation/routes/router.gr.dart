// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i8;
import 'package:flutter/material.dart' as _i9;

import '../authentication/pages/forgot_password_page.dart' as _i6;
import '../authentication/pages/signin_page.dart' as _i4;
import '../authentication/pages/signup_page.dart' as _i5;
import '../base/base_page.dart' as _i7;
import '../core/pages/landing_page.dart' as _i3;
import '../core/pages/onboarding_page.dart' as _i2;
import '../core/pages/splash_page.dart' as _i1;

class AppRouter extends _i8.RootStackRouter {
  AppRouter([_i9.GlobalKey<_i9.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i8.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: _i1.SplashPage());
    },
    OnboardingRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.OnboardingPage());
    },
    LandingRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.LandingPage());
    },
    SigninRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.SigninPage());
    },
    SignupRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.SignupPage());
    },
    ForgotPasswordRoute.name: (routeData) {
      final args = routeData.argsAs<ForgotPasswordRouteArgs>(
          orElse: () => const ForgotPasswordRouteArgs());
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: _i6.ForgotPasswordPage(key: args.key));
    },
    BaseRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: _i7.BasePage());
    }
  };

  @override
  List<_i8.RouteConfig> get routes => [
        _i8.RouteConfig(SplashRoute.name, path: '/'),
        _i8.RouteConfig(OnboardingRoute.name, path: '/onboarding-page'),
        _i8.RouteConfig(LandingRoute.name, path: '/landing-page'),
        _i8.RouteConfig(SigninRoute.name, path: '/signin-page'),
        _i8.RouteConfig(SignupRoute.name, path: '/signup-page'),
        _i8.RouteConfig(ForgotPasswordRoute.name,
            path: '/forgot-password-page'),
        _i8.RouteConfig(BaseRoute.name, path: '/base-page')
      ];
}

/// generated route for
/// [_i1.SplashPage]
class SplashRoute extends _i8.PageRouteInfo<void> {
  const SplashRoute() : super(SplashRoute.name, path: '/');

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i2.OnboardingPage]
class OnboardingRoute extends _i8.PageRouteInfo<void> {
  const OnboardingRoute()
      : super(OnboardingRoute.name, path: '/onboarding-page');

  static const String name = 'OnboardingRoute';
}

/// generated route for
/// [_i3.LandingPage]
class LandingRoute extends _i8.PageRouteInfo<void> {
  const LandingRoute() : super(LandingRoute.name, path: '/landing-page');

  static const String name = 'LandingRoute';
}

/// generated route for
/// [_i4.SigninPage]
class SigninRoute extends _i8.PageRouteInfo<void> {
  const SigninRoute() : super(SigninRoute.name, path: '/signin-page');

  static const String name = 'SigninRoute';
}

/// generated route for
/// [_i5.SignupPage]
class SignupRoute extends _i8.PageRouteInfo<void> {
  const SignupRoute() : super(SignupRoute.name, path: '/signup-page');

  static const String name = 'SignupRoute';
}

/// generated route for
/// [_i6.ForgotPasswordPage]
class ForgotPasswordRoute extends _i8.PageRouteInfo<ForgotPasswordRouteArgs> {
  ForgotPasswordRoute({_i9.Key? key})
      : super(ForgotPasswordRoute.name,
            path: '/forgot-password-page',
            args: ForgotPasswordRouteArgs(key: key));

  static const String name = 'ForgotPasswordRoute';
}

class ForgotPasswordRouteArgs {
  const ForgotPasswordRouteArgs({this.key});

  final _i9.Key? key;

  @override
  String toString() {
    return 'ForgotPasswordRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i7.BasePage]
class BaseRoute extends _i8.PageRouteInfo<void> {
  const BaseRoute() : super(BaseRoute.name, path: '/base-page');

  static const String name = 'BaseRoute';
}
