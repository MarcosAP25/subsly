import 'package:go_router/go_router.dart';
import 'package:subsly/presentation/auth/auth_gateway.dart';

import '../../presentation/screens.dart';

final appRouter = GoRouter(
  initialLocation: '/${AuthGateway.routeName}',
  routes: [
    GoRoute(
      path: '/${AuthGateway.routeName}',
      name: AuthGateway.routeName,
      builder: (context, state) => const AuthGateway(),
    ),
    GoRoute(
      path: '/${LoginScreen.routeName}',
      name: LoginScreen.routeName,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/${HomeScreen.routeName}',
      name: HomeScreen.routeName,
      builder: (context, state) => const HomeScreen(),
    )
  ]
);