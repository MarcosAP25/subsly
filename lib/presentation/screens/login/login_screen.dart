import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sizer/sizer.dart';
import 'package:subsly/config/const/screen_gaps.dart';
import 'package:subsly/infracstructure/providers/auth/auth_repository_provider.dart';
import 'package:subsly/presentation/widgets.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = 'login';
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: _LoginBody()
        )
    );
  }
}

class _LoginBody extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final _formKey = GlobalKey<FormState>();

    final colors = Theme.of(context).colorScheme;
    final emailTextController = useTextEditingController();
    final passwordTextController = useTextEditingController();

    double getScreenSize() {
      final widthScreen = MediaQuery.of(context).size.width;
      return widthScreen;
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        return Center(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: getScreenSize() < 700 ? 8.w : 25.w,
            ),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppLogo(),
                    gap10,
                    Row(
                      spacing: 8,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Aun no tienes cuenta?',
                          style: TextStyle(fontSize: 15.sp),
                        ),
                        Text(
                          'Registrate',
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                            color: colors.primary,
                          ),
                        ),
                      ],
                    ),
                    gap24,
                    //TextField for email
                    CustomTextField(
                      controller: emailTextController,
                      hintText: 'Correo Electrónico',
                      keyboardType: TextInputType.emailAddress,
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        FormBuilderValidators.email(),
                      ]),
                    ),
                    gap16,
                    //TextField for password
                    CustomTextField(
                      controller: passwordTextController,
                      hintText: 'Contraseña',
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        FormBuilderValidators.minLength(6),
                      ]),
                    ),
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
                          onTap: () {
                            //Handle login action
                            if (_formKey.currentState!.validate()) {
                              ref.read(authRepositoryProvider).signInWithEmailAndPassword(emailTextController.text, passwordTextController.text);
                            }
                          },
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
                        Expanded(
                          child: CustomLargeButton(
                            text: 'Iniciar con Google',
                            icon: SvgPicture.asset(
                              'assets/images/resources/google.svg',
                              width: 7.w,
                            ),
                            alignment: MainAxisAlignment.start,
                            foreGroundColor: colors.onSurface,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: colors.surface,
                              border: Border.all(
                                color: colors.onSurface.withAlpha(150),
                                width: 1,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
