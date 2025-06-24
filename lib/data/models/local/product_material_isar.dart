import 'package:isar/isar.dart';

part 'product_material_isar.g.dart';

@collection
class ProductMaterialISar {
  Id id = Isar.autoIncrement; // campo obligatorio de Isar

  late String itemCode;
  String? itemName;
  late double quantity;
  String? imageUrl;
  String? isPrimary;
  String? productItemCode;

  // Constructor vacío requerido por Isar
  ProductMaterialISar();

  // Puedes agregar tus constructores/factory si necesitas compatibilidad
  // con la API, pero Isar requiere el vacío por default

  // Factory para convertir desde JSON (opcional, si lo necesitas)
  factory ProductMaterialISar.fromJson(Map<String, dynamic> json) {
    final m = ProductMaterialISar();
    m.itemCode = json['itemCode'];
    m.itemName = json['itemName'];
    m.quantity = (json['quantity'] as num?)?.toDouble() ?? 0;
    m.imageUrl = json['imageUrl'];
    m.isPrimary = json['isPrimary'];
    m.productItemCode = json['productItemCode'];
    return m;
  }

  Map<String, dynamic> toJson() => {
    'itemCode': itemCode,
    'itemName': itemName,
    'quantity': quantity,
    'imageUrl': imageUrl,
    'isPrimary': isPrimary,
    'productItemCode': productItemCode,
  };
}
