import 'package:bartech_app/data/repository/products_drift_repository.dart';
import 'package:bartech_app/data/repository/products_repository.dart';
import 'package:bartech_app/data/repository/product_categories_repository.dart';
import 'package:bartech_app/data/repository/local/product_category_drift_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'sync_event.dart';
part 'sync_state.dart';

class SyncBloc extends Bloc<SyncEvent, SyncState> {
  final ProductsRepository productsRepository;
  final ProductsDriftRepository productsIsarRepository; // ✅ Actualizado
  final ProductCategoriesRepository productCategoriesRepository;
  final ProductCategoryDriftRepository productCategoryIsarRepository; // ✅ Actualizado

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

        // 2. Limpiar productos existentes en Drift
        await productsIsarRepository.clearAllProducts();

        // 3. Guardar productos en Drift (ya no necesitas convertir a ProductIsar)
        await productsIsarRepository.insertProducts(products);

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

        // 2. Limpiar categorías existentes en Drift
        await productCategoryIsarRepository.clearAllCategories();

        // 3. Guardar categorías en Drift
        await productCategoryIsarRepository.insertProductCategories(categories);

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

        // 2. Limpiar datos existentes en Drift
        await productsIsarRepository.clearAllProducts();
        await productCategoryIsarRepository.clearAllCategories();

        // 3. Guardar productos en Drift (sin conversión)
        await productsIsarRepository.insertProducts(products);

        // 4. Guardar categorías en Drift
        await productCategoryIsarRepository.insertProductCategories(categories);

        emit(SyncSuccess());

      } catch (e) {
        emit(SyncFailure(error: e.toString()));
      }
    });
  }
}