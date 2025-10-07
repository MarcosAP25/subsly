import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/images/resources/light_logo.svg',
      width: 25.w,
      height: 25.w,
    );
  }
}