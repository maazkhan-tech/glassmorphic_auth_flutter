import 'package:glassmorphic_auth_flutter/modules/splash_module/views/splash_view.dart';
import 'package:go_router/go_router.dart';
import '../modules/auth_module/views/login_view.dart';
import '../modules/auth_module/views/signup_view.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/splash',
  routes: [
    GoRoute(path: '/splash', builder: (context, state) => const SplashView()),
    GoRoute(path: '/login',name: 'login', builder: (context, state) => const LoginView()),
    GoRoute(path: '/signup', builder: (context, state) => const SignUpView()),
  ],
);
