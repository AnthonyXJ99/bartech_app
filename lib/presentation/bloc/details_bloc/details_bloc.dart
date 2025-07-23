import 'package:bartech_app/data/repository/local/product_category_drift_repository.dart';
import 'package:bartech_app/data/repository/products_drift_repository.dart';
import 'package:bartech_app/presentation/screens/util/memory_image_cache.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'details_event.dart';
import 'details_state.dart';

class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {
  final ProductCategoryDriftRepository categoryRepository; // ✅ Actualizado
  final ProductsDriftRepository productsIsarRepository; // ✅ Actualizado

  DetailsBloc({
    required this.categoryRepository,
    required this.productsIsarRepository,
  }) : super(const DetailsState()) {
    on<LoadCategoriesEvent>(_onLoadCategories);
    on<CategorySelectedEvent>(_onCategorySelected);
    on<LoadCategoriesAfterSyncEvent>(_onLoadCategoriesAfterSync); // ✅ Agregado
  }

  Future<void> _onLoadCategories(
      LoadCategoriesEvent event,
      Emitter<DetailsState> emit,
      ) async {
    emit(state.copyWith(isLoading: true, error: ''));
    try {
      // ✅ Método actualizado para Drift
      final categories = await categoryRepository.getAllProductCategories();

      emit(
        state.copyWith(
          categories: categories,
          selectedCategory: categories.isNotEmpty ? categories.first : null,
          isLoading: false,
        ),
      );
      if (categories.isNotEmpty) {
        add(
          CategorySelectedEvent(
            categories
                .where((category) => category.frgnName == 'McCombo®')
                .first,
          ),
        );
      }
    } catch (e) {
      emit(
        state.copyWith(isLoading: false, error: 'Error cargando categorías'),
      );
    }
  }

  Future<void> _onLoadCategoriesAfterSync(
      LoadCategoriesAfterSyncEvent event,
      Emitter<DetailsState> emit,
      ) async {
    // Esperar un poco para asegurar que la sincronización se complete
    await Future.delayed(const Duration(milliseconds: 500));
    add(LoadCategoriesEvent());
  }

  Future<void> _onCategorySelected(
      CategorySelectedEvent event,
      Emitter<DetailsState> emit,
      ) async {
    // Limpiar caché de imágenes al cambiar categoría
    MemoryImageCache.clearCache();

    // Pequeño delay para asegurar que la limpieza se complete
    await Future.delayed(const Duration(milliseconds: 100));

    emit(
      state.copyWith(
        isLoading: true,
        selectedCategory: event.category,
        error: '',
        products: [], // Limpiar productos anteriores inmediatamente
      ),
    );
    try {
      // ✅ Método actualizado para Drift - ya devuelve Product directamente
      final products = await productsIsarRepository.getProductsByCategory(
        event.category.categoryItemCode,
      );

      // ✅ Ya no necesitas convertir porque Drift ya devuelve el modelo correcto
      emit(state.copyWith(products: products, isLoading: false));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: 'Error cargando productos'));
    }
  }
}