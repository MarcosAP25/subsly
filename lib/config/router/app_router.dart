import 'package:go_router/go_router.dart';

import '../../presentation/screens.dart';

final appRouter = GoRouter(
  initialLocation: '/${LoginScreen.routeName}',
  routes: [
    GoRoute(
      path: '/${LoginScreen.routeName}',
      name: LoginScreen.routeName,
      builder: (context, state) => const LoginScreen(),
    )
  ]
);