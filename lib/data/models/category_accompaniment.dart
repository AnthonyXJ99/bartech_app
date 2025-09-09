class CategoryAccompaniment {
  final int lineNumber;
  final String accompanimentItemCode;
  final String accompanimentItemName;
  final String? accompanimentImageUrl;
  final double accompanimentPrice;
  final double discount;
  final String? enlargementItemCode;
  final double enlargementDiscount;

  CategoryAccompaniment({
    required this.lineNumber,
    required this.accompanimentItemCode,
    required this.accompanimentItemName,
    this.accompanimentImageUrl,
    required this.accompanimentPrice,
    required this.discount,
    this.enlargementItemCode,
    required this.enlargementDiscount,
  });

  factory CategoryAccompaniment.fromJson(Map<String, dynamic> json) =>
      CategoryAccompaniment(
        lineNumber: json['lineNumber'],
        accompanimentItemCode: json['accompanimentItemCode'],
        accompanimentItemName: json['accompanimentItemName'],
        accompanimentImageUrl: json['accompanimentImageUrl'],
        accompanimentPrice: (json['accompanimentPrice'] as num).toDouble(),
        discount: (json['discount'] as num).toDouble(),
        enlargementItemCode: json['enlargementItemCode'],
        enlargementDiscount: (json['enlargementDiscount'] as num).toDouble(),
      );

  Map<String, dynamic> toJson() => {
    'lineNumber': lineNumber,
    'accompanimentItemCode': accompanimentItemCode,
    'accompanimentItemName': accompanimentItemName,
    'accompanimentImageUrl': accompanimentImageUrl,
    'accompanimentPrice': accompanimentPrice,
    'discount': discount,
    'enlargementItemCode': enlargementItemCode,
    'enlargementDiscount': enlargementDiscount,
  };
}