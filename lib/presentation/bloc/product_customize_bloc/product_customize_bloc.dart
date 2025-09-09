import 'package:bloc/bloc.dart';
import 'package:bartech_app/data/repository/products_drift_repository.dart';
import 'package:bartech_app/data/models/product.dart';

part 'product_customize_event.dart';
part 'product_customize_state.dart';

class ProductCustomizeBloc
    extends Bloc<ProductCustomizeEvent, ProductCustomizeState> {
  final ProductsDriftRepository _productsRepository;

  ProductCustomizeBloc(
    List<Map<String, dynamic>> initialIngredients,
    List<Map<String, dynamic>> initialAccompaniments,
    this._productsRepository,
  ) : super(
        ProductCustomizeState.initial(
          initialIngredients,
          initialAccompaniments,
        ),
      ) {
    on<SetProductQuantity>((event, emit) {
      emit(state.copyWith(quantity: event.quantity));
    });

    on<SetIngredientAmount>((event, emit) {
      final updated = List<Map<String, dynamic>>.from(state.ingredients);
      updated[event.index]["amount"] = event.amount;
      emit(state.copyWith(ingredients: updated));
    });

    on<SetAccompanimentQuantity>((event, emit) {
      final updated = List<Map<String, dynamic>>.from(state.accompaniments);
      updated[event.index]["quantity"] = event.quantity;
      emit(state.copyWith(accompaniments: updated));
    });

    on<RequestAccompanimentEnlargement>((event, emit) async {
      final acc = state.accompaniments[event.index];
      final currentlyEnlarged = acc["isEnlarged"] as bool? ?? false;
      
      if (currentlyEnlarged) {
        // Revertir al producto original
        add(SetAccompanimentEnlargement(
          index: event.index, 
          isEnlarged: false,
        ));
      } else {
        // Mostrar estado de carga
        final updatedLoadingSet = Set<int>.from(state.loadingEnlargements);
        updatedLoadingSet.add(event.index);
        emit(state.copyWith(
          loadingEnlargements: updatedLoadingSet,
          clearError: true,
        ));

        // Buscar producto de agrandado
        final enlargementCode = acc["enlargementItemCode"] as String?;
        if (enlargementCode != null && enlargementCode.isNotEmpty) {
          try {
            final enlargementProduct = await _productsRepository.getProductByItemCode(enlargementCode);
            
            if (enlargementProduct != null) {
              add(SetAccompanimentEnlargement(
                index: event.index, 
                enlargementProduct: enlargementProduct,
                isEnlarged: true,
              ));
            } else {
              // Producto no encontrado
              final finalLoadingSet = Set<int>.from(state.loadingEnlargements);
              finalLoadingSet.remove(event.index);
              emit(state.copyWith(
                loadingEnlargements: finalLoadingSet,
                errorMessage: "Producto de agrandado no encontrado",
              ));
            }
          } catch (e) {
            // Error al buscar producto
            final finalLoadingSet = Set<int>.from(state.loadingEnlargements);
            finalLoadingSet.remove(event.index);
            emit(state.copyWith(
              loadingEnlargements: finalLoadingSet,
              errorMessage: "Error al buscar producto: $e",
            ));
          }
        }
      }
    });

    on<SetAccompanimentEnlargement>((event, emit) {
      final updated = List<Map<String, dynamic>>.from(state.accompaniments);
      final acc = updated[event.index];
      
      // Remover de loading state
      final finalLoadingSet = Set<int>.from(state.loadingEnlargements);
      finalLoadingSet.remove(event.index);
      
      updated[event.index] = {
        ...acc,
        "isEnlarged": event.isEnlarged,
        if (event.isEnlarged && event.enlargementProduct != null) ...{
          // Reemplazar con datos del producto de agrandado
          "name": event.enlargementProduct!.itemName,
          "price": event.enlargementProduct!.price,
          "originalName": acc["originalName"], // Mantener nombre original
          "originalPrice": acc["originalPrice"], // Mantener precio original
        } else if (!event.isEnlarged) ...{
          // Restaurar datos originales
          "name": acc["originalName"] ?? acc["name"],
          "price": acc["originalPrice"] ?? acc["price"],
        },
      };
      
      emit(state.copyWith(
        accompaniments: updated,
        loadingEnlargements: finalLoadingSet,
        clearError: true,
      ));
    });

    on<ToggleAccompanimentsPanel>((event, emit) {
      emit(state.copyWith(showAccompaniments: !state.showAccompaniments));
    });
  }
}
