class CategoryItems {

  final String categoryItemCode;
  final String categoryItemName;
  final String image;
  final String description;
  final String dataSource;
  final String groupItemCode;
  final int visOrder;

  CategoryItems({
    required this.categoryItemCode,
    required this.categoryItemName,
    required this.image,
    required this.description,
    required this.dataSource,
    required this.groupItemCode,
    this.visOrder = 0,
  });
}
