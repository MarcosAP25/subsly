import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:subsly/config/router/app_router.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp.router(
          routerConfig: appRouter,
          title: 'Subsly',
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
