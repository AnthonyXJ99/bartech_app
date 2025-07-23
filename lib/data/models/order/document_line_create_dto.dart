// 📝 ORDER LINE CREATE DTO (Para enviar)
import 'package:bartech_app/data/models/cart_item.dart';

class DocumentLineCreateDto {
  final String itemCode;
  final String itemName;
  final double? quantity;
  final double? price;
  final String? lineStatus;
  final String? taxCode;
  final double? lineTotal;

  DocumentLineCreateDto({
    required this.itemCode,
    required this.itemName,
    this.quantity,
    this.price,
    this.lineStatus,
    this.taxCode,
    this.lineTotal,
  });

  Map<String, dynamic> toJson() => {
    'itemCode': itemCode,
    'itemName': itemName,
    'quantity': quantity,
    'price': price,
    'lineStatus': lineStatus,
    'taxCode': taxCode,
    'lineTotal': lineTotal,
  };

  // 🎯 Factory desde CartItem
  factory DocumentLineCreateDto.fromCartItem(CartItem cartItem) {
    final product = cartItem.product;
    double basePrice = product.price;

    // Aplicar descuento si existe
    if (product.discount != null && product.discount! > 0) {
      basePrice = basePrice - (basePrice * (product.discount! / 100));
    }

    // Calcular precio con acompañamientos
    double accompanimentTotal = 0;
    for (var acc in cartItem.accompaniments) {
      final accQuantity = (acc['quantity'] as num?)?.toDouble() ?? 1.0;
      final accPrice = (acc['price'] as num?)?.toDouble() ?? 0.0;
      accompanimentTotal += accQuantity * accPrice;
    }

    final unitPrice = basePrice + accompanimentTotal;
    final lineTotal = unitPrice * cartItem.quantity;

    return DocumentLineCreateDto(
      itemCode: product.itemCode ?? '',
      itemName: product.itemName,
      quantity: cartItem.quantity.toDouble(),
      price: unitPrice,
      lineStatus: 'A', // A = Active
      taxCode: 'IGV18', // Configurable según tu negocio
      lineTotal: lineTotal,
    );
  }
}
