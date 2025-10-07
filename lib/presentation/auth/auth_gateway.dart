import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:subsly/infracstructure/providers/auth/auth_state_provider.dart';
import 'package:subsly/presentation/screens.dart';

class AuthGateway extends HookConsumerWidget {
  static const String routeName = 'auth';
  const AuthGateway({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final authStateP = ref.watch(authStateProvider);

    return authStateP.when(
      data: (data) {
        EasyLoading.dismiss();
        if(data == null){
          return LoginScreen();
         
        } else {
          return HomeScreen();
        }
      }, 
      loading: () {
        EasyLoading.show(status: 'Loading...');
        return const Center(child: CircularProgressIndicator());
      },
      error: (error, stackTrace) {
        EasyLoading.dismiss();
        return const Center(child: Text('Something went wrong!'));
      }, 
    );
  }
}