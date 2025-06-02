import 'package:bloc/bloc.dart';

part 'product_customize_event.dart';
part 'product_customize_state.dart';

class ProductCustomizeBloc
    extends Bloc<ProductCustomizeEvent, ProductCustomizeState> {
  ProductCustomizeBloc(
    List<Map<String, dynamic>> initialIngredients,
    List<Map<String, dynamic>> initialAccompaniments,
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

    on<ToggleAccompanimentsPanel>((event, emit) {
      emit(state.copyWith(showAccompaniments: !state.showAccompaniments));
    });
  }
}
