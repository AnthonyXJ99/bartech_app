class ProductGroup {
  final String productGroupCode;
  final String productGroupName;
  final String enabled;
  final int visOrder;
  final String dataSource;
  final String? frgnName;
  final String? imageUrl;
  final String? description;
  final String? frgnDescription;
  final String? productGroupCodeERP;
  final String? productGroupCodePOS;

  ProductGroup({
    required this.productGroupCode,
    required this.productGroupName,
    required this.enabled,
    required this.visOrder,
    required this.dataSource,
    this.frgnName,
    this.imageUrl,
    this.description,
    this.frgnDescription,
    this.productGroupCodeERP,
    this.productGroupCodePOS,
  });

  factory ProductGroup.fromJson(Map<String, dynamic> json) => ProductGroup(
    productGroupCode: json['productGroupCode'],
    productGroupName: json['productGroupName'],
    enabled: json['enabled'],
    visOrder: json['visOrder'],
    dataSource: json['dataSource'],
    frgnName: json['frgnName'],
    imageUrl: json['imageUrl'],
    description: json['description'],
    frgnDescription: json['frgnDescription'],
    productGroupCodeERP: json['productGroupCodeERP'],
    productGroupCodePOS: json['productGroupCodePOS'],
  );

  Map<String, dynamic> toJson() => {
    'productGroupCode': productGroupCode,
    'productGroupName': productGroupName,
    'enabled': enabled,
    'visOrder': visOrder,
    'dataSource': dataSource,
    'frgnName': frgnName,
    'imageUrl': imageUrl,
    'description': description,
    'frgnDescription': frgnDescription,
    'productGroupCodeERP': productGroupCodeERP,
    'productGroupCodePOS': productGroupCodePOS,
  };
}
