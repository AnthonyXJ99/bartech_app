class ProductMaterial {
  final String itemCode;
  final String? itemName;
  final double quantity;
  final String? imageUrl;
  final String? isPrimary;
  final String? productItemCode;

  ProductMaterial({
    required this.itemCode,
    this.itemName,
    required this.quantity,
    this.imageUrl,
    this.isPrimary,
    this.productItemCode,
  });

  factory ProductMaterial.fromJson(Map<String, dynamic> json) =>
      ProductMaterial(
        itemCode: json['itemCode'],
        itemName: json['itemName'],
        quantity: (json['quantity'] as num?)?.toDouble() ?? 0,
        imageUrl: json['imageUrl'],
        isPrimary: json['isPrimary'],
        productItemCode: json['productItemCode'],
      );

  Map<String, dynamic> toJson() => {
    'itemCode': itemCode,
    'itemName': itemName,
    'quantity': quantity,
    'imageUrl': imageUrl,
    'isPrimary': isPrimary,
    'productItemCode': productItemCode,
  };
}

class ProductAccompaniment {
  final String itemCode;
  final String? itemName;
  final double priceOld;
  final double price;
  final String? imageUrl;
  final String? productItemCode;

  ProductAccompaniment({
    required this.itemCode,
    this.itemName,
    required this.priceOld,
    required this.price,
    this.imageUrl,
    this.productItemCode,
  });

  factory ProductAccompaniment.fromJson(Map<String, dynamic> json) =>
      ProductAccompaniment(
        itemCode: json['itemCode'],
        itemName: json['itemName'],
        priceOld: (json['priceOld'] as num?)?.toDouble() ?? 0,
        price: (json['price'] as num?)?.toDouble() ?? 0,
        imageUrl: json['imageUrl'],
        productItemCode: json['productItemCode'],
      );

  Map<String, dynamic> toJson() => {
    'itemCode': itemCode,
    'itemName': itemName,
    'priceOld': priceOld,
    'price': price,
    'imageUrl': imageUrl,
    'productItemCode': productItemCode,
  };
}

class Product {
  final String? itemCode;
  final String itemName;
  final double price;
  final String available;
  final String enabled;
  final String? eanCode;
  final String? frgnName;
  final double? discount;
  final String? imageUrl;
  final String? description;
  final String? frgnDescription;
  final String? sellItem;
  final String? groupItemCode;
  final String? categoryItemCode;
  final String? waitingTime;
  final int? rating;
  final List<ProductMaterial>? material;
  final List<ProductAccompaniment>? accompaniment;

  Product({
    this.itemCode,
    required this.itemName,
    required this.price,
    required this.available,
    required this.enabled,
    this.eanCode,
    this.frgnName,
    this.discount,
    this.imageUrl,
    this.description,
    this.frgnDescription,
    this.sellItem,
    this.groupItemCode,
    this.categoryItemCode,
    this.waitingTime,
    this.rating,
    this.material,
    this.accompaniment,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    itemCode: json['itemCode'],
    itemName: json['itemName'],
    price: (json['price'] as num).toDouble(),
    available: json['available'],
    enabled: json['enabled'],
    eanCode: json['eanCode'],
    frgnName: json['frgnName'],
    discount: (json['discount'] as num?)?.toDouble(),
    imageUrl: json['imageUrl'],
    description: json['description'],
    frgnDescription: json['frgnDescription'],
    sellItem: json['sellItem'],
    groupItemCode: json['groupItemCode'],
    categoryItemCode: json['categoryItemCode'],
    waitingTime: json['waitingTime'],
    rating: json['rating'],
    material: (json['material'] as List?)
        ?.map((e) => ProductMaterial.fromJson(e))
        .toList(),
    accompaniment: (json['accompaniment'] as List?)
        ?.map((e) => ProductAccompaniment.fromJson(e))
        .toList(),
  );

  Map<String, dynamic> toJson() => {
    'itemCode': itemCode,
    'itemName': itemName,
    'price': price,
    'available': available,
    'enabled': enabled,
    'eanCode': eanCode,
    'frgnName': frgnName,
    'discount': discount,
    'imageUrl': imageUrl,
    'description': description,
    'frgnDescription': frgnDescription,
    'sellItem': sellItem,
    'groupItemCode': groupItemCode,
    'waitingTime': waitingTime,
    'rating': rating,
    'categoryItemCode': categoryItemCode,
    'material': material?.map((e) => e.toJson()).toList(),
    'accompaniment': accompaniment?.map((e) => e.toJson()).toList(),
  };
}
