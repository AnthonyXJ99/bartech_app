import 'package:bartech_app/presentation/screens/home/home_screen.dart';
import 'package:bartech_app/presentation/screens/welcome/welcome_screen.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: "/",
  routes: [
    GoRoute(path: "/", redirect: (context, state) => "/welcome"),
    GoRoute(path: "/welcome", builder: (context, state) => WelcomeScreen()),

    GoRoute(
      path: "/home",
      builder: (context, state) => const HomeScreen(),
      routes: [

      ]
    ),
  ],
);
