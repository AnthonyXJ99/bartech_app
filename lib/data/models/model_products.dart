class Products {
  
  final String itemCode;
  final String itemName;
  final double price;
  final double discount;
  final String image;
  final String description;
  final String available;
  final String enabled;
  final String groupItemCode;
  final String categoryItemCode;
  
  Products({
    required this.itemCode,
    required this.itemName, 
    required this.price,
     this.discount = .0,
    required this.image,
    required this.description,
     this.enabled = 'Y',
     this.available = 'Y', 
    required this.groupItemCode, 
     this.categoryItemCode = '',
  });
}
