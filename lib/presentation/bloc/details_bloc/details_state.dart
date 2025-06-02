import 'package:equatable/equatable.dart';
import 'package:bartech_app/data/models/model_products.dart';

class DetailsState extends Equatable {
  final String selectedRecipeName;
  final List<Products> products;

  const DetailsState({
    required this.selectedRecipeName,
    required this.products,
  });

  factory DetailsState.initial() =>
      const DetailsState(selectedRecipeName: 'Home', products: []);

  DetailsState copyWith({
    String? selectedRecipeName,
    List<Products>? products,
  }) => DetailsState(
    selectedRecipeName: selectedRecipeName ?? this.selectedRecipeName,
    products: products ?? this.products,
  );

  @override
  List<Object?> get props => [selectedRecipeName, products];
}
