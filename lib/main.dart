import 'package:bartech_app/config/router.dart';
import 'package:bartech_app/config/theme.dart';
import 'package:bartech_app/presentation/bloc/cart_bloc/cart_bloc.dart';
import 'package:bartech_app/presentation/bloc/details_bloc/details_bloc.dart';
import 'package:bartech_app/presentation/bloc/payment_bloc/payment_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => DetailsBloc()),
        BlocProvider(create: (_) => CartBloc()),
        BlocProvider(create: (_) => PaymentBloc()),
        // Otros blocs globales si necesitas
      ],
      child: MaterialApp.router(
        routerConfig: appRouter,
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: fastFoodTheme,
      ),
    );
  }
}
