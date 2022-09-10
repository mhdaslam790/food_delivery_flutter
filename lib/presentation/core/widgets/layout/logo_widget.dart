import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppLogo extends StatelessWidget {
  final double? size;
  const AppLogo({this.size});
  @override
  Widget build(BuildContext context) {
    return AppLogoFull(
      width: size,
      height: size,
    );
  }
}

class AppLogoFull extends StatelessWidget {
  final double? width;
  final double? height;
  const AppLogoFull({required this.width, required this.height});
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/icons/logo.svg',
      height: height,
      width: width,
    );
  }
}
