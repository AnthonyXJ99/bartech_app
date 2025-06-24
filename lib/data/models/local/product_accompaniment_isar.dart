import 'package:isar/isar.dart';

part 'product_accompaniment_isar.g.dart';

@collection
class ProductAccompanimentIsar {
  Id id = Isar.autoIncrement; // Obligatorio para Isar

  late String itemCode;
  String? itemName;
  late double priceOld;
  late double price;
  String? imageUrl;
  String? productItemCode;

  // Constructor vacío para Isar
  ProductAccompanimentIsar();

  // Factory para conversión desde JSON
  factory ProductAccompanimentIsar.fromJson(Map<String, dynamic> json) {
    final a = ProductAccompanimentIsar();
    a.itemCode = json['itemCode'];
    a.itemName = json['itemName'];
    a.priceOld = (json['priceOld'] as num?)?.toDouble() ?? 0;
    a.price = (json['price'] as num?)?.toDouble() ?? 0;
    a.imageUrl = json['imageUrl'];
    a.productItemCode = json['productItemCode'];
    return a;
  }

  Map<String, dynamic> toJson() => {
    'itemCode': itemCode,
    'itemName': itemName,
    'priceOld': priceOld,
    'price': price,
    'imageUrl': imageUrl,
    'productItemCode': productItemCode,
  };
}
