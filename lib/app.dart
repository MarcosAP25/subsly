import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:sizer/sizer.dart';
import 'package:subsly/config/router/app_router.dart';
import 'package:subsly/config/theme/app_theme.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp.router(
          routerConfig: appRouter,
          
          title: 'Subsly',
          theme: AppTheme(isDarkMode: false).getTheme(),
          debugShowCheckedModeBanner: false,
          builder: EasyLoading.init(),
        );
      },
    );
  }
}
