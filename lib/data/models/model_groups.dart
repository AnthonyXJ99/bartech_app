class GroupItems {
  final int groupItemCode;
  final String groupItemName;
  final String image;
  final String description;

  final String enabled;
  final int visOrder;
  final String dataSource;

//este es el constructor
  const GroupItems({
    required this.groupItemCode,
    required this.groupItemName,
    required this.image,
    required this.description,
    this.enabled = "Y", // opcional con Valor predeterminado
    this.visOrder = 0, // opcional con Valor predeterminado
    this.dataSource =  "", // opcional con Valor predeterminado
  });

  factory GroupItems.fromJson(Map<String, dynamic> json) => GroupItems(
        groupItemCode: json['id'],
        groupItemName: json['name'],
        image: json['img'],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        'id': groupItemCode,
        'title': groupItemName,
        'image': image,
        'description': description,
      };
  GroupItems copy() => GroupItems(
        groupItemCode: groupItemCode,
        groupItemName: groupItemName,
        image: image,
        description: description,
      );
}
