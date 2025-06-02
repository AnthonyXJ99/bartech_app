import 'package:bartech_app/data/products_data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'details_event.dart';
import 'details_state.dart';

class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {
  DetailsBloc() : super(DetailsState.initial()) {
    on<GroupSelectedEvent>(_onGroupSelected);
  }

  void _onGroupSelected(GroupSelectedEvent event, Emitter<DetailsState> emit) {
    // Copia aquí tu lógica para cargar productos según el grupo

    final group = event.group;
    //List<Products> products = [];
    String name = group.groupItemName;

    final products = ProductsData.getProductsByGroup(group.groupItemName);

    emit(state.copyWith(selectedRecipeName: name, products: products));
  }
}
