import 'package:bartech_app/config/router.dart';
import 'package:bartech_app/config/theme.dart';
import 'package:bartech_app/data/repository/image_repository.dart';
import 'package:bartech_app/data/repository/local/product_category_drift_repository.dart';
import 'package:bartech_app/data/repository/product_categories_repository.dart';
import 'package:bartech_app/data/repository/product_groups_repository.dart';
import 'package:bartech_app/data/repository/products_drift_repository.dart';
import 'package:bartech_app/data/repository/products_repository.dart';
// 🚀 NUEVO: Order imports
import 'package:bartech_app/data/repository/order_repository.dart';
import 'package:bartech_app/data/services/image_service.dart';
import 'package:bartech_app/data/services/product_categories_service.dart';
import 'package:bartech_app/data/services/product_groups_service.dart';
import 'package:bartech_app/data/services/products_service.dart';
// 🚀 NUEVO: Order service import
import 'package:bartech_app/data/services/order_service.dart';
import 'package:bartech_app/presentation/bloc/Inactivity_bloc/inactivity_bloc.dart';
import 'package:bartech_app/presentation/bloc/cart_bloc/cart_bloc.dart';
import 'package:bartech_app/presentation/bloc/details_bloc/details_bloc.dart';
import 'package:bartech_app/presentation/bloc/details_bloc/details_event.dart';
import 'package:bartech_app/presentation/bloc/image_bloc/image_bloc.dart';
import 'package:bartech_app/presentation/bloc/payment_bloc/payment_bloc.dart';
import 'package:bartech_app/presentation/bloc/sync-bloc/sync_bloc.dart';
import 'package:bartech_app/database/database.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Inicializar Drift en lugar de Isar
  final database = AppDatabase();

  runApp(
    MultiProvider(
      providers: [
        // 🌐 DIO CONFIGURATION
        Provider<Dio>(
          create: (_) => Dio(
            BaseOptions(
              baseUrl: 'http://192.168.20.10:9095/',
              connectTimeout: const Duration(seconds: 10),
              receiveTimeout: const Duration(seconds: 10),
            ),
          ),
        ),

        // 🗄️ DATABASE
        Provider<AppDatabase>.value(value: database),

        // 🌐 SERVICES (API)
        Provider<ProductsService>(
          create: (context) => ProductsService(context.read<Dio>()),
        ),
        Provider<ProductCategoriesService>(
          create: (context) => ProductCategoriesService(context.read<Dio>()),
        ),
        Provider<ProductGroupsService>(
          create: (context) => ProductGroupsService(context.read<Dio>()),
        ),
        Provider<ImageService>(
          create: (context) => ImageService(context.read<Dio>()),
        ),
        // 🚀 NUEVO: Order Service
        Provider<OrderService>(
          create: (context) => OrderService(context.read<Dio>()),
        ),

        // 📂 REPOSITORIES (API)
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
        Provider<ImageRepository>(
          create: (context) => ImageRepository(context.read<ImageService>()),
        ),
        // 🚀 NUEVO: Order Repository
        Provider<OrderRepository>(
          create: (context) => OrderRepository(context.read<OrderService>()),
        ),

        // 🗄️ LOCAL REPOSITORIES (Drift)
        Provider<ProductsDriftRepository>(
          create: (context) =>
              ProductsDriftRepository(context.read<AppDatabase>()),
        ),
        Provider<ProductCategoryDriftRepository>(
          create: (context) =>
              ProductCategoryDriftRepository(context.read<AppDatabase>()),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => SyncBloc(
              productsRepository: context.read<ProductsRepository>(),
              productsIsarRepository: context.read<ProductsDriftRepository>(),
              productCategoriesRepository: context
                  .read<ProductCategoriesRepository>(),
              productCategoryIsarRepository: context
                  .read<ProductCategoryDriftRepository>(),
            )..add(SyncAllEvent()),
          ),
          BlocProvider(
            create: (context) => DetailsBloc(
              categoryRepository: context
                  .read<ProductCategoryDriftRepository>(),
              productsIsarRepository: context.read<ProductsDriftRepository>(),
            ),
          ),
          BlocProvider(create: (_) => CartBloc()),
          BlocProvider(create: (_) => PaymentBloc()),
          BlocProvider(
            create: (_) => InactivityBloc()..add(StartInactivityTimer(60)),
          ),
          BlocProvider(
            create: (context) => ImageBloc(context.read<ImageRepository>()),
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
      builder: (context, child) {
        return BlocListener<SyncBloc, SyncState>(
          listener: (context, state) {
            if (state is SyncSuccess) {
              // Cuando la sincronización es exitosa, cargar las categorías
              context.read<DetailsBloc>().add(LoadCategoriesEvent());
            }
          },
          child: child!,
        );
      },
    );
  }
}
