import 'package:bartech_app/data/repository/product_categories_repository.dart';
import 'package:bartech_app/data/repository/products_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'details_event.dart';
import 'details_state.dart';

class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {
  final ProductCategoriesRepository categoryRepository;
  final ProductsRepository productsRepository;

  DetailsBloc({
    required this.categoryRepository,
    required this.productsRepository,
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
      final categories = await categoryRepository.getAllCategories();
      emit(
        state.copyWith(
          categories: categories,
          selectedCategory: categories.isNotEmpty ? categories.first : null,
        ),
      );
      if (categories.isNotEmpty) {
        add(CategorySelectedEvent(categories.first));
      }
    } catch (e) {
      emit(
        state.copyWith(isLoading: false, error: 'Error cargando categorías'),
      );
    }
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
      final products = await productsRepository.getProductsByCategory(
        event.category.categoryItemCode,
      );
      emit(state.copyWith(products: products ?? [], isLoading: false));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: 'Error cargando productos'));
    }
  }
}
