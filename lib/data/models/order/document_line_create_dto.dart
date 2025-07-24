import 'package:bartech_app/data/models/cart_item.dart';

// 📝 ORDER LINE CREATE DTO (Para enviar)
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

  // 🎯 Factory desde CartItem - Solo producto base
  factory DocumentLineCreateDto.fromCartItem(CartItem cartItem) {
    final product = cartItem.product;
    double basePrice = product.price;

    // Aplicar descuento si existe
    if (product.discount != null && product.discount! > 0) {
      basePrice = basePrice - (basePrice * (product.discount! / 100));
    }

    // ✅ NO agregar acompañamientos aquí - van como líneas separadas
    final lineTotal = basePrice * cartItem.quantity;

    return DocumentLineCreateDto(
      itemCode: product.itemCode ?? '',
      itemName: product.itemName,
      quantity: cartItem.quantity.toDouble(),
      price: basePrice,
      lineStatus: 'A',
      taxCode: 'IGV18',
      lineTotal: lineTotal,
    );
  }

  // 🎯 Factory para acompañamientos como líneas separadas
  factory DocumentLineCreateDto.fromAccompaniment(
    Map<String, dynamic> accompaniment,
    int parentQuantity,
  ) {
    // 🔧 Acceso robusto al itemCode - prueba múltiples campos
    String itemCode = '';

    // Intentar diferentes formas de acceder al itemCode
    if (accompaniment['itemCode'] != null) {
      itemCode = accompaniment['itemCode'].toString();
    } else if (accompaniment['ItemCode'] != null) {
      itemCode = accompaniment['ItemCode'].toString();
    } else if (accompaniment['item_code'] != null) {
      itemCode = accompaniment['item_code'].toString();
    }

    // Si aún está vacío, generar uno automático
    if (itemCode.isEmpty) {
      final name =
          accompaniment['itemName']?.toString() ??
          accompaniment['name']?.toString() ??
          'ACC';
      final cleanName = name
          .replaceAll(RegExp(r'[^a-zA-Z0-9]'), '_')
          .toUpperCase();
      itemCode = 'ACC_$cleanName';
    }

    // 🔧 Acceso robusto al itemName
    final itemName =
        accompaniment['itemName']?.toString() ??
        accompaniment['name']?.toString() ??
        accompaniment['ItemName']?.toString() ??
        'Acompañamiento';

    // 🔧 Acceso robusto al price
    final price =
        (accompaniment['price'] as num?)?.toDouble() ??
        (accompaniment['Price'] as num?)?.toDouble() ??
        0.0;

    final accQuantity = (accompaniment['quantity'] as num?)?.toDouble() ?? 1.0;

    // Log para debug
    print('🔍 Acompañamiento procesado:');
    print('   Raw data: $accompaniment');
    print('   ItemCode extraído: $itemCode');
    print('   ItemName extraído: $itemName');
    print('   Price extraído: $price');

    // Cantidad total = cantidad del acompañamiento * cantidad del producto padre
    final totalQuantity = accQuantity * parentQuantity;
    final lineTotal = price * totalQuantity;

    return DocumentLineCreateDto(
      itemCode: itemCode,
      itemName: itemName,
      quantity: totalQuantity,
      price: price,
      lineStatus: 'A',
      taxCode: 'IGV18',
      lineTotal: lineTotal,
    );
  }
}
