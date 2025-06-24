import 'package:bartech_app/data/models/product.dart';
import 'package:isar/isar.dart';
import 'product_material_isar.dart';
import 'product_accompaniment_isar.dart';

part 'product_isar.g.dart';

@collection
class ProductIsar {
  Id id = Isar.autoIncrement; // Campo obligatorio para Isar

  String? itemCode;
  late String itemName;
  late double price;
  late String available;
  late String enabled;
  String? eanCode;
  String? frgnName;
  double? discount;
  String? imageUrl;
  String? description;
  String? frgnDescription;
  String? sellItem;
  String? groupItemCode;
  String? categoryItemCode;
  String? waitingTime;
  double? rating;

  // Links para relaciones con materiales y acompañamientos
  final material = IsarLinks<ProductMaterialISar>();
  final accompaniment = IsarLinks<ProductAccompanimentIsar>();

  ProductIsar();

  // Puedes agregar un factory para convertir desde tu modelo de API
  factory ProductIsar.fromApi(Product product) {
    final p = ProductIsar();
    p.itemCode = product.itemCode;
    p.itemName = product.itemName;
    p.price = product.price;
    p.available = product.available;
    p.enabled = product.enabled;
    p.eanCode = product.eanCode;
    p.frgnName = product.frgnName;
    p.discount = product.discount;
    p.imageUrl = product.imageUrl;
    p.description = product.description;
    p.frgnDescription = product.frgnDescription;
    p.sellItem = product.sellItem;
    p.groupItemCode = product.groupItemCode;
    p.categoryItemCode = product.categoryItemCode;
    p.waitingTime = product.waitingTime;
    p.rating = product.rating;
    // Links (se asignan después de guardar los objetos hijos)
    return p;
  }

  // Puedes agregar toMap y fromMap si lo necesitas
}
