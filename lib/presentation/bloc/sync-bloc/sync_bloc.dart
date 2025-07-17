import 'package:bartech_app/data/models/local/product_isar.dart';
import 'package:bartech_app/data/repository/products_isar_repository.dart';
import 'package:bartech_app/data/repository/products_repository.dart';
import 'package:bartech_app/data/repository/product_categories_repository.dart';
import 'package:bartech_app/data/repository/local/product_category_isar_reporitory.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'sync_event.dart';
part 'sync_state.dart';

class SyncBloc extends Bloc<SyncEvent, SyncState> {
  final ProductsRepository productsRepository;
  final ProductsIsarRepository productsIsarRepository;
  final ProductCategoriesRepository productCategoriesRepository;
  final ProductCategoryIsarRepository productCategoryIsarRepository;

  SyncBloc({
    required this.productsRepository,
    required this.productsIsarRepository,
    required this.productCategoriesRepository,
    required this.productCategoryIsarRepository,
  }) : super(SyncInitial()) {
    on<SyncProductsEvent>((event, emit) async {
      emit(SyncLoading());
      try {
        // 1. Recuperar productos desde la API
        final products = await productsRepository.getAllProducts();

        // 2. Convertir a ProductIsar
        final productsIsar = products
            .map((p) => ProductIsar.fromApi(p))
            .toList();

        // 3. Guardar en Isar
        await productsIsarRepository.syncFromApi(productsIsar);

        emit(SyncSuccess());
      } catch (e) {
        emit(SyncFailure(error: e.toString()));
      }
    });

    on<SyncCategoriesEvent>((event, emit) async {
      emit(SyncLoading());
      try {
        // 1. Recuperar categorías desde la API
        final categories = await productCategoriesRepository.getAllCategories();

        // 2dar en Isar usando el repositorio Isar
        await productCategoryIsarRepository.syncFromApi(categories);

        emit(SyncSuccess());
      } catch (e) {
        emit(SyncFailure(error: e.toString()));
      }
    });

    on<SyncAllEvent>((event, emit) async {
      emit(SyncLoading());
      try {
        // 1. Recuperar productos y categorías desde la API
        final products = await productsRepository.getAllProducts();
        final categories = await productCategoriesRepository.getAllCategories();

        // 2. Convertir productos a ProductIsar
        final productsIsar = products
            .map((p) => ProductIsar.fromApi(p))
            .toList();

        // 3. Guardar productos en Isar
        await productsIsarRepository.syncFromApi(productsIsar);

        // 4Guardar categorías en Isar
        await productCategoryIsarRepository.syncFromApi(categories);

        emit(SyncSuccess());
        
      } catch (e) {
        emit(SyncFailure(error: e.toString()));
      }
    });
  }
}
