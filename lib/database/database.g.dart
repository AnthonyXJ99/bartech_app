// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $ProductsTable extends Products
    with TableInfo<$ProductsTable, ProductEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProductsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _itemCodeMeta =
      const VerificationMeta('itemCode');
  @override
  late final GeneratedColumn<String> itemCode = GeneratedColumn<String>(
      'item_code', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _itemNameMeta =
      const VerificationMeta('itemName');
  @override
  late final GeneratedColumn<String> itemName = GeneratedColumn<String>(
      'item_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<double> price = GeneratedColumn<double>(
      'price', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _availableMeta =
      const VerificationMeta('available');
  @override
  late final GeneratedColumn<String> available = GeneratedColumn<String>(
      'available', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _enabledMeta =
      const VerificationMeta('enabled');
  @override
  late final GeneratedColumn<String> enabled = GeneratedColumn<String>(
      'enabled', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _eanCodeMeta =
      const VerificationMeta('eanCode');
  @override
  late final GeneratedColumn<String> eanCode = GeneratedColumn<String>(
      'ean_code', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _frgnNameMeta =
      const VerificationMeta('frgnName');
  @override
  late final GeneratedColumn<String> frgnName = GeneratedColumn<String>(
      'frgn_name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _discountMeta =
      const VerificationMeta('discount');
  @override
  late final GeneratedColumn<double> discount = GeneratedColumn<double>(
      'discount', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _imageUrlMeta =
      const VerificationMeta('imageUrl');
  @override
  late final GeneratedColumn<String> imageUrl = GeneratedColumn<String>(
      'image_url', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _frgnDescriptionMeta =
      const VerificationMeta('frgnDescription');
  @override
  late final GeneratedColumn<String> frgnDescription = GeneratedColumn<String>(
      'frgn_description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _sellItemMeta =
      const VerificationMeta('sellItem');
  @override
  late final GeneratedColumn<String> sellItem = GeneratedColumn<String>(
      'sell_item', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _groupItemCodeMeta =
      const VerificationMeta('groupItemCode');
  @override
  late final GeneratedColumn<String> groupItemCode = GeneratedColumn<String>(
      'group_item_code', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _categoryItemCodeMeta =
      const VerificationMeta('categoryItemCode');
  @override
  late final GeneratedColumn<String> categoryItemCode = GeneratedColumn<String>(
      'category_item_code', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _waitingTimeMeta =
      const VerificationMeta('waitingTime');
  @override
  late final GeneratedColumn<String> waitingTime = GeneratedColumn<String>(
      'waiting_time', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _ratingMeta = const VerificationMeta('rating');
  @override
  late final GeneratedColumn<double> rating = GeneratedColumn<double>(
      'rating', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        itemCode,
        itemName,
        price,
        available,
        enabled,
        eanCode,
        frgnName,
        discount,
        imageUrl,
        description,
        frgnDescription,
        sellItem,
        groupItemCode,
        categoryItemCode,
        waitingTime,
        rating
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'products';
  @override
  VerificationContext validateIntegrity(Insertable<ProductEntity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('item_code')) {
      context.handle(_itemCodeMeta,
          itemCode.isAcceptableOrUnknown(data['item_code']!, _itemCodeMeta));
    }
    if (data.containsKey('item_name')) {
      context.handle(_itemNameMeta,
          itemName.isAcceptableOrUnknown(data['item_name']!, _itemNameMeta));
    } else if (isInserting) {
      context.missing(_itemNameMeta);
    }
    if (data.containsKey('price')) {
      context.handle(
          _priceMeta, price.isAcceptableOrUnknown(data['price']!, _priceMeta));
    } else if (isInserting) {
      context.missing(_priceMeta);
    }
    if (data.containsKey('available')) {
      context.handle(_availableMeta,
          available.isAcceptableOrUnknown(data['available']!, _availableMeta));
    } else if (isInserting) {
      context.missing(_availableMeta);
    }
    if (data.containsKey('enabled')) {
      context.handle(_enabledMeta,
          enabled.isAcceptableOrUnknown(data['enabled']!, _enabledMeta));
    } else if (isInserting) {
      context.missing(_enabledMeta);
    }
    if (data.containsKey('ean_code')) {
      context.handle(_eanCodeMeta,
          eanCode.isAcceptableOrUnknown(data['ean_code']!, _eanCodeMeta));
    }
    if (data.containsKey('frgn_name')) {
      context.handle(_frgnNameMeta,
          frgnName.isAcceptableOrUnknown(data['frgn_name']!, _frgnNameMeta));
    }
    if (data.containsKey('discount')) {
      context.handle(_discountMeta,
          discount.isAcceptableOrUnknown(data['discount']!, _discountMeta));
    }
    if (data.containsKey('image_url')) {
      context.handle(_imageUrlMeta,
          imageUrl.isAcceptableOrUnknown(data['image_url']!, _imageUrlMeta));
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('frgn_description')) {
      context.handle(
          _frgnDescriptionMeta,
          frgnDescription.isAcceptableOrUnknown(
              data['frgn_description']!, _frgnDescriptionMeta));
    }
    if (data.containsKey('sell_item')) {
      context.handle(_sellItemMeta,
          sellItem.isAcceptableOrUnknown(data['sell_item']!, _sellItemMeta));
    }
    if (data.containsKey('group_item_code')) {
      context.handle(
          _groupItemCodeMeta,
          groupItemCode.isAcceptableOrUnknown(
              data['group_item_code']!, _groupItemCodeMeta));
    }
    if (data.containsKey('category_item_code')) {
      context.handle(
          _categoryItemCodeMeta,
          categoryItemCode.isAcceptableOrUnknown(
              data['category_item_code']!, _categoryItemCodeMeta));
    }
    if (data.containsKey('waiting_time')) {
      context.handle(
          _waitingTimeMeta,
          waitingTime.isAcceptableOrUnknown(
              data['waiting_time']!, _waitingTimeMeta));
    }
    if (data.containsKey('rating')) {
      context.handle(_ratingMeta,
          rating.isAcceptableOrUnknown(data['rating']!, _ratingMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ProductEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProductEntity(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      itemCode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}item_code']),
      itemName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}item_name'])!,
      price: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}price'])!,
      available: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}available'])!,
      enabled: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}enabled'])!,
      eanCode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}ean_code']),
      frgnName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}frgn_name']),
      discount: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}discount']),
      imageUrl: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image_url']),
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      frgnDescription: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}frgn_description']),
      sellItem: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sell_item']),
      groupItemCode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}group_item_code']),
      categoryItemCode: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}category_item_code']),
      waitingTime: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}waiting_time']),
      rating: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}rating']),
    );
  }

  @override
  $ProductsTable createAlias(String alias) {
    return $ProductsTable(attachedDatabase, alias);
  }
}

class ProductEntity extends DataClass implements Insertable<ProductEntity> {
  final int id;
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
  final double? rating;
  const ProductEntity(
      {required this.id,
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
      this.rating});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || itemCode != null) {
      map['item_code'] = Variable<String>(itemCode);
    }
    map['item_name'] = Variable<String>(itemName);
    map['price'] = Variable<double>(price);
    map['available'] = Variable<String>(available);
    map['enabled'] = Variable<String>(enabled);
    if (!nullToAbsent || eanCode != null) {
      map['ean_code'] = Variable<String>(eanCode);
    }
    if (!nullToAbsent || frgnName != null) {
      map['frgn_name'] = Variable<String>(frgnName);
    }
    if (!nullToAbsent || discount != null) {
      map['discount'] = Variable<double>(discount);
    }
    if (!nullToAbsent || imageUrl != null) {
      map['image_url'] = Variable<String>(imageUrl);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || frgnDescription != null) {
      map['frgn_description'] = Variable<String>(frgnDescription);
    }
    if (!nullToAbsent || sellItem != null) {
      map['sell_item'] = Variable<String>(sellItem);
    }
    if (!nullToAbsent || groupItemCode != null) {
      map['group_item_code'] = Variable<String>(groupItemCode);
    }
    if (!nullToAbsent || categoryItemCode != null) {
      map['category_item_code'] = Variable<String>(categoryItemCode);
    }
    if (!nullToAbsent || waitingTime != null) {
      map['waiting_time'] = Variable<String>(waitingTime);
    }
    if (!nullToAbsent || rating != null) {
      map['rating'] = Variable<double>(rating);
    }
    return map;
  }

  ProductsCompanion toCompanion(bool nullToAbsent) {
    return ProductsCompanion(
      id: Value(id),
      itemCode: itemCode == null && nullToAbsent
          ? const Value.absent()
          : Value(itemCode),
      itemName: Value(itemName),
      price: Value(price),
      available: Value(available),
      enabled: Value(enabled),
      eanCode: eanCode == null && nullToAbsent
          ? const Value.absent()
          : Value(eanCode),
      frgnName: frgnName == null && nullToAbsent
          ? const Value.absent()
          : Value(frgnName),
      discount: discount == null && nullToAbsent
          ? const Value.absent()
          : Value(discount),
      imageUrl: imageUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(imageUrl),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      frgnDescription: frgnDescription == null && nullToAbsent
          ? const Value.absent()
          : Value(frgnDescription),
      sellItem: sellItem == null && nullToAbsent
          ? const Value.absent()
          : Value(sellItem),
      groupItemCode: groupItemCode == null && nullToAbsent
          ? const Value.absent()
          : Value(groupItemCode),
      categoryItemCode: categoryItemCode == null && nullToAbsent
          ? const Value.absent()
          : Value(categoryItemCode),
      waitingTime: waitingTime == null && nullToAbsent
          ? const Value.absent()
          : Value(waitingTime),
      rating:
          rating == null && nullToAbsent ? const Value.absent() : Value(rating),
    );
  }

  factory ProductEntity.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProductEntity(
      id: serializer.fromJson<int>(json['id']),
      itemCode: serializer.fromJson<String?>(json['itemCode']),
      itemName: serializer.fromJson<String>(json['itemName']),
      price: serializer.fromJson<double>(json['price']),
      available: serializer.fromJson<String>(json['available']),
      enabled: serializer.fromJson<String>(json['enabled']),
      eanCode: serializer.fromJson<String?>(json['eanCode']),
      frgnName: serializer.fromJson<String?>(json['frgnName']),
      discount: serializer.fromJson<double?>(json['discount']),
      imageUrl: serializer.fromJson<String?>(json['imageUrl']),
      description: serializer.fromJson<String?>(json['description']),
      frgnDescription: serializer.fromJson<String?>(json['frgnDescription']),
      sellItem: serializer.fromJson<String?>(json['sellItem']),
      groupItemCode: serializer.fromJson<String?>(json['groupItemCode']),
      categoryItemCode: serializer.fromJson<String?>(json['categoryItemCode']),
      waitingTime: serializer.fromJson<String?>(json['waitingTime']),
      rating: serializer.fromJson<double?>(json['rating']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'itemCode': serializer.toJson<String?>(itemCode),
      'itemName': serializer.toJson<String>(itemName),
      'price': serializer.toJson<double>(price),
      'available': serializer.toJson<String>(available),
      'enabled': serializer.toJson<String>(enabled),
      'eanCode': serializer.toJson<String?>(eanCode),
      'frgnName': serializer.toJson<String?>(frgnName),
      'discount': serializer.toJson<double?>(discount),
      'imageUrl': serializer.toJson<String?>(imageUrl),
      'description': serializer.toJson<String?>(description),
      'frgnDescription': serializer.toJson<String?>(frgnDescription),
      'sellItem': serializer.toJson<String?>(sellItem),
      'groupItemCode': serializer.toJson<String?>(groupItemCode),
      'categoryItemCode': serializer.toJson<String?>(categoryItemCode),
      'waitingTime': serializer.toJson<String?>(waitingTime),
      'rating': serializer.toJson<double?>(rating),
    };
  }

  ProductEntity copyWith(
          {int? id,
          Value<String?> itemCode = const Value.absent(),
          String? itemName,
          double? price,
          String? available,
          String? enabled,
          Value<String?> eanCode = const Value.absent(),
          Value<String?> frgnName = const Value.absent(),
          Value<double?> discount = const Value.absent(),
          Value<String?> imageUrl = const Value.absent(),
          Value<String?> description = const Value.absent(),
          Value<String?> frgnDescription = const Value.absent(),
          Value<String?> sellItem = const Value.absent(),
          Value<String?> groupItemCode = const Value.absent(),
          Value<String?> categoryItemCode = const Value.absent(),
          Value<String?> waitingTime = const Value.absent(),
          Value<double?> rating = const Value.absent()}) =>
      ProductEntity(
        id: id ?? this.id,
        itemCode: itemCode.present ? itemCode.value : this.itemCode,
        itemName: itemName ?? this.itemName,
        price: price ?? this.price,
        available: available ?? this.available,
        enabled: enabled ?? this.enabled,
        eanCode: eanCode.present ? eanCode.value : this.eanCode,
        frgnName: frgnName.present ? frgnName.value : this.frgnName,
        discount: discount.present ? discount.value : this.discount,
        imageUrl: imageUrl.present ? imageUrl.value : this.imageUrl,
        description: description.present ? description.value : this.description,
        frgnDescription: frgnDescription.present
            ? frgnDescription.value
            : this.frgnDescription,
        sellItem: sellItem.present ? sellItem.value : this.sellItem,
        groupItemCode:
            groupItemCode.present ? groupItemCode.value : this.groupItemCode,
        categoryItemCode: categoryItemCode.present
            ? categoryItemCode.value
            : this.categoryItemCode,
        waitingTime: waitingTime.present ? waitingTime.value : this.waitingTime,
        rating: rating.present ? rating.value : this.rating,
      );
  @override
  String toString() {
    return (StringBuffer('ProductEntity(')
          ..write('id: $id, ')
          ..write('itemCode: $itemCode, ')
          ..write('itemName: $itemName, ')
          ..write('price: $price, ')
          ..write('available: $available, ')
          ..write('enabled: $enabled, ')
          ..write('eanCode: $eanCode, ')
          ..write('frgnName: $frgnName, ')
          ..write('discount: $discount, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('description: $description, ')
          ..write('frgnDescription: $frgnDescription, ')
          ..write('sellItem: $sellItem, ')
          ..write('groupItemCode: $groupItemCode, ')
          ..write('categoryItemCode: $categoryItemCode, ')
          ..write('waitingTime: $waitingTime, ')
          ..write('rating: $rating')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      itemCode,
      itemName,
      price,
      available,
      enabled,
      eanCode,
      frgnName,
      discount,
      imageUrl,
      description,
      frgnDescription,
      sellItem,
      groupItemCode,
      categoryItemCode,
      waitingTime,
      rating);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProductEntity &&
          other.id == this.id &&
          other.itemCode == this.itemCode &&
          other.itemName == this.itemName &&
          other.price == this.price &&
          other.available == this.available &&
          other.enabled == this.enabled &&
          other.eanCode == this.eanCode &&
          other.frgnName == this.frgnName &&
          other.discount == this.discount &&
          other.imageUrl == this.imageUrl &&
          other.description == this.description &&
          other.frgnDescription == this.frgnDescription &&
          other.sellItem == this.sellItem &&
          other.groupItemCode == this.groupItemCode &&
          other.categoryItemCode == this.categoryItemCode &&
          other.waitingTime == this.waitingTime &&
          other.rating == this.rating);
}

class ProductsCompanion extends UpdateCompanion<ProductEntity> {
  final Value<int> id;
  final Value<String?> itemCode;
  final Value<String> itemName;
  final Value<double> price;
  final Value<String> available;
  final Value<String> enabled;
  final Value<String?> eanCode;
  final Value<String?> frgnName;
  final Value<double?> discount;
  final Value<String?> imageUrl;
  final Value<String?> description;
  final Value<String?> frgnDescription;
  final Value<String?> sellItem;
  final Value<String?> groupItemCode;
  final Value<String?> categoryItemCode;
  final Value<String?> waitingTime;
  final Value<double?> rating;
  const ProductsCompanion({
    this.id = const Value.absent(),
    this.itemCode = const Value.absent(),
    this.itemName = const Value.absent(),
    this.price = const Value.absent(),
    this.available = const Value.absent(),
    this.enabled = const Value.absent(),
    this.eanCode = const Value.absent(),
    this.frgnName = const Value.absent(),
    this.discount = const Value.absent(),
    this.imageUrl = const Value.absent(),
    this.description = const Value.absent(),
    this.frgnDescription = const Value.absent(),
    this.sellItem = const Value.absent(),
    this.groupItemCode = const Value.absent(),
    this.categoryItemCode = const Value.absent(),
    this.waitingTime = const Value.absent(),
    this.rating = const Value.absent(),
  });
  ProductsCompanion.insert({
    this.id = const Value.absent(),
    this.itemCode = const Value.absent(),
    required String itemName,
    required double price,
    required String available,
    required String enabled,
    this.eanCode = const Value.absent(),
    this.frgnName = const Value.absent(),
    this.discount = const Value.absent(),
    this.imageUrl = const Value.absent(),
    this.description = const Value.absent(),
    this.frgnDescription = const Value.absent(),
    this.sellItem = const Value.absent(),
    this.groupItemCode = const Value.absent(),
    this.categoryItemCode = const Value.absent(),
    this.waitingTime = const Value.absent(),
    this.rating = const Value.absent(),
  })  : itemName = Value(itemName),
        price = Value(price),
        available = Value(available),
        enabled = Value(enabled);
  static Insertable<ProductEntity> custom({
    Expression<int>? id,
    Expression<String>? itemCode,
    Expression<String>? itemName,
    Expression<double>? price,
    Expression<String>? available,
    Expression<String>? enabled,
    Expression<String>? eanCode,
    Expression<String>? frgnName,
    Expression<double>? discount,
    Expression<String>? imageUrl,
    Expression<String>? description,
    Expression<String>? frgnDescription,
    Expression<String>? sellItem,
    Expression<String>? groupItemCode,
    Expression<String>? categoryItemCode,
    Expression<String>? waitingTime,
    Expression<double>? rating,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (itemCode != null) 'item_code': itemCode,
      if (itemName != null) 'item_name': itemName,
      if (price != null) 'price': price,
      if (available != null) 'available': available,
      if (enabled != null) 'enabled': enabled,
      if (eanCode != null) 'ean_code': eanCode,
      if (frgnName != null) 'frgn_name': frgnName,
      if (discount != null) 'discount': discount,
      if (imageUrl != null) 'image_url': imageUrl,
      if (description != null) 'description': description,
      if (frgnDescription != null) 'frgn_description': frgnDescription,
      if (sellItem != null) 'sell_item': sellItem,
      if (groupItemCode != null) 'group_item_code': groupItemCode,
      if (categoryItemCode != null) 'category_item_code': categoryItemCode,
      if (waitingTime != null) 'waiting_time': waitingTime,
      if (rating != null) 'rating': rating,
    });
  }

  ProductsCompanion copyWith(
      {Value<int>? id,
      Value<String?>? itemCode,
      Value<String>? itemName,
      Value<double>? price,
      Value<String>? available,
      Value<String>? enabled,
      Value<String?>? eanCode,
      Value<String?>? frgnName,
      Value<double?>? discount,
      Value<String?>? imageUrl,
      Value<String?>? description,
      Value<String?>? frgnDescription,
      Value<String?>? sellItem,
      Value<String?>? groupItemCode,
      Value<String?>? categoryItemCode,
      Value<String?>? waitingTime,
      Value<double?>? rating}) {
    return ProductsCompanion(
      id: id ?? this.id,
      itemCode: itemCode ?? this.itemCode,
      itemName: itemName ?? this.itemName,
      price: price ?? this.price,
      available: available ?? this.available,
      enabled: enabled ?? this.enabled,
      eanCode: eanCode ?? this.eanCode,
      frgnName: frgnName ?? this.frgnName,
      discount: discount ?? this.discount,
      imageUrl: imageUrl ?? this.imageUrl,
      description: description ?? this.description,
      frgnDescription: frgnDescription ?? this.frgnDescription,
      sellItem: sellItem ?? this.sellItem,
      groupItemCode: groupItemCode ?? this.groupItemCode,
      categoryItemCode: categoryItemCode ?? this.categoryItemCode,
      waitingTime: waitingTime ?? this.waitingTime,
      rating: rating ?? this.rating,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (itemCode.present) {
      map['item_code'] = Variable<String>(itemCode.value);
    }
    if (itemName.present) {
      map['item_name'] = Variable<String>(itemName.value);
    }
    if (price.present) {
      map['price'] = Variable<double>(price.value);
    }
    if (available.present) {
      map['available'] = Variable<String>(available.value);
    }
    if (enabled.present) {
      map['enabled'] = Variable<String>(enabled.value);
    }
    if (eanCode.present) {
      map['ean_code'] = Variable<String>(eanCode.value);
    }
    if (frgnName.present) {
      map['frgn_name'] = Variable<String>(frgnName.value);
    }
    if (discount.present) {
      map['discount'] = Variable<double>(discount.value);
    }
    if (imageUrl.present) {
      map['image_url'] = Variable<String>(imageUrl.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (frgnDescription.present) {
      map['frgn_description'] = Variable<String>(frgnDescription.value);
    }
    if (sellItem.present) {
      map['sell_item'] = Variable<String>(sellItem.value);
    }
    if (groupItemCode.present) {
      map['group_item_code'] = Variable<String>(groupItemCode.value);
    }
    if (categoryItemCode.present) {
      map['category_item_code'] = Variable<String>(categoryItemCode.value);
    }
    if (waitingTime.present) {
      map['waiting_time'] = Variable<String>(waitingTime.value);
    }
    if (rating.present) {
      map['rating'] = Variable<double>(rating.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductsCompanion(')
          ..write('id: $id, ')
          ..write('itemCode: $itemCode, ')
          ..write('itemName: $itemName, ')
          ..write('price: $price, ')
          ..write('available: $available, ')
          ..write('enabled: $enabled, ')
          ..write('eanCode: $eanCode, ')
          ..write('frgnName: $frgnName, ')
          ..write('discount: $discount, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('description: $description, ')
          ..write('frgnDescription: $frgnDescription, ')
          ..write('sellItem: $sellItem, ')
          ..write('groupItemCode: $groupItemCode, ')
          ..write('categoryItemCode: $categoryItemCode, ')
          ..write('waitingTime: $waitingTime, ')
          ..write('rating: $rating')
          ..write(')'))
        .toString();
  }
}

class $ProductMaterialsTable extends ProductMaterials
    with TableInfo<$ProductMaterialsTable, ProductMaterialEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProductMaterialsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _itemCodeMeta =
      const VerificationMeta('itemCode');
  @override
  late final GeneratedColumn<String> itemCode = GeneratedColumn<String>(
      'item_code', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _itemNameMeta =
      const VerificationMeta('itemName');
  @override
  late final GeneratedColumn<String> itemName = GeneratedColumn<String>(
      'item_name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _quantityMeta =
      const VerificationMeta('quantity');
  @override
  late final GeneratedColumn<double> quantity = GeneratedColumn<double>(
      'quantity', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _imageUrlMeta =
      const VerificationMeta('imageUrl');
  @override
  late final GeneratedColumn<String> imageUrl = GeneratedColumn<String>(
      'image_url', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _isPrimaryMeta =
      const VerificationMeta('isPrimary');
  @override
  late final GeneratedColumn<String> isPrimary = GeneratedColumn<String>(
      'is_primary', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _productItemCodeMeta =
      const VerificationMeta('productItemCode');
  @override
  late final GeneratedColumn<String> productItemCode = GeneratedColumn<String>(
      'product_item_code', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, itemCode, itemName, quantity, imageUrl, isPrimary, productItemCode];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'product_materials';
  @override
  VerificationContext validateIntegrity(
      Insertable<ProductMaterialEntity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('item_code')) {
      context.handle(_itemCodeMeta,
          itemCode.isAcceptableOrUnknown(data['item_code']!, _itemCodeMeta));
    } else if (isInserting) {
      context.missing(_itemCodeMeta);
    }
    if (data.containsKey('item_name')) {
      context.handle(_itemNameMeta,
          itemName.isAcceptableOrUnknown(data['item_name']!, _itemNameMeta));
    }
    if (data.containsKey('quantity')) {
      context.handle(_quantityMeta,
          quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta));
    } else if (isInserting) {
      context.missing(_quantityMeta);
    }
    if (data.containsKey('image_url')) {
      context.handle(_imageUrlMeta,
          imageUrl.isAcceptableOrUnknown(data['image_url']!, _imageUrlMeta));
    }
    if (data.containsKey('is_primary')) {
      context.handle(_isPrimaryMeta,
          isPrimary.isAcceptableOrUnknown(data['is_primary']!, _isPrimaryMeta));
    }
    if (data.containsKey('product_item_code')) {
      context.handle(
          _productItemCodeMeta,
          productItemCode.isAcceptableOrUnknown(
              data['product_item_code']!, _productItemCodeMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ProductMaterialEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProductMaterialEntity(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      itemCode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}item_code'])!,
      itemName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}item_name']),
      quantity: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}quantity'])!,
      imageUrl: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image_url']),
      isPrimary: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}is_primary']),
      productItemCode: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}product_item_code']),
    );
  }

  @override
  $ProductMaterialsTable createAlias(String alias) {
    return $ProductMaterialsTable(attachedDatabase, alias);
  }
}

class ProductMaterialEntity extends DataClass
    implements Insertable<ProductMaterialEntity> {
  final int id;
  final String itemCode;
  final String? itemName;
  final double quantity;
  final String? imageUrl;
  final String? isPrimary;
  final String? productItemCode;
  const ProductMaterialEntity(
      {required this.id,
      required this.itemCode,
      this.itemName,
      required this.quantity,
      this.imageUrl,
      this.isPrimary,
      this.productItemCode});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['item_code'] = Variable<String>(itemCode);
    if (!nullToAbsent || itemName != null) {
      map['item_name'] = Variable<String>(itemName);
    }
    map['quantity'] = Variable<double>(quantity);
    if (!nullToAbsent || imageUrl != null) {
      map['image_url'] = Variable<String>(imageUrl);
    }
    if (!nullToAbsent || isPrimary != null) {
      map['is_primary'] = Variable<String>(isPrimary);
    }
    if (!nullToAbsent || productItemCode != null) {
      map['product_item_code'] = Variable<String>(productItemCode);
    }
    return map;
  }

  ProductMaterialsCompanion toCompanion(bool nullToAbsent) {
    return ProductMaterialsCompanion(
      id: Value(id),
      itemCode: Value(itemCode),
      itemName: itemName == null && nullToAbsent
          ? const Value.absent()
          : Value(itemName),
      quantity: Value(quantity),
      imageUrl: imageUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(imageUrl),
      isPrimary: isPrimary == null && nullToAbsent
          ? const Value.absent()
          : Value(isPrimary),
      productItemCode: productItemCode == null && nullToAbsent
          ? const Value.absent()
          : Value(productItemCode),
    );
  }

  factory ProductMaterialEntity.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProductMaterialEntity(
      id: serializer.fromJson<int>(json['id']),
      itemCode: serializer.fromJson<String>(json['itemCode']),
      itemName: serializer.fromJson<String?>(json['itemName']),
      quantity: serializer.fromJson<double>(json['quantity']),
      imageUrl: serializer.fromJson<String?>(json['imageUrl']),
      isPrimary: serializer.fromJson<String?>(json['isPrimary']),
      productItemCode: serializer.fromJson<String?>(json['productItemCode']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'itemCode': serializer.toJson<String>(itemCode),
      'itemName': serializer.toJson<String?>(itemName),
      'quantity': serializer.toJson<double>(quantity),
      'imageUrl': serializer.toJson<String?>(imageUrl),
      'isPrimary': serializer.toJson<String?>(isPrimary),
      'productItemCode': serializer.toJson<String?>(productItemCode),
    };
  }

  ProductMaterialEntity copyWith(
          {int? id,
          String? itemCode,
          Value<String?> itemName = const Value.absent(),
          double? quantity,
          Value<String?> imageUrl = const Value.absent(),
          Value<String?> isPrimary = const Value.absent(),
          Value<String?> productItemCode = const Value.absent()}) =>
      ProductMaterialEntity(
        id: id ?? this.id,
        itemCode: itemCode ?? this.itemCode,
        itemName: itemName.present ? itemName.value : this.itemName,
        quantity: quantity ?? this.quantity,
        imageUrl: imageUrl.present ? imageUrl.value : this.imageUrl,
        isPrimary: isPrimary.present ? isPrimary.value : this.isPrimary,
        productItemCode: productItemCode.present
            ? productItemCode.value
            : this.productItemCode,
      );
  @override
  String toString() {
    return (StringBuffer('ProductMaterialEntity(')
          ..write('id: $id, ')
          ..write('itemCode: $itemCode, ')
          ..write('itemName: $itemName, ')
          ..write('quantity: $quantity, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('isPrimary: $isPrimary, ')
          ..write('productItemCode: $productItemCode')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, itemCode, itemName, quantity, imageUrl, isPrimary, productItemCode);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProductMaterialEntity &&
          other.id == this.id &&
          other.itemCode == this.itemCode &&
          other.itemName == this.itemName &&
          other.quantity == this.quantity &&
          other.imageUrl == this.imageUrl &&
          other.isPrimary == this.isPrimary &&
          other.productItemCode == this.productItemCode);
}

class ProductMaterialsCompanion extends UpdateCompanion<ProductMaterialEntity> {
  final Value<int> id;
  final Value<String> itemCode;
  final Value<String?> itemName;
  final Value<double> quantity;
  final Value<String?> imageUrl;
  final Value<String?> isPrimary;
  final Value<String?> productItemCode;
  const ProductMaterialsCompanion({
    this.id = const Value.absent(),
    this.itemCode = const Value.absent(),
    this.itemName = const Value.absent(),
    this.quantity = const Value.absent(),
    this.imageUrl = const Value.absent(),
    this.isPrimary = const Value.absent(),
    this.productItemCode = const Value.absent(),
  });
  ProductMaterialsCompanion.insert({
    this.id = const Value.absent(),
    required String itemCode,
    this.itemName = const Value.absent(),
    required double quantity,
    this.imageUrl = const Value.absent(),
    this.isPrimary = const Value.absent(),
    this.productItemCode = const Value.absent(),
  })  : itemCode = Value(itemCode),
        quantity = Value(quantity);
  static Insertable<ProductMaterialEntity> custom({
    Expression<int>? id,
    Expression<String>? itemCode,
    Expression<String>? itemName,
    Expression<double>? quantity,
    Expression<String>? imageUrl,
    Expression<String>? isPrimary,
    Expression<String>? productItemCode,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (itemCode != null) 'item_code': itemCode,
      if (itemName != null) 'item_name': itemName,
      if (quantity != null) 'quantity': quantity,
      if (imageUrl != null) 'image_url': imageUrl,
      if (isPrimary != null) 'is_primary': isPrimary,
      if (productItemCode != null) 'product_item_code': productItemCode,
    });
  }

  ProductMaterialsCompanion copyWith(
      {Value<int>? id,
      Value<String>? itemCode,
      Value<String?>? itemName,
      Value<double>? quantity,
      Value<String?>? imageUrl,
      Value<String?>? isPrimary,
      Value<String?>? productItemCode}) {
    return ProductMaterialsCompanion(
      id: id ?? this.id,
      itemCode: itemCode ?? this.itemCode,
      itemName: itemName ?? this.itemName,
      quantity: quantity ?? this.quantity,
      imageUrl: imageUrl ?? this.imageUrl,
      isPrimary: isPrimary ?? this.isPrimary,
      productItemCode: productItemCode ?? this.productItemCode,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (itemCode.present) {
      map['item_code'] = Variable<String>(itemCode.value);
    }
    if (itemName.present) {
      map['item_name'] = Variable<String>(itemName.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<double>(quantity.value);
    }
    if (imageUrl.present) {
      map['image_url'] = Variable<String>(imageUrl.value);
    }
    if (isPrimary.present) {
      map['is_primary'] = Variable<String>(isPrimary.value);
    }
    if (productItemCode.present) {
      map['product_item_code'] = Variable<String>(productItemCode.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductMaterialsCompanion(')
          ..write('id: $id, ')
          ..write('itemCode: $itemCode, ')
          ..write('itemName: $itemName, ')
          ..write('quantity: $quantity, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('isPrimary: $isPrimary, ')
          ..write('productItemCode: $productItemCode')
          ..write(')'))
        .toString();
  }
}

class $ProductAccompanimentsTable extends ProductAccompaniments
    with TableInfo<$ProductAccompanimentsTable, ProductAccompanimentEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProductAccompanimentsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _itemCodeMeta =
      const VerificationMeta('itemCode');
  @override
  late final GeneratedColumn<String> itemCode = GeneratedColumn<String>(
      'item_code', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _itemNameMeta =
      const VerificationMeta('itemName');
  @override
  late final GeneratedColumn<String> itemName = GeneratedColumn<String>(
      'item_name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _priceOldMeta =
      const VerificationMeta('priceOld');
  @override
  late final GeneratedColumn<double> priceOld = GeneratedColumn<double>(
      'price_old', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<double> price = GeneratedColumn<double>(
      'price', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _imageUrlMeta =
      const VerificationMeta('imageUrl');
  @override
  late final GeneratedColumn<String> imageUrl = GeneratedColumn<String>(
      'image_url', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _productItemCodeMeta =
      const VerificationMeta('productItemCode');
  @override
  late final GeneratedColumn<String> productItemCode = GeneratedColumn<String>(
      'product_item_code', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, itemCode, itemName, priceOld, price, imageUrl, productItemCode];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'product_accompaniments';
  @override
  VerificationContext validateIntegrity(
      Insertable<ProductAccompanimentEntity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('item_code')) {
      context.handle(_itemCodeMeta,
          itemCode.isAcceptableOrUnknown(data['item_code']!, _itemCodeMeta));
    } else if (isInserting) {
      context.missing(_itemCodeMeta);
    }
    if (data.containsKey('item_name')) {
      context.handle(_itemNameMeta,
          itemName.isAcceptableOrUnknown(data['item_name']!, _itemNameMeta));
    }
    if (data.containsKey('price_old')) {
      context.handle(_priceOldMeta,
          priceOld.isAcceptableOrUnknown(data['price_old']!, _priceOldMeta));
    } else if (isInserting) {
      context.missing(_priceOldMeta);
    }
    if (data.containsKey('price')) {
      context.handle(
          _priceMeta, price.isAcceptableOrUnknown(data['price']!, _priceMeta));
    } else if (isInserting) {
      context.missing(_priceMeta);
    }
    if (data.containsKey('image_url')) {
      context.handle(_imageUrlMeta,
          imageUrl.isAcceptableOrUnknown(data['image_url']!, _imageUrlMeta));
    }
    if (data.containsKey('product_item_code')) {
      context.handle(
          _productItemCodeMeta,
          productItemCode.isAcceptableOrUnknown(
              data['product_item_code']!, _productItemCodeMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ProductAccompanimentEntity map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProductAccompanimentEntity(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      itemCode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}item_code'])!,
      itemName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}item_name']),
      priceOld: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}price_old'])!,
      price: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}price'])!,
      imageUrl: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image_url']),
      productItemCode: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}product_item_code']),
    );
  }

  @override
  $ProductAccompanimentsTable createAlias(String alias) {
    return $ProductAccompanimentsTable(attachedDatabase, alias);
  }
}

class ProductAccompanimentEntity extends DataClass
    implements Insertable<ProductAccompanimentEntity> {
  final int id;
  final String itemCode;
  final String? itemName;
  final double priceOld;
  final double price;
  final String? imageUrl;
  final String? productItemCode;
  const ProductAccompanimentEntity(
      {required this.id,
      required this.itemCode,
      this.itemName,
      required this.priceOld,
      required this.price,
      this.imageUrl,
      this.productItemCode});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['item_code'] = Variable<String>(itemCode);
    if (!nullToAbsent || itemName != null) {
      map['item_name'] = Variable<String>(itemName);
    }
    map['price_old'] = Variable<double>(priceOld);
    map['price'] = Variable<double>(price);
    if (!nullToAbsent || imageUrl != null) {
      map['image_url'] = Variable<String>(imageUrl);
    }
    if (!nullToAbsent || productItemCode != null) {
      map['product_item_code'] = Variable<String>(productItemCode);
    }
    return map;
  }

  ProductAccompanimentsCompanion toCompanion(bool nullToAbsent) {
    return ProductAccompanimentsCompanion(
      id: Value(id),
      itemCode: Value(itemCode),
      itemName: itemName == null && nullToAbsent
          ? const Value.absent()
          : Value(itemName),
      priceOld: Value(priceOld),
      price: Value(price),
      imageUrl: imageUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(imageUrl),
      productItemCode: productItemCode == null && nullToAbsent
          ? const Value.absent()
          : Value(productItemCode),
    );
  }

  factory ProductAccompanimentEntity.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProductAccompanimentEntity(
      id: serializer.fromJson<int>(json['id']),
      itemCode: serializer.fromJson<String>(json['itemCode']),
      itemName: serializer.fromJson<String?>(json['itemName']),
      priceOld: serializer.fromJson<double>(json['priceOld']),
      price: serializer.fromJson<double>(json['price']),
      imageUrl: serializer.fromJson<String?>(json['imageUrl']),
      productItemCode: serializer.fromJson<String?>(json['productItemCode']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'itemCode': serializer.toJson<String>(itemCode),
      'itemName': serializer.toJson<String?>(itemName),
      'priceOld': serializer.toJson<double>(priceOld),
      'price': serializer.toJson<double>(price),
      'imageUrl': serializer.toJson<String?>(imageUrl),
      'productItemCode': serializer.toJson<String?>(productItemCode),
    };
  }

  ProductAccompanimentEntity copyWith(
          {int? id,
          String? itemCode,
          Value<String?> itemName = const Value.absent(),
          double? priceOld,
          double? price,
          Value<String?> imageUrl = const Value.absent(),
          Value<String?> productItemCode = const Value.absent()}) =>
      ProductAccompanimentEntity(
        id: id ?? this.id,
        itemCode: itemCode ?? this.itemCode,
        itemName: itemName.present ? itemName.value : this.itemName,
        priceOld: priceOld ?? this.priceOld,
        price: price ?? this.price,
        imageUrl: imageUrl.present ? imageUrl.value : this.imageUrl,
        productItemCode: productItemCode.present
            ? productItemCode.value
            : this.productItemCode,
      );
  @override
  String toString() {
    return (StringBuffer('ProductAccompanimentEntity(')
          ..write('id: $id, ')
          ..write('itemCode: $itemCode, ')
          ..write('itemName: $itemName, ')
          ..write('priceOld: $priceOld, ')
          ..write('price: $price, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('productItemCode: $productItemCode')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, itemCode, itemName, priceOld, price, imageUrl, productItemCode);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProductAccompanimentEntity &&
          other.id == this.id &&
          other.itemCode == this.itemCode &&
          other.itemName == this.itemName &&
          other.priceOld == this.priceOld &&
          other.price == this.price &&
          other.imageUrl == this.imageUrl &&
          other.productItemCode == this.productItemCode);
}

class ProductAccompanimentsCompanion
    extends UpdateCompanion<ProductAccompanimentEntity> {
  final Value<int> id;
  final Value<String> itemCode;
  final Value<String?> itemName;
  final Value<double> priceOld;
  final Value<double> price;
  final Value<String?> imageUrl;
  final Value<String?> productItemCode;
  const ProductAccompanimentsCompanion({
    this.id = const Value.absent(),
    this.itemCode = const Value.absent(),
    this.itemName = const Value.absent(),
    this.priceOld = const Value.absent(),
    this.price = const Value.absent(),
    this.imageUrl = const Value.absent(),
    this.productItemCode = const Value.absent(),
  });
  ProductAccompanimentsCompanion.insert({
    this.id = const Value.absent(),
    required String itemCode,
    this.itemName = const Value.absent(),
    required double priceOld,
    required double price,
    this.imageUrl = const Value.absent(),
    this.productItemCode = const Value.absent(),
  })  : itemCode = Value(itemCode),
        priceOld = Value(priceOld),
        price = Value(price);
  static Insertable<ProductAccompanimentEntity> custom({
    Expression<int>? id,
    Expression<String>? itemCode,
    Expression<String>? itemName,
    Expression<double>? priceOld,
    Expression<double>? price,
    Expression<String>? imageUrl,
    Expression<String>? productItemCode,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (itemCode != null) 'item_code': itemCode,
      if (itemName != null) 'item_name': itemName,
      if (priceOld != null) 'price_old': priceOld,
      if (price != null) 'price': price,
      if (imageUrl != null) 'image_url': imageUrl,
      if (productItemCode != null) 'product_item_code': productItemCode,
    });
  }

  ProductAccompanimentsCompanion copyWith(
      {Value<int>? id,
      Value<String>? itemCode,
      Value<String?>? itemName,
      Value<double>? priceOld,
      Value<double>? price,
      Value<String?>? imageUrl,
      Value<String?>? productItemCode}) {
    return ProductAccompanimentsCompanion(
      id: id ?? this.id,
      itemCode: itemCode ?? this.itemCode,
      itemName: itemName ?? this.itemName,
      priceOld: priceOld ?? this.priceOld,
      price: price ?? this.price,
      imageUrl: imageUrl ?? this.imageUrl,
      productItemCode: productItemCode ?? this.productItemCode,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (itemCode.present) {
      map['item_code'] = Variable<String>(itemCode.value);
    }
    if (itemName.present) {
      map['item_name'] = Variable<String>(itemName.value);
    }
    if (priceOld.present) {
      map['price_old'] = Variable<double>(priceOld.value);
    }
    if (price.present) {
      map['price'] = Variable<double>(price.value);
    }
    if (imageUrl.present) {
      map['image_url'] = Variable<String>(imageUrl.value);
    }
    if (productItemCode.present) {
      map['product_item_code'] = Variable<String>(productItemCode.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductAccompanimentsCompanion(')
          ..write('id: $id, ')
          ..write('itemCode: $itemCode, ')
          ..write('itemName: $itemName, ')
          ..write('priceOld: $priceOld, ')
          ..write('price: $price, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('productItemCode: $productItemCode')
          ..write(')'))
        .toString();
  }
}

class $ProductCategoriesTable extends ProductCategories
    with TableInfo<$ProductCategoriesTable, ProductCategoryEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProductCategoriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _categoryItemCodeMeta =
      const VerificationMeta('categoryItemCode');
  @override
  late final GeneratedColumn<String> categoryItemCode = GeneratedColumn<String>(
      'category_item_code', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _categoryItemNameMeta =
      const VerificationMeta('categoryItemName');
  @override
  late final GeneratedColumn<String> categoryItemName = GeneratedColumn<String>(
      'category_item_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _enabledMeta =
      const VerificationMeta('enabled');
  @override
  late final GeneratedColumn<String> enabled = GeneratedColumn<String>(
      'enabled', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _dataSourceMeta =
      const VerificationMeta('dataSource');
  @override
  late final GeneratedColumn<String> dataSource = GeneratedColumn<String>(
      'data_source', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _visOrderMeta =
      const VerificationMeta('visOrder');
  @override
  late final GeneratedColumn<int> visOrder = GeneratedColumn<int>(
      'vis_order', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _frgnNameMeta =
      const VerificationMeta('frgnName');
  @override
  late final GeneratedColumn<String> frgnName = GeneratedColumn<String>(
      'frgn_name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _imageUrlMeta =
      const VerificationMeta('imageUrl');
  @override
  late final GeneratedColumn<String> imageUrl = GeneratedColumn<String>(
      'image_url', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _frgnDescriptionMeta =
      const VerificationMeta('frgnDescription');
  @override
  late final GeneratedColumn<String> frgnDescription = GeneratedColumn<String>(
      'frgn_description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _groupItemCodeMeta =
      const VerificationMeta('groupItemCode');
  @override
  late final GeneratedColumn<String> groupItemCode = GeneratedColumn<String>(
      'group_item_code', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        categoryItemCode,
        categoryItemName,
        enabled,
        dataSource,
        visOrder,
        frgnName,
        imageUrl,
        description,
        frgnDescription,
        groupItemCode
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'product_categories';
  @override
  VerificationContext validateIntegrity(
      Insertable<ProductCategoryEntity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('category_item_code')) {
      context.handle(
          _categoryItemCodeMeta,
          categoryItemCode.isAcceptableOrUnknown(
              data['category_item_code']!, _categoryItemCodeMeta));
    } else if (isInserting) {
      context.missing(_categoryItemCodeMeta);
    }
    if (data.containsKey('category_item_name')) {
      context.handle(
          _categoryItemNameMeta,
          categoryItemName.isAcceptableOrUnknown(
              data['category_item_name']!, _categoryItemNameMeta));
    } else if (isInserting) {
      context.missing(_categoryItemNameMeta);
    }
    if (data.containsKey('enabled')) {
      context.handle(_enabledMeta,
          enabled.isAcceptableOrUnknown(data['enabled']!, _enabledMeta));
    } else if (isInserting) {
      context.missing(_enabledMeta);
    }
    if (data.containsKey('data_source')) {
      context.handle(
          _dataSourceMeta,
          dataSource.isAcceptableOrUnknown(
              data['data_source']!, _dataSourceMeta));
    } else if (isInserting) {
      context.missing(_dataSourceMeta);
    }
    if (data.containsKey('vis_order')) {
      context.handle(_visOrderMeta,
          visOrder.isAcceptableOrUnknown(data['vis_order']!, _visOrderMeta));
    } else if (isInserting) {
      context.missing(_visOrderMeta);
    }
    if (data.containsKey('frgn_name')) {
      context.handle(_frgnNameMeta,
          frgnName.isAcceptableOrUnknown(data['frgn_name']!, _frgnNameMeta));
    }
    if (data.containsKey('image_url')) {
      context.handle(_imageUrlMeta,
          imageUrl.isAcceptableOrUnknown(data['image_url']!, _imageUrlMeta));
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('frgn_description')) {
      context.handle(
          _frgnDescriptionMeta,
          frgnDescription.isAcceptableOrUnknown(
              data['frgn_description']!, _frgnDescriptionMeta));
    }
    if (data.containsKey('group_item_code')) {
      context.handle(
          _groupItemCodeMeta,
          groupItemCode.isAcceptableOrUnknown(
              data['group_item_code']!, _groupItemCodeMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ProductCategoryEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProductCategoryEntity(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      categoryItemCode: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}category_item_code'])!,
      categoryItemName: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}category_item_name'])!,
      enabled: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}enabled'])!,
      dataSource: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}data_source'])!,
      visOrder: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}vis_order'])!,
      frgnName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}frgn_name']),
      imageUrl: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image_url']),
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      frgnDescription: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}frgn_description']),
      groupItemCode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}group_item_code']),
    );
  }

  @override
  $ProductCategoriesTable createAlias(String alias) {
    return $ProductCategoriesTable(attachedDatabase, alias);
  }
}

class ProductCategoryEntity extends DataClass
    implements Insertable<ProductCategoryEntity> {
  final int id;
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
  const ProductCategoryEntity(
      {required this.id,
      required this.categoryItemCode,
      required this.categoryItemName,
      required this.enabled,
      required this.dataSource,
      required this.visOrder,
      this.frgnName,
      this.imageUrl,
      this.description,
      this.frgnDescription,
      this.groupItemCode});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['category_item_code'] = Variable<String>(categoryItemCode);
    map['category_item_name'] = Variable<String>(categoryItemName);
    map['enabled'] = Variable<String>(enabled);
    map['data_source'] = Variable<String>(dataSource);
    map['vis_order'] = Variable<int>(visOrder);
    if (!nullToAbsent || frgnName != null) {
      map['frgn_name'] = Variable<String>(frgnName);
    }
    if (!nullToAbsent || imageUrl != null) {
      map['image_url'] = Variable<String>(imageUrl);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || frgnDescription != null) {
      map['frgn_description'] = Variable<String>(frgnDescription);
    }
    if (!nullToAbsent || groupItemCode != null) {
      map['group_item_code'] = Variable<String>(groupItemCode);
    }
    return map;
  }

  ProductCategoriesCompanion toCompanion(bool nullToAbsent) {
    return ProductCategoriesCompanion(
      id: Value(id),
      categoryItemCode: Value(categoryItemCode),
      categoryItemName: Value(categoryItemName),
      enabled: Value(enabled),
      dataSource: Value(dataSource),
      visOrder: Value(visOrder),
      frgnName: frgnName == null && nullToAbsent
          ? const Value.absent()
          : Value(frgnName),
      imageUrl: imageUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(imageUrl),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      frgnDescription: frgnDescription == null && nullToAbsent
          ? const Value.absent()
          : Value(frgnDescription),
      groupItemCode: groupItemCode == null && nullToAbsent
          ? const Value.absent()
          : Value(groupItemCode),
    );
  }

  factory ProductCategoryEntity.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProductCategoryEntity(
      id: serializer.fromJson<int>(json['id']),
      categoryItemCode: serializer.fromJson<String>(json['categoryItemCode']),
      categoryItemName: serializer.fromJson<String>(json['categoryItemName']),
      enabled: serializer.fromJson<String>(json['enabled']),
      dataSource: serializer.fromJson<String>(json['dataSource']),
      visOrder: serializer.fromJson<int>(json['visOrder']),
      frgnName: serializer.fromJson<String?>(json['frgnName']),
      imageUrl: serializer.fromJson<String?>(json['imageUrl']),
      description: serializer.fromJson<String?>(json['description']),
      frgnDescription: serializer.fromJson<String?>(json['frgnDescription']),
      groupItemCode: serializer.fromJson<String?>(json['groupItemCode']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'categoryItemCode': serializer.toJson<String>(categoryItemCode),
      'categoryItemName': serializer.toJson<String>(categoryItemName),
      'enabled': serializer.toJson<String>(enabled),
      'dataSource': serializer.toJson<String>(dataSource),
      'visOrder': serializer.toJson<int>(visOrder),
      'frgnName': serializer.toJson<String?>(frgnName),
      'imageUrl': serializer.toJson<String?>(imageUrl),
      'description': serializer.toJson<String?>(description),
      'frgnDescription': serializer.toJson<String?>(frgnDescription),
      'groupItemCode': serializer.toJson<String?>(groupItemCode),
    };
  }

  ProductCategoryEntity copyWith(
          {int? id,
          String? categoryItemCode,
          String? categoryItemName,
          String? enabled,
          String? dataSource,
          int? visOrder,
          Value<String?> frgnName = const Value.absent(),
          Value<String?> imageUrl = const Value.absent(),
          Value<String?> description = const Value.absent(),
          Value<String?> frgnDescription = const Value.absent(),
          Value<String?> groupItemCode = const Value.absent()}) =>
      ProductCategoryEntity(
        id: id ?? this.id,
        categoryItemCode: categoryItemCode ?? this.categoryItemCode,
        categoryItemName: categoryItemName ?? this.categoryItemName,
        enabled: enabled ?? this.enabled,
        dataSource: dataSource ?? this.dataSource,
        visOrder: visOrder ?? this.visOrder,
        frgnName: frgnName.present ? frgnName.value : this.frgnName,
        imageUrl: imageUrl.present ? imageUrl.value : this.imageUrl,
        description: description.present ? description.value : this.description,
        frgnDescription: frgnDescription.present
            ? frgnDescription.value
            : this.frgnDescription,
        groupItemCode:
            groupItemCode.present ? groupItemCode.value : this.groupItemCode,
      );
  @override
  String toString() {
    return (StringBuffer('ProductCategoryEntity(')
          ..write('id: $id, ')
          ..write('categoryItemCode: $categoryItemCode, ')
          ..write('categoryItemName: $categoryItemName, ')
          ..write('enabled: $enabled, ')
          ..write('dataSource: $dataSource, ')
          ..write('visOrder: $visOrder, ')
          ..write('frgnName: $frgnName, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('description: $description, ')
          ..write('frgnDescription: $frgnDescription, ')
          ..write('groupItemCode: $groupItemCode')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      categoryItemCode,
      categoryItemName,
      enabled,
      dataSource,
      visOrder,
      frgnName,
      imageUrl,
      description,
      frgnDescription,
      groupItemCode);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProductCategoryEntity &&
          other.id == this.id &&
          other.categoryItemCode == this.categoryItemCode &&
          other.categoryItemName == this.categoryItemName &&
          other.enabled == this.enabled &&
          other.dataSource == this.dataSource &&
          other.visOrder == this.visOrder &&
          other.frgnName == this.frgnName &&
          other.imageUrl == this.imageUrl &&
          other.description == this.description &&
          other.frgnDescription == this.frgnDescription &&
          other.groupItemCode == this.groupItemCode);
}

class ProductCategoriesCompanion
    extends UpdateCompanion<ProductCategoryEntity> {
  final Value<int> id;
  final Value<String> categoryItemCode;
  final Value<String> categoryItemName;
  final Value<String> enabled;
  final Value<String> dataSource;
  final Value<int> visOrder;
  final Value<String?> frgnName;
  final Value<String?> imageUrl;
  final Value<String?> description;
  final Value<String?> frgnDescription;
  final Value<String?> groupItemCode;
  const ProductCategoriesCompanion({
    this.id = const Value.absent(),
    this.categoryItemCode = const Value.absent(),
    this.categoryItemName = const Value.absent(),
    this.enabled = const Value.absent(),
    this.dataSource = const Value.absent(),
    this.visOrder = const Value.absent(),
    this.frgnName = const Value.absent(),
    this.imageUrl = const Value.absent(),
    this.description = const Value.absent(),
    this.frgnDescription = const Value.absent(),
    this.groupItemCode = const Value.absent(),
  });
  ProductCategoriesCompanion.insert({
    this.id = const Value.absent(),
    required String categoryItemCode,
    required String categoryItemName,
    required String enabled,
    required String dataSource,
    required int visOrder,
    this.frgnName = const Value.absent(),
    this.imageUrl = const Value.absent(),
    this.description = const Value.absent(),
    this.frgnDescription = const Value.absent(),
    this.groupItemCode = const Value.absent(),
  })  : categoryItemCode = Value(categoryItemCode),
        categoryItemName = Value(categoryItemName),
        enabled = Value(enabled),
        dataSource = Value(dataSource),
        visOrder = Value(visOrder);
  static Insertable<ProductCategoryEntity> custom({
    Expression<int>? id,
    Expression<String>? categoryItemCode,
    Expression<String>? categoryItemName,
    Expression<String>? enabled,
    Expression<String>? dataSource,
    Expression<int>? visOrder,
    Expression<String>? frgnName,
    Expression<String>? imageUrl,
    Expression<String>? description,
    Expression<String>? frgnDescription,
    Expression<String>? groupItemCode,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (categoryItemCode != null) 'category_item_code': categoryItemCode,
      if (categoryItemName != null) 'category_item_name': categoryItemName,
      if (enabled != null) 'enabled': enabled,
      if (dataSource != null) 'data_source': dataSource,
      if (visOrder != null) 'vis_order': visOrder,
      if (frgnName != null) 'frgn_name': frgnName,
      if (imageUrl != null) 'image_url': imageUrl,
      if (description != null) 'description': description,
      if (frgnDescription != null) 'frgn_description': frgnDescription,
      if (groupItemCode != null) 'group_item_code': groupItemCode,
    });
  }

  ProductCategoriesCompanion copyWith(
      {Value<int>? id,
      Value<String>? categoryItemCode,
      Value<String>? categoryItemName,
      Value<String>? enabled,
      Value<String>? dataSource,
      Value<int>? visOrder,
      Value<String?>? frgnName,
      Value<String?>? imageUrl,
      Value<String?>? description,
      Value<String?>? frgnDescription,
      Value<String?>? groupItemCode}) {
    return ProductCategoriesCompanion(
      id: id ?? this.id,
      categoryItemCode: categoryItemCode ?? this.categoryItemCode,
      categoryItemName: categoryItemName ?? this.categoryItemName,
      enabled: enabled ?? this.enabled,
      dataSource: dataSource ?? this.dataSource,
      visOrder: visOrder ?? this.visOrder,
      frgnName: frgnName ?? this.frgnName,
      imageUrl: imageUrl ?? this.imageUrl,
      description: description ?? this.description,
      frgnDescription: frgnDescription ?? this.frgnDescription,
      groupItemCode: groupItemCode ?? this.groupItemCode,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (categoryItemCode.present) {
      map['category_item_code'] = Variable<String>(categoryItemCode.value);
    }
    if (categoryItemName.present) {
      map['category_item_name'] = Variable<String>(categoryItemName.value);
    }
    if (enabled.present) {
      map['enabled'] = Variable<String>(enabled.value);
    }
    if (dataSource.present) {
      map['data_source'] = Variable<String>(dataSource.value);
    }
    if (visOrder.present) {
      map['vis_order'] = Variable<int>(visOrder.value);
    }
    if (frgnName.present) {
      map['frgn_name'] = Variable<String>(frgnName.value);
    }
    if (imageUrl.present) {
      map['image_url'] = Variable<String>(imageUrl.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (frgnDescription.present) {
      map['frgn_description'] = Variable<String>(frgnDescription.value);
    }
    if (groupItemCode.present) {
      map['group_item_code'] = Variable<String>(groupItemCode.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductCategoriesCompanion(')
          ..write('id: $id, ')
          ..write('categoryItemCode: $categoryItemCode, ')
          ..write('categoryItemName: $categoryItemName, ')
          ..write('enabled: $enabled, ')
          ..write('dataSource: $dataSource, ')
          ..write('visOrder: $visOrder, ')
          ..write('frgnName: $frgnName, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('description: $description, ')
          ..write('frgnDescription: $frgnDescription, ')
          ..write('groupItemCode: $groupItemCode')
          ..write(')'))
        .toString();
  }
}

class $ProductMaterialRelationsTable extends ProductMaterialRelations
    with TableInfo<$ProductMaterialRelationsTable, ProductMaterialRelation> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProductMaterialRelationsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _productIdMeta =
      const VerificationMeta('productId');
  @override
  late final GeneratedColumn<int> productId = GeneratedColumn<int>(
      'product_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES products (id)'));
  static const VerificationMeta _materialIdMeta =
      const VerificationMeta('materialId');
  @override
  late final GeneratedColumn<int> materialId = GeneratedColumn<int>(
      'material_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES product_materials (id)'));
  @override
  List<GeneratedColumn> get $columns => [productId, materialId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'product_material_relations';
  @override
  VerificationContext validateIntegrity(
      Insertable<ProductMaterialRelation> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('product_id')) {
      context.handle(_productIdMeta,
          productId.isAcceptableOrUnknown(data['product_id']!, _productIdMeta));
    } else if (isInserting) {
      context.missing(_productIdMeta);
    }
    if (data.containsKey('material_id')) {
      context.handle(
          _materialIdMeta,
          materialId.isAcceptableOrUnknown(
              data['material_id']!, _materialIdMeta));
    } else if (isInserting) {
      context.missing(_materialIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {productId, materialId};
  @override
  ProductMaterialRelation map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProductMaterialRelation(
      productId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}product_id'])!,
      materialId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}material_id'])!,
    );
  }

  @override
  $ProductMaterialRelationsTable createAlias(String alias) {
    return $ProductMaterialRelationsTable(attachedDatabase, alias);
  }
}

class ProductMaterialRelation extends DataClass
    implements Insertable<ProductMaterialRelation> {
  final int productId;
  final int materialId;
  const ProductMaterialRelation(
      {required this.productId, required this.materialId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['product_id'] = Variable<int>(productId);
    map['material_id'] = Variable<int>(materialId);
    return map;
  }

  ProductMaterialRelationsCompanion toCompanion(bool nullToAbsent) {
    return ProductMaterialRelationsCompanion(
      productId: Value(productId),
      materialId: Value(materialId),
    );
  }

  factory ProductMaterialRelation.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProductMaterialRelation(
      productId: serializer.fromJson<int>(json['productId']),
      materialId: serializer.fromJson<int>(json['materialId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'productId': serializer.toJson<int>(productId),
      'materialId': serializer.toJson<int>(materialId),
    };
  }

  ProductMaterialRelation copyWith({int? productId, int? materialId}) =>
      ProductMaterialRelation(
        productId: productId ?? this.productId,
        materialId: materialId ?? this.materialId,
      );
  @override
  String toString() {
    return (StringBuffer('ProductMaterialRelation(')
          ..write('productId: $productId, ')
          ..write('materialId: $materialId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(productId, materialId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProductMaterialRelation &&
          other.productId == this.productId &&
          other.materialId == this.materialId);
}

class ProductMaterialRelationsCompanion
    extends UpdateCompanion<ProductMaterialRelation> {
  final Value<int> productId;
  final Value<int> materialId;
  final Value<int> rowid;
  const ProductMaterialRelationsCompanion({
    this.productId = const Value.absent(),
    this.materialId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ProductMaterialRelationsCompanion.insert({
    required int productId,
    required int materialId,
    this.rowid = const Value.absent(),
  })  : productId = Value(productId),
        materialId = Value(materialId);
  static Insertable<ProductMaterialRelation> custom({
    Expression<int>? productId,
    Expression<int>? materialId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (productId != null) 'product_id': productId,
      if (materialId != null) 'material_id': materialId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ProductMaterialRelationsCompanion copyWith(
      {Value<int>? productId, Value<int>? materialId, Value<int>? rowid}) {
    return ProductMaterialRelationsCompanion(
      productId: productId ?? this.productId,
      materialId: materialId ?? this.materialId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (productId.present) {
      map['product_id'] = Variable<int>(productId.value);
    }
    if (materialId.present) {
      map['material_id'] = Variable<int>(materialId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductMaterialRelationsCompanion(')
          ..write('productId: $productId, ')
          ..write('materialId: $materialId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ProductAccompanimentRelationsTable extends ProductAccompanimentRelations
    with
        TableInfo<$ProductAccompanimentRelationsTable,
            ProductAccompanimentRelation> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProductAccompanimentRelationsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _productIdMeta =
      const VerificationMeta('productId');
  @override
  late final GeneratedColumn<int> productId = GeneratedColumn<int>(
      'product_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES products (id)'));
  static const VerificationMeta _accompanimentIdMeta =
      const VerificationMeta('accompanimentId');
  @override
  late final GeneratedColumn<int> accompanimentId = GeneratedColumn<int>(
      'accompaniment_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES product_accompaniments (id)'));
  @override
  List<GeneratedColumn> get $columns => [productId, accompanimentId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'product_accompaniment_relations';
  @override
  VerificationContext validateIntegrity(
      Insertable<ProductAccompanimentRelation> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('product_id')) {
      context.handle(_productIdMeta,
          productId.isAcceptableOrUnknown(data['product_id']!, _productIdMeta));
    } else if (isInserting) {
      context.missing(_productIdMeta);
    }
    if (data.containsKey('accompaniment_id')) {
      context.handle(
          _accompanimentIdMeta,
          accompanimentId.isAcceptableOrUnknown(
              data['accompaniment_id']!, _accompanimentIdMeta));
    } else if (isInserting) {
      context.missing(_accompanimentIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {productId, accompanimentId};
  @override
  ProductAccompanimentRelation map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProductAccompanimentRelation(
      productId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}product_id'])!,
      accompanimentId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}accompaniment_id'])!,
    );
  }

  @override
  $ProductAccompanimentRelationsTable createAlias(String alias) {
    return $ProductAccompanimentRelationsTable(attachedDatabase, alias);
  }
}

class ProductAccompanimentRelation extends DataClass
    implements Insertable<ProductAccompanimentRelation> {
  final int productId;
  final int accompanimentId;
  const ProductAccompanimentRelation(
      {required this.productId, required this.accompanimentId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['product_id'] = Variable<int>(productId);
    map['accompaniment_id'] = Variable<int>(accompanimentId);
    return map;
  }

  ProductAccompanimentRelationsCompanion toCompanion(bool nullToAbsent) {
    return ProductAccompanimentRelationsCompanion(
      productId: Value(productId),
      accompanimentId: Value(accompanimentId),
    );
  }

  factory ProductAccompanimentRelation.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProductAccompanimentRelation(
      productId: serializer.fromJson<int>(json['productId']),
      accompanimentId: serializer.fromJson<int>(json['accompanimentId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'productId': serializer.toJson<int>(productId),
      'accompanimentId': serializer.toJson<int>(accompanimentId),
    };
  }

  ProductAccompanimentRelation copyWith(
          {int? productId, int? accompanimentId}) =>
      ProductAccompanimentRelation(
        productId: productId ?? this.productId,
        accompanimentId: accompanimentId ?? this.accompanimentId,
      );
  @override
  String toString() {
    return (StringBuffer('ProductAccompanimentRelation(')
          ..write('productId: $productId, ')
          ..write('accompanimentId: $accompanimentId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(productId, accompanimentId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProductAccompanimentRelation &&
          other.productId == this.productId &&
          other.accompanimentId == this.accompanimentId);
}

class ProductAccompanimentRelationsCompanion
    extends UpdateCompanion<ProductAccompanimentRelation> {
  final Value<int> productId;
  final Value<int> accompanimentId;
  final Value<int> rowid;
  const ProductAccompanimentRelationsCompanion({
    this.productId = const Value.absent(),
    this.accompanimentId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ProductAccompanimentRelationsCompanion.insert({
    required int productId,
    required int accompanimentId,
    this.rowid = const Value.absent(),
  })  : productId = Value(productId),
        accompanimentId = Value(accompanimentId);
  static Insertable<ProductAccompanimentRelation> custom({
    Expression<int>? productId,
    Expression<int>? accompanimentId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (productId != null) 'product_id': productId,
      if (accompanimentId != null) 'accompaniment_id': accompanimentId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ProductAccompanimentRelationsCompanion copyWith(
      {Value<int>? productId, Value<int>? accompanimentId, Value<int>? rowid}) {
    return ProductAccompanimentRelationsCompanion(
      productId: productId ?? this.productId,
      accompanimentId: accompanimentId ?? this.accompanimentId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (productId.present) {
      map['product_id'] = Variable<int>(productId.value);
    }
    if (accompanimentId.present) {
      map['accompaniment_id'] = Variable<int>(accompanimentId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductAccompanimentRelationsCompanion(')
          ..write('productId: $productId, ')
          ..write('accompanimentId: $accompanimentId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  late final $ProductsTable products = $ProductsTable(this);
  late final $ProductMaterialsTable productMaterials =
      $ProductMaterialsTable(this);
  late final $ProductAccompanimentsTable productAccompaniments =
      $ProductAccompanimentsTable(this);
  late final $ProductCategoriesTable productCategories =
      $ProductCategoriesTable(this);
  late final $ProductMaterialRelationsTable productMaterialRelations =
      $ProductMaterialRelationsTable(this);
  late final $ProductAccompanimentRelationsTable productAccompanimentRelations =
      $ProductAccompanimentRelationsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        products,
        productMaterials,
        productAccompaniments,
        productCategories,
        productMaterialRelations,
        productAccompanimentRelations
      ];
}
