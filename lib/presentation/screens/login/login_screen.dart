import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import 'package:subsly/config/const/screen_gaps.dart';
import 'package:subsly/presentation/widgets.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = 'login';
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: _LoginBody()));
  }
}

class _LoginBody extends HookWidget {
  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;
    
    double getScreenSize(){
      final widthScreen = MediaQuery.of(context).size.width;
     return widthScreen;
    }
    
    return LayoutBuilder(
      builder: (context, constraints) {
        return Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: getScreenSize() < 700 ? 8.w :  25.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppLogo(),
                gap10,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Aun no tienes cuenta?',
                      style: TextStyle(fontSize: 15.sp),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, 'register');
                      },
                      child: Text('Registrate'),
                    ),
                  ],
                ),
                gap24,
                //TextField for email
                CustomTextField(),
                gap16,
                //TextField for password
                CustomTextField(),
                gap8,
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [Text('Olvidaste tu contraseña?')],
                ),
                gap24,
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(child: CustomLargeButton(
                      text: 'Iniciar Sesión',
                    )),
                  ],
                ),

                Padding(
                  padding: EdgeInsetsGeometry.symmetric(vertical: 3.h),
                  child: Divider(),
                ),

                 Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(child: CustomLargeButton(
                      text: 'Iniciar con Google',
                      icon: SvgPicture.asset('assets/images/resources/google.svg', width: 7.w,),
                      alignment: MainAxisAlignment.start,
                      foreGroundColor: colors.onSurface,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: colors.surface,
                        border: Border.all(color: colors.onSurface.withAlpha(150), width: 1),
                      ),
                    )),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
