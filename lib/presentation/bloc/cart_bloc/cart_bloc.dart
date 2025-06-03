import 'package:bartech_app/data/models/cart_item.dart';
import 'package:bloc/bloc.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartState(items: [])) {
    on<AddToCart>((event, emit) {
      final items = List<CartItem>.from(state.items);

      // Ahora compara además de itemCode, los ingredientes y acompañamientos (deep equality)
      int idx = items.indexWhere(
        (i) =>
            i.product.itemCode == event.item.product.itemCode &&
            _listEquals(i.ingredients, event.item.ingredients) &&
            _listEquals(i.accompaniments, event.item.accompaniments),
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
  // Helper para comparar listas de Map<String, dynamic>
  bool _listEquals(List<Map<String, dynamic>> a, List<Map<String, dynamic>> b) {
    if (a.length != b.length) return false;
    for (int i = 0; i < a.length; i++) {
      if (!_mapEquals(a[i], b[i])) return false;
    }
    return true;
  }

  // Helper para comparar mapas de String, dynamic
  bool _mapEquals(Map<String, dynamic> a, Map<String, dynamic> b) {
    if (a.length != b.length) return false;
    for (final key in a.keys) {
      if (!b.containsKey(key) || b[key] != a[key]) return false;
    }
    return true;
  }
}
