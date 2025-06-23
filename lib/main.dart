import 'package:bartech_app/config/router.dart';
import 'package:bartech_app/config/theme.dart';
import 'package:bartech_app/data/repository/product_categories_repository.dart';
import 'package:bartech_app/data/repository/product_groups_repository.dart';
import 'package:bartech_app/data/repository/products_repository.dart';
import 'package:bartech_app/data/services/product_categories_service.dart';
import 'package:bartech_app/data/services/product_groups_service.dart';
import 'package:bartech_app/data/services/products_service.dart';
import 'package:bartech_app/presentation/bloc/Inactivity_bloc/inactivity_bloc.dart';
import 'package:bartech_app/presentation/bloc/cart_bloc/cart_bloc.dart';
import 'package:bartech_app/presentation/bloc/details_bloc/details_bloc.dart';
import 'package:bartech_app/presentation/bloc/details_bloc/details_event.dart';
import 'package:bartech_app/presentation/bloc/payment_bloc/payment_bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider<Dio>(
          create: (_) => Dio(
            BaseOptions(
              baseUrl: 'http://192.168.20.253:5023/',
              connectTimeout: const Duration(seconds: 10),
              receiveTimeout: const Duration(seconds: 10),
            ),
          ),
        ),
        Provider<ProductsService>(
          create: (context) => ProductsService(context.read<Dio>()),
        ),
        Provider<ProductCategoriesService>(
          create: (context) => ProductCategoriesService(context.read<Dio>()),
        ),
        Provider<ProductGroupsService>(
          create: (context) => ProductGroupsService(context.read<Dio>()),
        ),
        Provider<ProductsRepository>(
          create: (context) =>
              ProductsRepository(context.read<ProductsService>()),
        ),
        Provider<ProductCategoriesRepository>(
          create: (context) => ProductCategoriesRepository(
            context.read<ProductCategoriesService>(),
          ),
        ),
        Provider<ProductGroupsRepository>(
          create: (context) =>
              ProductGroupsRepository(context.read<ProductGroupsService>()),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => DetailsBloc(
              categoryRepository: context.read<ProductCategoriesRepository>(),
              productsRepository: context.read<ProductsRepository>(),
            )..add(LoadCategoriesEvent()),
          ),
          BlocProvider(create: (_) => CartBloc()),
          BlocProvider(create: (_) => PaymentBloc()),
          BlocProvider(
            create: (_) => InactivityBloc()..add(StartInactivityTimer(60)),
          ),
        ],
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: fastFoodTheme,
    );
  }
}
