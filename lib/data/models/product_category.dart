class ProductCategory {
  final String categoryItemCode;
  final String categoryItemName;
  final String enabled;
  final String dataSource;
  final int visOrder;
  final String? frgnName;
  final String? imageUrl;
  final String? description;
  final String? frgnDescription;
  final String? groupItemCode;

  ProductCategory({
    required this.categoryItemCode,
    required this.categoryItemName,
    required this.enabled,
    required this.dataSource,
    required this.visOrder,
    this.frgnName,
    this.imageUrl,
    this.description,
    this.frgnDescription,
    this.groupItemCode,
  });

  factory ProductCategory.fromJson(Map<String, dynamic> json) =>
      ProductCategory(
        categoryItemCode: json['categoryItemCode'],
        categoryItemName: json['categoryItemName'],
        enabled: json['enabled'],
        dataSource: json['dataSource'],
        visOrder: json['visOrder'],
        frgnName: json['frgnName'],
        imageUrl: json['imageUrl'],
        description: json['description'],
        frgnDescription: json['frgnDescription'],
        groupItemCode: json['groupItemCode'],
      );

  Map<String, dynamic> toJson() => {
    'categoryItemCode': categoryItemCode,
    'categoryItemName': categoryItemName,
    'enabled': enabled,
    'dataSource': dataSource,
    'visOrder': visOrder,
    'frgnName': frgnName,
    'imageUrl': imageUrl,
    'description': description,
    'frgnDescription': frgnDescription,
    'groupItemCode': groupItemCode,
  };
}
