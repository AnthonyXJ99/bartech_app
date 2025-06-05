import 'package:bartech_app/data/groups_data.dart';
import 'package:bartech_app/presentation/screens/cart/cart_screen.dart';
import 'package:bartech_app/presentation/screens/details/details_screen.dart';
import 'package:bartech_app/presentation/screens/home/home_screen.dart';
import 'package:bartech_app/presentation/screens/inactivity_wrapper_screen.dart';
import 'package:bartech_app/presentation/screens/payment/payment_screen.dart';
import 'package:bartech_app/presentation/screens/welcome/welcome_screen.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: "/",
  routes: [
    GoRoute(path: "/", redirect: (context, state) => "/welcome"),

    GoRoute(path: "/welcome", builder: (context, state) => WelcomeScreen()),

    GoRoute(
      path: "/home",
      builder: (context, state) =>
          InactivityDetector(child: const HomeScreen()),
    ),
    GoRoute(
      path: "/products",
      builder: (context, state) =>
          InactivityDetector(child: DetailsView(images: carruselImages)),
      routes: [
        GoRoute(
          path: "/cart",
          builder: (context, state) => InactivityDetector(child: CartScreen()),
          routes: [
            GoRoute(
              path: "/payment/:ticketNumber",
              builder: (context, state) => InactivityDetector(
                child: PaymentScreen(
                  ticketNumber: state.pathParameters['ticketNumber'] ?? '0',
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  ],
);
