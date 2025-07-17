import 'package:bartech_app/data/repository/local/product_category_isar_reporitory.dart';
import 'package:bartech_app/data/repository/products_isar_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'details_event.dart';
import 'details_state.dart';

class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {
  final ProductCategoryIsarRepository categoryRepository;
  final ProductsIsarRepository productsIsarRepository;

  DetailsBloc({
    required this.categoryRepository,
    required this.productsIsarRepository,
  }) : super(const DetailsState()) {
    on<LoadCategoriesEvent>(_onLoadCategories);
    on<CategorySelectedEvent>(_onCategorySelected);
  }

  Future<void> _onLoadCategories(
    LoadCategoriesEvent event,
    Emitter<DetailsState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, error: ''));
    try {
      final categories = await categoryRepository
          .getAllCategoriesAsProductCategory();
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
    emit(
      state.copyWith(
        isLoading: true,
        selectedCategory: event.category,
        error: '',
      ),
    );
    try {
      final productsIsar = await productsIsarRepository.getProductsByCategory(
        event.category.categoryItemCode,
      );
      // Convertir ProductIsar a Product para la UI
      final products = productsIsar.map((p) => p.toProduct()).toList();
      emit(state.copyWith(products: products, isLoading: false));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: 'Error cargando productos'));
    }
  }
}
