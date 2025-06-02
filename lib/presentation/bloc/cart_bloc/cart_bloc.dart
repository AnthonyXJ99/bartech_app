import 'package:bartech_app/data/models/cart_item.dart';
import 'package:bloc/bloc.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartState(items: [])) {
    on<AddToCart>((event, emit) {
      final items = List<CartItem>.from(state.items);
      // Si ya existe suma cantidad (puedes buscar por itemCode, por ejemplo)
      final idx = items.indexWhere(
        (i) => i.product.itemCode == event.item.product.itemCode,
      );
      if (idx >= 0) {
        items[idx].quantity += event.item.quantity;
      } else {
        items.add(event.item);
      }
      emit(CartState(items: items));
    });

    on<RemoveFromCart>((event, emit) {
      final items = List<CartItem>.from(state.items)..removeAt(event.index);
      emit(CartState(items: items));
    });

    on<UpdateCartItem>((event, emit) {
      final items = List<CartItem>.from(state.items);
      if (event.quantity > 0) {
        items[event.index].quantity = event.quantity;
        emit(CartState(items: items));
      }
    });
    on<ProccesCart>((event, emit) {
      emit(CartState(items: []));
    });
  }
}
