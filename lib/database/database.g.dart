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
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _itemCodeMeta = const VerificationMeta(
    'itemCode',
  );
  @override
  late final GeneratedColumn<String> itemCode = GeneratedColumn<String>(
    'item_code',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _itemNameMeta = const VerificationMeta(
    'itemName',
  );
  @override
  late final GeneratedColumn<String> itemName = GeneratedColumn<String>(
    'item_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<double> price = GeneratedColumn<double>(
    'price',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _availableMeta = const VerificationMeta(
    'available',
  );
  @override
  late final GeneratedColumn<String> available = GeneratedColumn<String>(
    'available',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _enabledMeta = const VerificationMeta(
    'enabled',
  );
  @override
  late final GeneratedColumn<String> enabled = GeneratedColumn<String>(
    'enabled',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _eanCodeMeta = const VerificationMeta(
    'eanCode',
  );
  @override
  late final GeneratedColumn<String> eanCode = GeneratedColumn<String>(
    'ean_code',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _frgnNameMeta = const VerificationMeta(
    'frgnName',
  );
  @override
  late final GeneratedColumn<String> frgnName = GeneratedColumn<String>(
    'frgn_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _discountMeta = const VerificationMeta(
    'discount',
  );
  @override
  late final GeneratedColumn<double> discount = GeneratedColumn<double>(
    'discount',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _imageUrlMeta = const VerificationMeta(
    'imageUrl',
  );
  @override
  late final GeneratedColumn<String> imageUrl = GeneratedColumn<String>(
    'image_url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _frgnDescriptionMeta = const VerificationMeta(
    'frgnDescription',
  );
  @override
  late final GeneratedColumn<String> frgnDescription = GeneratedColumn<String>(
    'frgn_description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _sellItemMeta = const VerificationMeta(
    'sellItem',
  );
  @override
  late final GeneratedColumn<String> sellItem = GeneratedColumn<String>(
    'sell_item',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _groupItemCodeMeta = const VerificationMeta(
    'groupItemCode',
  );
  @override
  late final GeneratedColumn<String> groupItemCode = GeneratedColumn<String>(
    'group_item_code',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _categoryItemCodeMeta = const VerificationMeta(
    'categoryItemCode',
  );
  @override
  late final GeneratedColumn<String> categoryItemCode = GeneratedColumn<String>(
    'category_item_code',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _waitingTimeMeta = const VerificationMeta(
    'waitingTime',
  );
  @override
  late final GeneratedColumn<String> waitingTime = GeneratedColumn<String>(
    'waiting_time',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _ratingMeta = const VerificationMeta('rating');
  @override
  late final GeneratedColumn<double> rating = GeneratedColumn<double>(
    'rating',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
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
    rating,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'products';
  @override
  VerificationContext validateIntegrity(
    Insertable<ProductEntity> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('item_code')) {
      context.handle(
        _itemCodeMeta,
        itemCode.isAcceptableOrUnknown(data['item_code']!, _itemCodeMeta),
      );
    }
    if (data.containsKey('item_name')) {
      context.handle(
        _itemNameMeta,
        itemName.isAcceptableOrUnknown(data['item_name']!, _itemNameMeta),
      );
    } else if (isInserting) {
      context.missing(_itemNameMeta);
    }
    if (data.containsKey('price')) {
      context.handle(
        _priceMeta,
        price.isAcceptableOrUnknown(data['price']!, _priceMeta),
      );
    } else if (isInserting) {
      context.missing(_priceMeta);
    }
    if (data.containsKey('available')) {
      context.handle(
        _availableMeta,
        available.isAcceptableOrUnknown(data['available']!, _availableMeta),
      );
    } else if (isInserting) {
      context.missing(_availableMeta);
    }
    if (data.containsKey('enabled')) {
      context.handle(
        _enabledMeta,
        enabled.isAcceptableOrUnknown(data['enabled']!, _enabledMeta),
      );
    } else if (isInserting) {
      context.missing(_enabledMeta);
    }
    if (data.containsKey('ean_code')) {
      context.handle(
        _eanCodeMeta,
        eanCode.isAcceptableOrUnknown(data['ean_code']!, _eanCodeMeta),
      );
    }
    if (data.containsKey('frgn_name')) {
      context.handle(
        _frgnNameMeta,
        frgnName.isAcceptableOrUnknown(data['frgn_name']!, _frgnNameMeta),
      );
    }
    if (data.containsKey('discount')) {
      context.handle(
        _discountMeta,
        discount.isAcceptableOrUnknown(data['discount']!, _discountMeta),
      );
    }
    if (data.containsKey('image_url')) {
      context.handle(
        _imageUrlMeta,
        imageUrl.isAcceptableOrUnknown(data['image_url']!, _imageUrlMeta),
      );
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('frgn_description')) {
      context.handle(
        _frgnDescriptionMeta,
        frgnDescription.isAcceptableOrUnknown(
          data['frgn_description']!,
          _frgnDescriptionMeta,
        ),
      );
    }
    if (data.containsKey('sell_item')) {
      context.handle(
        _sellItemMeta,
        sellItem.isAcceptableOrUnknown(data['sell_item']!, _sellItemMeta),
      );
    }
    if (data.containsKey('group_item_code')) {
      context.handle(
        _groupItemCodeMeta,
        groupItemCode.isAcceptableOrUnknown(
          data['group_item_code']!,
          _groupItemCodeMeta,
        ),
      );
    }
    if (data.containsKey('category_item_code')) {
      context.handle(
        _categoryItemCodeMeta,
        categoryItemCode.isAcceptableOrUnknown(
          data['category_item_code']!,
          _categoryItemCodeMeta,
        ),
      );
    }
    if (data.containsKey('waiting_time')) {
      context.handle(
        _waitingTimeMeta,
        waitingTime.isAcceptableOrUnknown(
          data['waiting_time']!,
          _waitingTimeMeta,
        ),
      );
    }
    if (data.containsKey('rating')) {
      context.handle(
        _ratingMeta,
        rating.isAcceptableOrUnknown(data['rating']!, _ratingMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ProductEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProductEntity(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      itemCode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}item_code'],
      ),
      itemName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}item_name'],
      )!,
      price: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}price'],
      )!,
      available: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}available'],
      )!,
      enabled: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}enabled'],
      )!,
      eanCode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}ean_code'],
      ),
      frgnName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}frgn_name'],
      ),
      discount: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}discount'],
      ),
      imageUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}image_url'],
      ),
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      frgnDescription: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}frgn_description'],
      ),
      sellItem: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sell_item'],
      ),
      groupItemCode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}group_item_code'],
      ),
      categoryItemCode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category_item_code'],
      ),
      waitingTime: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}waiting_time'],
      ),
      rating: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}rating'],
      ),
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
  const ProductEntity({
    required this.id,
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
  });
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
      rating: rating == null && nullToAbsent
          ? const Value.absent()
          : Value(rating),
    );
  }

  factory ProductEntity.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
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

  ProductEntity copyWith({
    int? id,
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
    Value<double?> rating = const Value.absent(),
  }) => ProductEntity(
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
    groupItemCode: groupItemCode.present
        ? groupItemCode.value
        : this.groupItemCode,
    categoryItemCode: categoryItemCode.present
        ? categoryItemCode.value
        : this.categoryItemCode,
    waitingTime: waitingTime.present ? waitingTime.value : this.waitingTime,
    rating: rating.present ? rating.value : this.rating,
  );
  ProductEntity copyWithCompanion(ProductsCompanion data) {
    return ProductEntity(
      id: data.id.present ? data.id.value : this.id,
      itemCode: data.itemCode.present ? data.itemCode.value : this.itemCode,
      itemName: data.itemName.present ? data.itemName.value : this.itemName,
      price: data.price.present ? data.price.value : this.price,
      available: data.available.present ? data.available.value : this.available,
      enabled: data.enabled.present ? data.enabled.value : this.enabled,
      eanCode: data.eanCode.present ? data.eanCode.value : this.eanCode,
      frgnName: data.frgnName.present ? data.frgnName.value : this.frgnName,
      discount: data.discount.present ? data.discount.value : this.discount,
      imageUrl: data.imageUrl.present ? data.imageUrl.value : this.imageUrl,
      description: data.description.present
          ? data.description.value
          : this.description,
      frgnDescription: data.frgnDescription.present
          ? data.frgnDescription.value
          : this.frgnDescription,
      sellItem: data.sellItem.present ? data.sellItem.value : this.sellItem,
      groupItemCode: data.groupItemCode.present
          ? data.groupItemCode.value
          : this.groupItemCode,
      categoryItemCode: data.categoryItemCode.present
          ? data.categoryItemCode.value
          : this.categoryItemCode,
      waitingTime: data.waitingTime.present
          ? data.waitingTime.value
          : this.waitingTime,
      rating: data.rating.present ? data.rating.value : this.rating,
    );
  }

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
    rating,
  );
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
  }) : itemName = Value(itemName),
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

  ProductsCompanion copyWith({
    Value<int>? id,
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
    Value<double?>? rating,
  }) {
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
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _itemCodeMeta = const VerificationMeta(
    'itemCode',
  );
  @override
  late final GeneratedColumn<String> itemCode = GeneratedColumn<String>(
    'item_code',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _itemNameMeta = const VerificationMeta(
    'itemName',
  );
  @override
  late final GeneratedColumn<String> itemName = GeneratedColumn<String>(
    'item_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _quantityMeta = const VerificationMeta(
    'quantity',
  );
  @override
  late final GeneratedColumn<double> quantity = GeneratedColumn<double>(
    'quantity',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _imageUrlMeta = const VerificationMeta(
    'imageUrl',
  );
  @override
  late final GeneratedColumn<String> imageUrl = GeneratedColumn<String>(
    'image_url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isPrimaryMeta = const VerificationMeta(
    'isPrimary',
  );
  @override
  late final GeneratedColumn<String> isPrimary = GeneratedColumn<String>(
    'is_primary',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _productItemCodeMeta = const VerificationMeta(
    'productItemCode',
  );
  @override
  late final GeneratedColumn<String> productItemCode = GeneratedColumn<String>(
    'product_item_code',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isCustomizableMeta = const VerificationMeta(
    'isCustomizable',
  );
  @override
  late final GeneratedColumn<String> isCustomizable = GeneratedColumn<String>(
    'is_customizable',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    itemCode,
    itemName,
    quantity,
    imageUrl,
    isPrimary,
    productItemCode,
    isCustomizable,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'product_materials';
  @override
  VerificationContext validateIntegrity(
    Insertable<ProductMaterialEntity> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('item_code')) {
      context.handle(
        _itemCodeMeta,
        itemCode.isAcceptableOrUnknown(data['item_code']!, _itemCodeMeta),
      );
    } else if (isInserting) {
      context.missing(_itemCodeMeta);
    }
    if (data.containsKey('item_name')) {
      context.handle(
        _itemNameMeta,
        itemName.isAcceptableOrUnknown(data['item_name']!, _itemNameMeta),
      );
    }
    if (data.containsKey('quantity')) {
      context.handle(
        _quantityMeta,
        quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta),
      );
    } else if (isInserting) {
      context.missing(_quantityMeta);
    }
    if (data.containsKey('image_url')) {
      context.handle(
        _imageUrlMeta,
        imageUrl.isAcceptableOrUnknown(data['image_url']!, _imageUrlMeta),
      );
    }
    if (data.containsKey('is_primary')) {
      context.handle(
        _isPrimaryMeta,
        isPrimary.isAcceptableOrUnknown(data['is_primary']!, _isPrimaryMeta),
      );
    }
    if (data.containsKey('product_item_code')) {
      context.handle(
        _productItemCodeMeta,
        productItemCode.isAcceptableOrUnknown(
          data['product_item_code']!,
          _productItemCodeMeta,
        ),
      );
    }
    if (data.containsKey('is_customizable')) {
      context.handle(
        _isCustomizableMeta,
        isCustomizable.isAcceptableOrUnknown(
          data['is_customizable']!,
          _isCustomizableMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ProductMaterialEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProductMaterialEntity(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      itemCode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}item_code'],
      )!,
      itemName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}item_name'],
      ),
      quantity: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}quantity'],
      )!,
      imageUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}image_url'],
      ),
      isPrimary: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}is_primary'],
      ),
      productItemCode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}product_item_code'],
      ),
      isCustomizable: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}is_customizable'],
      ),
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
  final String? isCustomizable;
  const ProductMaterialEntity({
    required this.id,
    required this.itemCode,
    this.itemName,
    required this.quantity,
    this.imageUrl,
    this.isPrimary,
    this.productItemCode,
    this.isCustomizable,
  });
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
    if (!nullToAbsent || isCustomizable != null) {
      map['is_customizable'] = Variable<String>(isCustomizable);
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
      isCustomizable: isCustomizable == null && nullToAbsent
          ? const Value.absent()
          : Value(isCustomizable),
    );
  }

  factory ProductMaterialEntity.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProductMaterialEntity(
      id: serializer.fromJson<int>(json['id']),
      itemCode: serializer.fromJson<String>(json['itemCode']),
      itemName: serializer.fromJson<String?>(json['itemName']),
      quantity: serializer.fromJson<double>(json['quantity']),
      imageUrl: serializer.fromJson<String?>(json['imageUrl']),
      isPrimary: serializer.fromJson<String?>(json['isPrimary']),
      productItemCode: serializer.fromJson<String?>(json['productItemCode']),
      isCustomizable: serializer.fromJson<String?>(json['isCustomizable']),
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
      'isCustomizable': serializer.toJson<String?>(isCustomizable),
    };
  }

  ProductMaterialEntity copyWith({
    int? id,
    String? itemCode,
    Value<String?> itemName = const Value.absent(),
    double? quantity,
    Value<String?> imageUrl = const Value.absent(),
    Value<String?> isPrimary = const Value.absent(),
    Value<String?> productItemCode = const Value.absent(),
    Value<String?> isCustomizable = const Value.absent(),
  }) => ProductMaterialEntity(
    id: id ?? this.id,
    itemCode: itemCode ?? this.itemCode,
    itemName: itemName.present ? itemName.value : this.itemName,
    quantity: quantity ?? this.quantity,
    imageUrl: imageUrl.present ? imageUrl.value : this.imageUrl,
    isPrimary: isPrimary.present ? isPrimary.value : this.isPrimary,
    productItemCode: productItemCode.present
        ? productItemCode.value
        : this.productItemCode,
    isCustomizable: isCustomizable.present
        ? isCustomizable.value
        : this.isCustomizable,
  );
  ProductMaterialEntity copyWithCompanion(ProductMaterialsCompanion data) {
    return ProductMaterialEntity(
      id: data.id.present ? data.id.value : this.id,
      itemCode: data.itemCode.present ? data.itemCode.value : this.itemCode,
      itemName: data.itemName.present ? data.itemName.value : this.itemName,
      quantity: data.quantity.present ? data.quantity.value : this.quantity,
      imageUrl: data.imageUrl.present ? data.imageUrl.value : this.imageUrl,
      isPrimary: data.isPrimary.present ? data.isPrimary.value : this.isPrimary,
      productItemCode: data.productItemCode.present
          ? data.productItemCode.value
          : this.productItemCode,
      isCustomizable: data.isCustomizable.present
          ? data.isCustomizable.value
          : this.isCustomizable,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ProductMaterialEntity(')
          ..write('id: $id, ')
          ..write('itemCode: $itemCode, ')
          ..write('itemName: $itemName, ')
          ..write('quantity: $quantity, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('isPrimary: $isPrimary, ')
          ..write('productItemCode: $productItemCode, ')
          ..write('isCustomizable: $isCustomizable')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    itemCode,
    itemName,
    quantity,
    imageUrl,
    isPrimary,
    productItemCode,
    isCustomizable,
  );
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
          other.productItemCode == this.productItemCode &&
          other.isCustomizable == this.isCustomizable);
}

class ProductMaterialsCompanion extends UpdateCompanion<ProductMaterialEntity> {
  final Value<int> id;
  final Value<String> itemCode;
  final Value<String?> itemName;
  final Value<double> quantity;
  final Value<String?> imageUrl;
  final Value<String?> isPrimary;
  final Value<String?> productItemCode;
  final Value<String?> isCustomizable;
  const ProductMaterialsCompanion({
    this.id = const Value.absent(),
    this.itemCode = const Value.absent(),
    this.itemName = const Value.absent(),
    this.quantity = const Value.absent(),
    this.imageUrl = const Value.absent(),
    this.isPrimary = const Value.absent(),
    this.productItemCode = const Value.absent(),
    this.isCustomizable = const Value.absent(),
  });
  ProductMaterialsCompanion.insert({
    this.id = const Value.absent(),
    required String itemCode,
    this.itemName = const Value.absent(),
    required double quantity,
    this.imageUrl = const Value.absent(),
    this.isPrimary = const Value.absent(),
    this.productItemCode = const Value.absent(),
    this.isCustomizable = const Value.absent(),
  }) : itemCode = Value(itemCode),
       quantity = Value(quantity);
  static Insertable<ProductMaterialEntity> custom({
    Expression<int>? id,
    Expression<String>? itemCode,
    Expression<String>? itemName,
    Expression<double>? quantity,
    Expression<String>? imageUrl,
    Expression<String>? isPrimary,
    Expression<String>? productItemCode,
    Expression<String>? isCustomizable,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (itemCode != null) 'item_code': itemCode,
      if (itemName != null) 'item_name': itemName,
      if (quantity != null) 'quantity': quantity,
      if (imageUrl != null) 'image_url': imageUrl,
      if (isPrimary != null) 'is_primary': isPrimary,
      if (productItemCode != null) 'product_item_code': productItemCode,
      if (isCustomizable != null) 'is_customizable': isCustomizable,
    });
  }

  ProductMaterialsCompanion copyWith({
    Value<int>? id,
    Value<String>? itemCode,
    Value<String?>? itemName,
    Value<double>? quantity,
    Value<String?>? imageUrl,
    Value<String?>? isPrimary,
    Value<String?>? productItemCode,
    Value<String?>? isCustomizable,
  }) {
    return ProductMaterialsCompanion(
      id: id ?? this.id,
      itemCode: itemCode ?? this.itemCode,
      itemName: itemName ?? this.itemName,
      quantity: quantity ?? this.quantity,
      imageUrl: imageUrl ?? this.imageUrl,
      isPrimary: isPrimary ?? this.isPrimary,
      productItemCode: productItemCode ?? this.productItemCode,
      isCustomizable: isCustomizable ?? this.isCustomizable,
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
    if (isCustomizable.present) {
      map['is_customizable'] = Variable<String>(isCustomizable.value);
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
          ..write('productItemCode: $productItemCode, ')
          ..write('isCustomizable: $isCustomizable')
          ..write(')'))
        .toString();
  }
}

class $CategoryAccompanimentsTable extends CategoryAccompaniments
    with TableInfo<$CategoryAccompanimentsTable, CategoryAccompanimentEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CategoryAccompanimentsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _lineNumberMeta = const VerificationMeta(
    'lineNumber',
  );
  @override
  late final GeneratedColumn<int> lineNumber = GeneratedColumn<int>(
    'line_number',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _accompanimentItemCodeMeta =
      const VerificationMeta('accompanimentItemCode');
  @override
  late final GeneratedColumn<String> accompanimentItemCode =
      GeneratedColumn<String>(
        'accompaniment_item_code',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _accompanimentItemNameMeta =
      const VerificationMeta('accompanimentItemName');
  @override
  late final GeneratedColumn<String> accompanimentItemName =
      GeneratedColumn<String>(
        'accompaniment_item_name',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _accompanimentImageUrlMeta =
      const VerificationMeta('accompanimentImageUrl');
  @override
  late final GeneratedColumn<String> accompanimentImageUrl =
      GeneratedColumn<String>(
        'accompaniment_image_url',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _accompanimentPriceMeta =
      const VerificationMeta('accompanimentPrice');
  @override
  late final GeneratedColumn<double> accompanimentPrice =
      GeneratedColumn<double>(
        'accompaniment_price',
        aliasedName,
        false,
        type: DriftSqlType.double,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _discountMeta = const VerificationMeta(
    'discount',
  );
  @override
  late final GeneratedColumn<double> discount = GeneratedColumn<double>(
    'discount',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _enlargementItemCodeMeta =
      const VerificationMeta('enlargementItemCode');
  @override
  late final GeneratedColumn<String> enlargementItemCode =
      GeneratedColumn<String>(
        'enlargement_item_code',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _enlargementDiscountMeta =
      const VerificationMeta('enlargementDiscount');
  @override
  late final GeneratedColumn<double> enlargementDiscount =
      GeneratedColumn<double>(
        'enlargement_discount',
        aliasedName,
        false,
        type: DriftSqlType.double,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _categoryItemCodeMeta = const VerificationMeta(
    'categoryItemCode',
  );
  @override
  late final GeneratedColumn<String> categoryItemCode = GeneratedColumn<String>(
    'category_item_code',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    lineNumber,
    accompanimentItemCode,
    accompanimentItemName,
    accompanimentImageUrl,
    accompanimentPrice,
    discount,
    enlargementItemCode,
    enlargementDiscount,
    categoryItemCode,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'category_accompaniments';
  @override
  VerificationContext validateIntegrity(
    Insertable<CategoryAccompanimentEntity> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('line_number')) {
      context.handle(
        _lineNumberMeta,
        lineNumber.isAcceptableOrUnknown(data['line_number']!, _lineNumberMeta),
      );
    } else if (isInserting) {
      context.missing(_lineNumberMeta);
    }
    if (data.containsKey('accompaniment_item_code')) {
      context.handle(
        _accompanimentItemCodeMeta,
        accompanimentItemCode.isAcceptableOrUnknown(
          data['accompaniment_item_code']!,
          _accompanimentItemCodeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_accompanimentItemCodeMeta);
    }
    if (data.containsKey('accompaniment_item_name')) {
      context.handle(
        _accompanimentItemNameMeta,
        accompanimentItemName.isAcceptableOrUnknown(
          data['accompaniment_item_name']!,
          _accompanimentItemNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_accompanimentItemNameMeta);
    }
    if (data.containsKey('accompaniment_image_url')) {
      context.handle(
        _accompanimentImageUrlMeta,
        accompanimentImageUrl.isAcceptableOrUnknown(
          data['accompaniment_image_url']!,
          _accompanimentImageUrlMeta,
        ),
      );
    }
    if (data.containsKey('accompaniment_price')) {
      context.handle(
        _accompanimentPriceMeta,
        accompanimentPrice.isAcceptableOrUnknown(
          data['accompaniment_price']!,
          _accompanimentPriceMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_accompanimentPriceMeta);
    }
    if (data.containsKey('discount')) {
      context.handle(
        _discountMeta,
        discount.isAcceptableOrUnknown(data['discount']!, _discountMeta),
      );
    } else if (isInserting) {
      context.missing(_discountMeta);
    }
    if (data.containsKey('enlargement_item_code')) {
      context.handle(
        _enlargementItemCodeMeta,
        enlargementItemCode.isAcceptableOrUnknown(
          data['enlargement_item_code']!,
          _enlargementItemCodeMeta,
        ),
      );
    }
    if (data.containsKey('enlargement_discount')) {
      context.handle(
        _enlargementDiscountMeta,
        enlargementDiscount.isAcceptableOrUnknown(
          data['enlargement_discount']!,
          _enlargementDiscountMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_enlargementDiscountMeta);
    }
    if (data.containsKey('category_item_code')) {
      context.handle(
        _categoryItemCodeMeta,
        categoryItemCode.isAcceptableOrUnknown(
          data['category_item_code']!,
          _categoryItemCodeMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CategoryAccompanimentEntity map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CategoryAccompanimentEntity(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      lineNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}line_number'],
      )!,
      accompanimentItemCode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}accompaniment_item_code'],
      )!,
      accompanimentItemName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}accompaniment_item_name'],
      )!,
      accompanimentImageUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}accompaniment_image_url'],
      ),
      accompanimentPrice: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}accompaniment_price'],
      )!,
      discount: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}discount'],
      )!,
      enlargementItemCode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}enlargement_item_code'],
      ),
      enlargementDiscount: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}enlargement_discount'],
      )!,
      categoryItemCode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category_item_code'],
      ),
    );
  }

  @override
  $CategoryAccompanimentsTable createAlias(String alias) {
    return $CategoryAccompanimentsTable(attachedDatabase, alias);
  }
}

class CategoryAccompanimentEntity extends DataClass
    implements Insertable<CategoryAccompanimentEntity> {
  final int id;
  final int lineNumber;
  final String accompanimentItemCode;
  final String accompanimentItemName;
  final String? accompanimentImageUrl;
  final double accompanimentPrice;
  final double discount;
  final String? enlargementItemCode;
  final double enlargementDiscount;
  final String? categoryItemCode;
  const CategoryAccompanimentEntity({
    required this.id,
    required this.lineNumber,
    required this.accompanimentItemCode,
    required this.accompanimentItemName,
    this.accompanimentImageUrl,
    required this.accompanimentPrice,
    required this.discount,
    this.enlargementItemCode,
    required this.enlargementDiscount,
    this.categoryItemCode,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['line_number'] = Variable<int>(lineNumber);
    map['accompaniment_item_code'] = Variable<String>(accompanimentItemCode);
    map['accompaniment_item_name'] = Variable<String>(accompanimentItemName);
    if (!nullToAbsent || accompanimentImageUrl != null) {
      map['accompaniment_image_url'] = Variable<String>(accompanimentImageUrl);
    }
    map['accompaniment_price'] = Variable<double>(accompanimentPrice);
    map['discount'] = Variable<double>(discount);
    if (!nullToAbsent || enlargementItemCode != null) {
      map['enlargement_item_code'] = Variable<String>(enlargementItemCode);
    }
    map['enlargement_discount'] = Variable<double>(enlargementDiscount);
    if (!nullToAbsent || categoryItemCode != null) {
      map['category_item_code'] = Variable<String>(categoryItemCode);
    }
    return map;
  }

  CategoryAccompanimentsCompanion toCompanion(bool nullToAbsent) {
    return CategoryAccompanimentsCompanion(
      id: Value(id),
      lineNumber: Value(lineNumber),
      accompanimentItemCode: Value(accompanimentItemCode),
      accompanimentItemName: Value(accompanimentItemName),
      accompanimentImageUrl: accompanimentImageUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(accompanimentImageUrl),
      accompanimentPrice: Value(accompanimentPrice),
      discount: Value(discount),
      enlargementItemCode: enlargementItemCode == null && nullToAbsent
          ? const Value.absent()
          : Value(enlargementItemCode),
      enlargementDiscount: Value(enlargementDiscount),
      categoryItemCode: categoryItemCode == null && nullToAbsent
          ? const Value.absent()
          : Value(categoryItemCode),
    );
  }

  factory CategoryAccompanimentEntity.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CategoryAccompanimentEntity(
      id: serializer.fromJson<int>(json['id']),
      lineNumber: serializer.fromJson<int>(json['lineNumber']),
      accompanimentItemCode: serializer.fromJson<String>(
        json['accompanimentItemCode'],
      ),
      accompanimentItemName: serializer.fromJson<String>(
        json['accompanimentItemName'],
      ),
      accompanimentImageUrl: serializer.fromJson<String?>(
        json['accompanimentImageUrl'],
      ),
      accompanimentPrice: serializer.fromJson<double>(
        json['accompanimentPrice'],
      ),
      discount: serializer.fromJson<double>(json['discount']),
      enlargementItemCode: serializer.fromJson<String?>(
        json['enlargementItemCode'],
      ),
      enlargementDiscount: serializer.fromJson<double>(
        json['enlargementDiscount'],
      ),
      categoryItemCode: serializer.fromJson<String?>(json['categoryItemCode']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'lineNumber': serializer.toJson<int>(lineNumber),
      'accompanimentItemCode': serializer.toJson<String>(accompanimentItemCode),
      'accompanimentItemName': serializer.toJson<String>(accompanimentItemName),
      'accompanimentImageUrl': serializer.toJson<String?>(
        accompanimentImageUrl,
      ),
      'accompanimentPrice': serializer.toJson<double>(accompanimentPrice),
      'discount': serializer.toJson<double>(discount),
      'enlargementItemCode': serializer.toJson<String?>(enlargementItemCode),
      'enlargementDiscount': serializer.toJson<double>(enlargementDiscount),
      'categoryItemCode': serializer.toJson<String?>(categoryItemCode),
    };
  }

  CategoryAccompanimentEntity copyWith({
    int? id,
    int? lineNumber,
    String? accompanimentItemCode,
    String? accompanimentItemName,
    Value<String?> accompanimentImageUrl = const Value.absent(),
    double? accompanimentPrice,
    double? discount,
    Value<String?> enlargementItemCode = const Value.absent(),
    double? enlargementDiscount,
    Value<String?> categoryItemCode = const Value.absent(),
  }) => CategoryAccompanimentEntity(
    id: id ?? this.id,
    lineNumber: lineNumber ?? this.lineNumber,
    accompanimentItemCode: accompanimentItemCode ?? this.accompanimentItemCode,
    accompanimentItemName: accompanimentItemName ?? this.accompanimentItemName,
    accompanimentImageUrl: accompanimentImageUrl.present
        ? accompanimentImageUrl.value
        : this.accompanimentImageUrl,
    accompanimentPrice: accompanimentPrice ?? this.accompanimentPrice,
    discount: discount ?? this.discount,
    enlargementItemCode: enlargementItemCode.present
        ? enlargementItemCode.value
        : this.enlargementItemCode,
    enlargementDiscount: enlargementDiscount ?? this.enlargementDiscount,
    categoryItemCode: categoryItemCode.present
        ? categoryItemCode.value
        : this.categoryItemCode,
  );
  CategoryAccompanimentEntity copyWithCompanion(
    CategoryAccompanimentsCompanion data,
  ) {
    return CategoryAccompanimentEntity(
      id: data.id.present ? data.id.value : this.id,
      lineNumber: data.lineNumber.present
          ? data.lineNumber.value
          : this.lineNumber,
      accompanimentItemCode: data.accompanimentItemCode.present
          ? data.accompanimentItemCode.value
          : this.accompanimentItemCode,
      accompanimentItemName: data.accompanimentItemName.present
          ? data.accompanimentItemName.value
          : this.accompanimentItemName,
      accompanimentImageUrl: data.accompanimentImageUrl.present
          ? data.accompanimentImageUrl.value
          : this.accompanimentImageUrl,
      accompanimentPrice: data.accompanimentPrice.present
          ? data.accompanimentPrice.value
          : this.accompanimentPrice,
      discount: data.discount.present ? data.discount.value : this.discount,
      enlargementItemCode: data.enlargementItemCode.present
          ? data.enlargementItemCode.value
          : this.enlargementItemCode,
      enlargementDiscount: data.enlargementDiscount.present
          ? data.enlargementDiscount.value
          : this.enlargementDiscount,
      categoryItemCode: data.categoryItemCode.present
          ? data.categoryItemCode.value
          : this.categoryItemCode,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CategoryAccompanimentEntity(')
          ..write('id: $id, ')
          ..write('lineNumber: $lineNumber, ')
          ..write('accompanimentItemCode: $accompanimentItemCode, ')
          ..write('accompanimentItemName: $accompanimentItemName, ')
          ..write('accompanimentImageUrl: $accompanimentImageUrl, ')
          ..write('accompanimentPrice: $accompanimentPrice, ')
          ..write('discount: $discount, ')
          ..write('enlargementItemCode: $enlargementItemCode, ')
          ..write('enlargementDiscount: $enlargementDiscount, ')
          ..write('categoryItemCode: $categoryItemCode')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    lineNumber,
    accompanimentItemCode,
    accompanimentItemName,
    accompanimentImageUrl,
    accompanimentPrice,
    discount,
    enlargementItemCode,
    enlargementDiscount,
    categoryItemCode,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CategoryAccompanimentEntity &&
          other.id == this.id &&
          other.lineNumber == this.lineNumber &&
          other.accompanimentItemCode == this.accompanimentItemCode &&
          other.accompanimentItemName == this.accompanimentItemName &&
          other.accompanimentImageUrl == this.accompanimentImageUrl &&
          other.accompanimentPrice == this.accompanimentPrice &&
          other.discount == this.discount &&
          other.enlargementItemCode == this.enlargementItemCode &&
          other.enlargementDiscount == this.enlargementDiscount &&
          other.categoryItemCode == this.categoryItemCode);
}

class CategoryAccompanimentsCompanion
    extends UpdateCompanion<CategoryAccompanimentEntity> {
  final Value<int> id;
  final Value<int> lineNumber;
  final Value<String> accompanimentItemCode;
  final Value<String> accompanimentItemName;
  final Value<String?> accompanimentImageUrl;
  final Value<double> accompanimentPrice;
  final Value<double> discount;
  final Value<String?> enlargementItemCode;
  final Value<double> enlargementDiscount;
  final Value<String?> categoryItemCode;
  const CategoryAccompanimentsCompanion({
    this.id = const Value.absent(),
    this.lineNumber = const Value.absent(),
    this.accompanimentItemCode = const Value.absent(),
    this.accompanimentItemName = const Value.absent(),
    this.accompanimentImageUrl = const Value.absent(),
    this.accompanimentPrice = const Value.absent(),
    this.discount = const Value.absent(),
    this.enlargementItemCode = const Value.absent(),
    this.enlargementDiscount = const Value.absent(),
    this.categoryItemCode = const Value.absent(),
  });
  CategoryAccompanimentsCompanion.insert({
    this.id = const Value.absent(),
    required int lineNumber,
    required String accompanimentItemCode,
    required String accompanimentItemName,
    this.accompanimentImageUrl = const Value.absent(),
    required double accompanimentPrice,
    required double discount,
    this.enlargementItemCode = const Value.absent(),
    required double enlargementDiscount,
    this.categoryItemCode = const Value.absent(),
  }) : lineNumber = Value(lineNumber),
       accompanimentItemCode = Value(accompanimentItemCode),
       accompanimentItemName = Value(accompanimentItemName),
       accompanimentPrice = Value(accompanimentPrice),
       discount = Value(discount),
       enlargementDiscount = Value(enlargementDiscount);
  static Insertable<CategoryAccompanimentEntity> custom({
    Expression<int>? id,
    Expression<int>? lineNumber,
    Expression<String>? accompanimentItemCode,
    Expression<String>? accompanimentItemName,
    Expression<String>? accompanimentImageUrl,
    Expression<double>? accompanimentPrice,
    Expression<double>? discount,
    Expression<String>? enlargementItemCode,
    Expression<double>? enlargementDiscount,
    Expression<String>? categoryItemCode,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (lineNumber != null) 'line_number': lineNumber,
      if (accompanimentItemCode != null)
        'accompaniment_item_code': accompanimentItemCode,
      if (accompanimentItemName != null)
        'accompaniment_item_name': accompanimentItemName,
      if (accompanimentImageUrl != null)
        'accompaniment_image_url': accompanimentImageUrl,
      if (accompanimentPrice != null) 'accompaniment_price': accompanimentPrice,
      if (discount != null) 'discount': discount,
      if (enlargementItemCode != null)
        'enlargement_item_code': enlargementItemCode,
      if (enlargementDiscount != null)
        'enlargement_discount': enlargementDiscount,
      if (categoryItemCode != null) 'category_item_code': categoryItemCode,
    });
  }

  CategoryAccompanimentsCompanion copyWith({
    Value<int>? id,
    Value<int>? lineNumber,
    Value<String>? accompanimentItemCode,
    Value<String>? accompanimentItemName,
    Value<String?>? accompanimentImageUrl,
    Value<double>? accompanimentPrice,
    Value<double>? discount,
    Value<String?>? enlargementItemCode,
    Value<double>? enlargementDiscount,
    Value<String?>? categoryItemCode,
  }) {
    return CategoryAccompanimentsCompanion(
      id: id ?? this.id,
      lineNumber: lineNumber ?? this.lineNumber,
      accompanimentItemCode:
          accompanimentItemCode ?? this.accompanimentItemCode,
      accompanimentItemName:
          accompanimentItemName ?? this.accompanimentItemName,
      accompanimentImageUrl:
          accompanimentImageUrl ?? this.accompanimentImageUrl,
      accompanimentPrice: accompanimentPrice ?? this.accompanimentPrice,
      discount: discount ?? this.discount,
      enlargementItemCode: enlargementItemCode ?? this.enlargementItemCode,
      enlargementDiscount: enlargementDiscount ?? this.enlargementDiscount,
      categoryItemCode: categoryItemCode ?? this.categoryItemCode,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (lineNumber.present) {
      map['line_number'] = Variable<int>(lineNumber.value);
    }
    if (accompanimentItemCode.present) {
      map['accompaniment_item_code'] = Variable<String>(
        accompanimentItemCode.value,
      );
    }
    if (accompanimentItemName.present) {
      map['accompaniment_item_name'] = Variable<String>(
        accompanimentItemName.value,
      );
    }
    if (accompanimentImageUrl.present) {
      map['accompaniment_image_url'] = Variable<String>(
        accompanimentImageUrl.value,
      );
    }
    if (accompanimentPrice.present) {
      map['accompaniment_price'] = Variable<double>(accompanimentPrice.value);
    }
    if (discount.present) {
      map['discount'] = Variable<double>(discount.value);
    }
    if (enlargementItemCode.present) {
      map['enlargement_item_code'] = Variable<String>(
        enlargementItemCode.value,
      );
    }
    if (enlargementDiscount.present) {
      map['enlargement_discount'] = Variable<double>(enlargementDiscount.value);
    }
    if (categoryItemCode.present) {
      map['category_item_code'] = Variable<String>(categoryItemCode.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CategoryAccompanimentsCompanion(')
          ..write('id: $id, ')
          ..write('lineNumber: $lineNumber, ')
          ..write('accompanimentItemCode: $accompanimentItemCode, ')
          ..write('accompanimentItemName: $accompanimentItemName, ')
          ..write('accompanimentImageUrl: $accompanimentImageUrl, ')
          ..write('accompanimentPrice: $accompanimentPrice, ')
          ..write('discount: $discount, ')
          ..write('enlargementItemCode: $enlargementItemCode, ')
          ..write('enlargementDiscount: $enlargementDiscount, ')
          ..write('categoryItemCode: $categoryItemCode')
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
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _categoryItemCodeMeta = const VerificationMeta(
    'categoryItemCode',
  );
  @override
  late final GeneratedColumn<String> categoryItemCode = GeneratedColumn<String>(
    'category_item_code',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _categoryItemNameMeta = const VerificationMeta(
    'categoryItemName',
  );
  @override
  late final GeneratedColumn<String> categoryItemName = GeneratedColumn<String>(
    'category_item_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _enabledMeta = const VerificationMeta(
    'enabled',
  );
  @override
  late final GeneratedColumn<String> enabled = GeneratedColumn<String>(
    'enabled',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dataSourceMeta = const VerificationMeta(
    'dataSource',
  );
  @override
  late final GeneratedColumn<String> dataSource = GeneratedColumn<String>(
    'data_source',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _visOrderMeta = const VerificationMeta(
    'visOrder',
  );
  @override
  late final GeneratedColumn<int> visOrder = GeneratedColumn<int>(
    'vis_order',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _frgnNameMeta = const VerificationMeta(
    'frgnName',
  );
  @override
  late final GeneratedColumn<String> frgnName = GeneratedColumn<String>(
    'frgn_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _imageUrlMeta = const VerificationMeta(
    'imageUrl',
  );
  @override
  late final GeneratedColumn<String> imageUrl = GeneratedColumn<String>(
    'image_url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _frgnDescriptionMeta = const VerificationMeta(
    'frgnDescription',
  );
  @override
  late final GeneratedColumn<String> frgnDescription = GeneratedColumn<String>(
    'frgn_description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _groupItemCodeMeta = const VerificationMeta(
    'groupItemCode',
  );
  @override
  late final GeneratedColumn<String> groupItemCode = GeneratedColumn<String>(
    'group_item_code',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
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
    groupItemCode,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'product_categories';
  @override
  VerificationContext validateIntegrity(
    Insertable<ProductCategoryEntity> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('category_item_code')) {
      context.handle(
        _categoryItemCodeMeta,
        categoryItemCode.isAcceptableOrUnknown(
          data['category_item_code']!,
          _categoryItemCodeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_categoryItemCodeMeta);
    }
    if (data.containsKey('category_item_name')) {
      context.handle(
        _categoryItemNameMeta,
        categoryItemName.isAcceptableOrUnknown(
          data['category_item_name']!,
          _categoryItemNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_categoryItemNameMeta);
    }
    if (data.containsKey('enabled')) {
      context.handle(
        _enabledMeta,
        enabled.isAcceptableOrUnknown(data['enabled']!, _enabledMeta),
      );
    } else if (isInserting) {
      context.missing(_enabledMeta);
    }
    if (data.containsKey('data_source')) {
      context.handle(
        _dataSourceMeta,
        dataSource.isAcceptableOrUnknown(data['data_source']!, _dataSourceMeta),
      );
    } else if (isInserting) {
      context.missing(_dataSourceMeta);
    }
    if (data.containsKey('vis_order')) {
      context.handle(
        _visOrderMeta,
        visOrder.isAcceptableOrUnknown(data['vis_order']!, _visOrderMeta),
      );
    } else if (isInserting) {
      context.missing(_visOrderMeta);
    }
    if (data.containsKey('frgn_name')) {
      context.handle(
        _frgnNameMeta,
        frgnName.isAcceptableOrUnknown(data['frgn_name']!, _frgnNameMeta),
      );
    }
    if (data.containsKey('image_url')) {
      context.handle(
        _imageUrlMeta,
        imageUrl.isAcceptableOrUnknown(data['image_url']!, _imageUrlMeta),
      );
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('frgn_description')) {
      context.handle(
        _frgnDescriptionMeta,
        frgnDescription.isAcceptableOrUnknown(
          data['frgn_description']!,
          _frgnDescriptionMeta,
        ),
      );
    }
    if (data.containsKey('group_item_code')) {
      context.handle(
        _groupItemCodeMeta,
        groupItemCode.isAcceptableOrUnknown(
          data['group_item_code']!,
          _groupItemCodeMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ProductCategoryEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProductCategoryEntity(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      categoryItemCode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category_item_code'],
      )!,
      categoryItemName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category_item_name'],
      )!,
      enabled: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}enabled'],
      )!,
      dataSource: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}data_source'],
      )!,
      visOrder: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}vis_order'],
      )!,
      frgnName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}frgn_name'],
      ),
      imageUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}image_url'],
      ),
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      frgnDescription: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}frgn_description'],
      ),
      groupItemCode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}group_item_code'],
      ),
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
  const ProductCategoryEntity({
    required this.id,
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

  factory ProductCategoryEntity.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
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

  ProductCategoryEntity copyWith({
    int? id,
    String? categoryItemCode,
    String? categoryItemName,
    String? enabled,
    String? dataSource,
    int? visOrder,
    Value<String?> frgnName = const Value.absent(),
    Value<String?> imageUrl = const Value.absent(),
    Value<String?> description = const Value.absent(),
    Value<String?> frgnDescription = const Value.absent(),
    Value<String?> groupItemCode = const Value.absent(),
  }) => ProductCategoryEntity(
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
    groupItemCode: groupItemCode.present
        ? groupItemCode.value
        : this.groupItemCode,
  );
  ProductCategoryEntity copyWithCompanion(ProductCategoriesCompanion data) {
    return ProductCategoryEntity(
      id: data.id.present ? data.id.value : this.id,
      categoryItemCode: data.categoryItemCode.present
          ? data.categoryItemCode.value
          : this.categoryItemCode,
      categoryItemName: data.categoryItemName.present
          ? data.categoryItemName.value
          : this.categoryItemName,
      enabled: data.enabled.present ? data.enabled.value : this.enabled,
      dataSource: data.dataSource.present
          ? data.dataSource.value
          : this.dataSource,
      visOrder: data.visOrder.present ? data.visOrder.value : this.visOrder,
      frgnName: data.frgnName.present ? data.frgnName.value : this.frgnName,
      imageUrl: data.imageUrl.present ? data.imageUrl.value : this.imageUrl,
      description: data.description.present
          ? data.description.value
          : this.description,
      frgnDescription: data.frgnDescription.present
          ? data.frgnDescription.value
          : this.frgnDescription,
      groupItemCode: data.groupItemCode.present
          ? data.groupItemCode.value
          : this.groupItemCode,
    );
  }

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
    groupItemCode,
  );
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
  }) : categoryItemCode = Value(categoryItemCode),
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

  ProductCategoriesCompanion copyWith({
    Value<int>? id,
    Value<String>? categoryItemCode,
    Value<String>? categoryItemName,
    Value<String>? enabled,
    Value<String>? dataSource,
    Value<int>? visOrder,
    Value<String?>? frgnName,
    Value<String?>? imageUrl,
    Value<String?>? description,
    Value<String?>? frgnDescription,
    Value<String?>? groupItemCode,
  }) {
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
  static const VerificationMeta _productIdMeta = const VerificationMeta(
    'productId',
  );
  @override
  late final GeneratedColumn<int> productId = GeneratedColumn<int>(
    'product_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES products (id)',
    ),
  );
  static const VerificationMeta _materialIdMeta = const VerificationMeta(
    'materialId',
  );
  @override
  late final GeneratedColumn<int> materialId = GeneratedColumn<int>(
    'material_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES product_materials (id)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [productId, materialId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'product_material_relations';
  @override
  VerificationContext validateIntegrity(
    Insertable<ProductMaterialRelation> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('product_id')) {
      context.handle(
        _productIdMeta,
        productId.isAcceptableOrUnknown(data['product_id']!, _productIdMeta),
      );
    } else if (isInserting) {
      context.missing(_productIdMeta);
    }
    if (data.containsKey('material_id')) {
      context.handle(
        _materialIdMeta,
        materialId.isAcceptableOrUnknown(data['material_id']!, _materialIdMeta),
      );
    } else if (isInserting) {
      context.missing(_materialIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {productId, materialId};
  @override
  ProductMaterialRelation map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProductMaterialRelation(
      productId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}product_id'],
      )!,
      materialId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}material_id'],
      )!,
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
  const ProductMaterialRelation({
    required this.productId,
    required this.materialId,
  });
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

  factory ProductMaterialRelation.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
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
  ProductMaterialRelation copyWithCompanion(
    ProductMaterialRelationsCompanion data,
  ) {
    return ProductMaterialRelation(
      productId: data.productId.present ? data.productId.value : this.productId,
      materialId: data.materialId.present
          ? data.materialId.value
          : this.materialId,
    );
  }

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
  }) : productId = Value(productId),
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

  ProductMaterialRelationsCompanion copyWith({
    Value<int>? productId,
    Value<int>? materialId,
    Value<int>? rowid,
  }) {
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

class $CategoryAccompanimentRelationsTable
    extends CategoryAccompanimentRelations
    with
        TableInfo<
          $CategoryAccompanimentRelationsTable,
          CategoryAccompanimentRelation
        > {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CategoryAccompanimentRelationsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _categoryIdMeta = const VerificationMeta(
    'categoryId',
  );
  @override
  late final GeneratedColumn<int> categoryId = GeneratedColumn<int>(
    'category_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES product_categories (id)',
    ),
  );
  static const VerificationMeta _accompanimentIdMeta = const VerificationMeta(
    'accompanimentId',
  );
  @override
  late final GeneratedColumn<int> accompanimentId = GeneratedColumn<int>(
    'accompaniment_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES category_accompaniments (id)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [categoryId, accompanimentId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'category_accompaniment_relations';
  @override
  VerificationContext validateIntegrity(
    Insertable<CategoryAccompanimentRelation> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('category_id')) {
      context.handle(
        _categoryIdMeta,
        categoryId.isAcceptableOrUnknown(data['category_id']!, _categoryIdMeta),
      );
    } else if (isInserting) {
      context.missing(_categoryIdMeta);
    }
    if (data.containsKey('accompaniment_id')) {
      context.handle(
        _accompanimentIdMeta,
        accompanimentId.isAcceptableOrUnknown(
          data['accompaniment_id']!,
          _accompanimentIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_accompanimentIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {categoryId, accompanimentId};
  @override
  CategoryAccompanimentRelation map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CategoryAccompanimentRelation(
      categoryId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}category_id'],
      )!,
      accompanimentId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}accompaniment_id'],
      )!,
    );
  }

  @override
  $CategoryAccompanimentRelationsTable createAlias(String alias) {
    return $CategoryAccompanimentRelationsTable(attachedDatabase, alias);
  }
}

class CategoryAccompanimentRelation extends DataClass
    implements Insertable<CategoryAccompanimentRelation> {
  final int categoryId;
  final int accompanimentId;
  const CategoryAccompanimentRelation({
    required this.categoryId,
    required this.accompanimentId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['category_id'] = Variable<int>(categoryId);
    map['accompaniment_id'] = Variable<int>(accompanimentId);
    return map;
  }

  CategoryAccompanimentRelationsCompanion toCompanion(bool nullToAbsent) {
    return CategoryAccompanimentRelationsCompanion(
      categoryId: Value(categoryId),
      accompanimentId: Value(accompanimentId),
    );
  }

  factory CategoryAccompanimentRelation.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CategoryAccompanimentRelation(
      categoryId: serializer.fromJson<int>(json['categoryId']),
      accompanimentId: serializer.fromJson<int>(json['accompanimentId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'categoryId': serializer.toJson<int>(categoryId),
      'accompanimentId': serializer.toJson<int>(accompanimentId),
    };
  }

  CategoryAccompanimentRelation copyWith({
    int? categoryId,
    int? accompanimentId,
  }) => CategoryAccompanimentRelation(
    categoryId: categoryId ?? this.categoryId,
    accompanimentId: accompanimentId ?? this.accompanimentId,
  );
  CategoryAccompanimentRelation copyWithCompanion(
    CategoryAccompanimentRelationsCompanion data,
  ) {
    return CategoryAccompanimentRelation(
      categoryId: data.categoryId.present
          ? data.categoryId.value
          : this.categoryId,
      accompanimentId: data.accompanimentId.present
          ? data.accompanimentId.value
          : this.accompanimentId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CategoryAccompanimentRelation(')
          ..write('categoryId: $categoryId, ')
          ..write('accompanimentId: $accompanimentId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(categoryId, accompanimentId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CategoryAccompanimentRelation &&
          other.categoryId == this.categoryId &&
          other.accompanimentId == this.accompanimentId);
}

class CategoryAccompanimentRelationsCompanion
    extends UpdateCompanion<CategoryAccompanimentRelation> {
  final Value<int> categoryId;
  final Value<int> accompanimentId;
  final Value<int> rowid;
  const CategoryAccompanimentRelationsCompanion({
    this.categoryId = const Value.absent(),
    this.accompanimentId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CategoryAccompanimentRelationsCompanion.insert({
    required int categoryId,
    required int accompanimentId,
    this.rowid = const Value.absent(),
  }) : categoryId = Value(categoryId),
       accompanimentId = Value(accompanimentId);
  static Insertable<CategoryAccompanimentRelation> custom({
    Expression<int>? categoryId,
    Expression<int>? accompanimentId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (categoryId != null) 'category_id': categoryId,
      if (accompanimentId != null) 'accompaniment_id': accompanimentId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CategoryAccompanimentRelationsCompanion copyWith({
    Value<int>? categoryId,
    Value<int>? accompanimentId,
    Value<int>? rowid,
  }) {
    return CategoryAccompanimentRelationsCompanion(
      categoryId: categoryId ?? this.categoryId,
      accompanimentId: accompanimentId ?? this.accompanimentId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (categoryId.present) {
      map['category_id'] = Variable<int>(categoryId.value);
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
    return (StringBuffer('CategoryAccompanimentRelationsCompanion(')
          ..write('categoryId: $categoryId, ')
          ..write('accompanimentId: $accompanimentId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $ProductsTable products = $ProductsTable(this);
  late final $ProductMaterialsTable productMaterials = $ProductMaterialsTable(
    this,
  );
  late final $CategoryAccompanimentsTable categoryAccompaniments =
      $CategoryAccompanimentsTable(this);
  late final $ProductCategoriesTable productCategories =
      $ProductCategoriesTable(this);
  late final $ProductMaterialRelationsTable productMaterialRelations =
      $ProductMaterialRelationsTable(this);
  late final $CategoryAccompanimentRelationsTable
  categoryAccompanimentRelations = $CategoryAccompanimentRelationsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    products,
    productMaterials,
    categoryAccompaniments,
    productCategories,
    productMaterialRelations,
    categoryAccompanimentRelations,
  ];
}

typedef $$ProductsTableCreateCompanionBuilder =
    ProductsCompanion Function({
      Value<int> id,
      Value<String?> itemCode,
      required String itemName,
      required double price,
      required String available,
      required String enabled,
      Value<String?> eanCode,
      Value<String?> frgnName,
      Value<double?> discount,
      Value<String?> imageUrl,
      Value<String?> description,
      Value<String?> frgnDescription,
      Value<String?> sellItem,
      Value<String?> groupItemCode,
      Value<String?> categoryItemCode,
      Value<String?> waitingTime,
      Value<double?> rating,
    });
typedef $$ProductsTableUpdateCompanionBuilder =
    ProductsCompanion Function({
      Value<int> id,
      Value<String?> itemCode,
      Value<String> itemName,
      Value<double> price,
      Value<String> available,
      Value<String> enabled,
      Value<String?> eanCode,
      Value<String?> frgnName,
      Value<double?> discount,
      Value<String?> imageUrl,
      Value<String?> description,
      Value<String?> frgnDescription,
      Value<String?> sellItem,
      Value<String?> groupItemCode,
      Value<String?> categoryItemCode,
      Value<String?> waitingTime,
      Value<double?> rating,
    });

final class $$ProductsTableReferences
    extends BaseReferences<_$AppDatabase, $ProductsTable, ProductEntity> {
  $$ProductsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<
    $ProductMaterialRelationsTable,
    List<ProductMaterialRelation>
  >
  _productMaterialRelationsRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.productMaterialRelations,
        aliasName: $_aliasNameGenerator(
          db.products.id,
          db.productMaterialRelations.productId,
        ),
      );

  $$ProductMaterialRelationsTableProcessedTableManager
  get productMaterialRelationsRefs {
    final manager = $$ProductMaterialRelationsTableTableManager(
      $_db,
      $_db.productMaterialRelations,
    ).filter((f) => f.productId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _productMaterialRelationsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ProductsTableFilterComposer
    extends Composer<_$AppDatabase, $ProductsTable> {
  $$ProductsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get itemCode => $composableBuilder(
    column: $table.itemCode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get itemName => $composableBuilder(
    column: $table.itemName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get price => $composableBuilder(
    column: $table.price,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get available => $composableBuilder(
    column: $table.available,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get enabled => $composableBuilder(
    column: $table.enabled,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get eanCode => $composableBuilder(
    column: $table.eanCode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get frgnName => $composableBuilder(
    column: $table.frgnName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get discount => $composableBuilder(
    column: $table.discount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get imageUrl => $composableBuilder(
    column: $table.imageUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get frgnDescription => $composableBuilder(
    column: $table.frgnDescription,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sellItem => $composableBuilder(
    column: $table.sellItem,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get groupItemCode => $composableBuilder(
    column: $table.groupItemCode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get categoryItemCode => $composableBuilder(
    column: $table.categoryItemCode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get waitingTime => $composableBuilder(
    column: $table.waitingTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get rating => $composableBuilder(
    column: $table.rating,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> productMaterialRelationsRefs(
    Expression<bool> Function($$ProductMaterialRelationsTableFilterComposer f)
    f,
  ) {
    final $$ProductMaterialRelationsTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.productMaterialRelations,
          getReferencedColumn: (t) => t.productId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ProductMaterialRelationsTableFilterComposer(
                $db: $db,
                $table: $db.productMaterialRelations,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$ProductsTableOrderingComposer
    extends Composer<_$AppDatabase, $ProductsTable> {
  $$ProductsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get itemCode => $composableBuilder(
    column: $table.itemCode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get itemName => $composableBuilder(
    column: $table.itemName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get price => $composableBuilder(
    column: $table.price,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get available => $composableBuilder(
    column: $table.available,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get enabled => $composableBuilder(
    column: $table.enabled,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get eanCode => $composableBuilder(
    column: $table.eanCode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get frgnName => $composableBuilder(
    column: $table.frgnName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get discount => $composableBuilder(
    column: $table.discount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get imageUrl => $composableBuilder(
    column: $table.imageUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get frgnDescription => $composableBuilder(
    column: $table.frgnDescription,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sellItem => $composableBuilder(
    column: $table.sellItem,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get groupItemCode => $composableBuilder(
    column: $table.groupItemCode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get categoryItemCode => $composableBuilder(
    column: $table.categoryItemCode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get waitingTime => $composableBuilder(
    column: $table.waitingTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get rating => $composableBuilder(
    column: $table.rating,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ProductsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProductsTable> {
  $$ProductsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get itemCode =>
      $composableBuilder(column: $table.itemCode, builder: (column) => column);

  GeneratedColumn<String> get itemName =>
      $composableBuilder(column: $table.itemName, builder: (column) => column);

  GeneratedColumn<double> get price =>
      $composableBuilder(column: $table.price, builder: (column) => column);

  GeneratedColumn<String> get available =>
      $composableBuilder(column: $table.available, builder: (column) => column);

  GeneratedColumn<String> get enabled =>
      $composableBuilder(column: $table.enabled, builder: (column) => column);

  GeneratedColumn<String> get eanCode =>
      $composableBuilder(column: $table.eanCode, builder: (column) => column);

  GeneratedColumn<String> get frgnName =>
      $composableBuilder(column: $table.frgnName, builder: (column) => column);

  GeneratedColumn<double> get discount =>
      $composableBuilder(column: $table.discount, builder: (column) => column);

  GeneratedColumn<String> get imageUrl =>
      $composableBuilder(column: $table.imageUrl, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get frgnDescription => $composableBuilder(
    column: $table.frgnDescription,
    builder: (column) => column,
  );

  GeneratedColumn<String> get sellItem =>
      $composableBuilder(column: $table.sellItem, builder: (column) => column);

  GeneratedColumn<String> get groupItemCode => $composableBuilder(
    column: $table.groupItemCode,
    builder: (column) => column,
  );

  GeneratedColumn<String> get categoryItemCode => $composableBuilder(
    column: $table.categoryItemCode,
    builder: (column) => column,
  );

  GeneratedColumn<String> get waitingTime => $composableBuilder(
    column: $table.waitingTime,
    builder: (column) => column,
  );

  GeneratedColumn<double> get rating =>
      $composableBuilder(column: $table.rating, builder: (column) => column);

  Expression<T> productMaterialRelationsRefs<T extends Object>(
    Expression<T> Function($$ProductMaterialRelationsTableAnnotationComposer a)
    f,
  ) {
    final $$ProductMaterialRelationsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.productMaterialRelations,
          getReferencedColumn: (t) => t.productId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ProductMaterialRelationsTableAnnotationComposer(
                $db: $db,
                $table: $db.productMaterialRelations,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$ProductsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ProductsTable,
          ProductEntity,
          $$ProductsTableFilterComposer,
          $$ProductsTableOrderingComposer,
          $$ProductsTableAnnotationComposer,
          $$ProductsTableCreateCompanionBuilder,
          $$ProductsTableUpdateCompanionBuilder,
          (ProductEntity, $$ProductsTableReferences),
          ProductEntity,
          PrefetchHooks Function({bool productMaterialRelationsRefs})
        > {
  $$ProductsTableTableManager(_$AppDatabase db, $ProductsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProductsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProductsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProductsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String?> itemCode = const Value.absent(),
                Value<String> itemName = const Value.absent(),
                Value<double> price = const Value.absent(),
                Value<String> available = const Value.absent(),
                Value<String> enabled = const Value.absent(),
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
                Value<double?> rating = const Value.absent(),
              }) => ProductsCompanion(
                id: id,
                itemCode: itemCode,
                itemName: itemName,
                price: price,
                available: available,
                enabled: enabled,
                eanCode: eanCode,
                frgnName: frgnName,
                discount: discount,
                imageUrl: imageUrl,
                description: description,
                frgnDescription: frgnDescription,
                sellItem: sellItem,
                groupItemCode: groupItemCode,
                categoryItemCode: categoryItemCode,
                waitingTime: waitingTime,
                rating: rating,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String?> itemCode = const Value.absent(),
                required String itemName,
                required double price,
                required String available,
                required String enabled,
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
                Value<double?> rating = const Value.absent(),
              }) => ProductsCompanion.insert(
                id: id,
                itemCode: itemCode,
                itemName: itemName,
                price: price,
                available: available,
                enabled: enabled,
                eanCode: eanCode,
                frgnName: frgnName,
                discount: discount,
                imageUrl: imageUrl,
                description: description,
                frgnDescription: frgnDescription,
                sellItem: sellItem,
                groupItemCode: groupItemCode,
                categoryItemCode: categoryItemCode,
                waitingTime: waitingTime,
                rating: rating,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ProductsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({productMaterialRelationsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (productMaterialRelationsRefs) db.productMaterialRelations,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (productMaterialRelationsRefs)
                    await $_getPrefetchedData<
                      ProductEntity,
                      $ProductsTable,
                      ProductMaterialRelation
                    >(
                      currentTable: table,
                      referencedTable: $$ProductsTableReferences
                          ._productMaterialRelationsRefsTable(db),
                      managerFromTypedResult: (p0) => $$ProductsTableReferences(
                        db,
                        table,
                        p0,
                      ).productMaterialRelationsRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.productId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$ProductsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ProductsTable,
      ProductEntity,
      $$ProductsTableFilterComposer,
      $$ProductsTableOrderingComposer,
      $$ProductsTableAnnotationComposer,
      $$ProductsTableCreateCompanionBuilder,
      $$ProductsTableUpdateCompanionBuilder,
      (ProductEntity, $$ProductsTableReferences),
      ProductEntity,
      PrefetchHooks Function({bool productMaterialRelationsRefs})
    >;
typedef $$ProductMaterialsTableCreateCompanionBuilder =
    ProductMaterialsCompanion Function({
      Value<int> id,
      required String itemCode,
      Value<String?> itemName,
      required double quantity,
      Value<String?> imageUrl,
      Value<String?> isPrimary,
      Value<String?> productItemCode,
      Value<String?> isCustomizable,
    });
typedef $$ProductMaterialsTableUpdateCompanionBuilder =
    ProductMaterialsCompanion Function({
      Value<int> id,
      Value<String> itemCode,
      Value<String?> itemName,
      Value<double> quantity,
      Value<String?> imageUrl,
      Value<String?> isPrimary,
      Value<String?> productItemCode,
      Value<String?> isCustomizable,
    });

final class $$ProductMaterialsTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $ProductMaterialsTable,
          ProductMaterialEntity
        > {
  $$ProductMaterialsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<
    $ProductMaterialRelationsTable,
    List<ProductMaterialRelation>
  >
  _productMaterialRelationsRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.productMaterialRelations,
        aliasName: $_aliasNameGenerator(
          db.productMaterials.id,
          db.productMaterialRelations.materialId,
        ),
      );

  $$ProductMaterialRelationsTableProcessedTableManager
  get productMaterialRelationsRefs {
    final manager = $$ProductMaterialRelationsTableTableManager(
      $_db,
      $_db.productMaterialRelations,
    ).filter((f) => f.materialId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _productMaterialRelationsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ProductMaterialsTableFilterComposer
    extends Composer<_$AppDatabase, $ProductMaterialsTable> {
  $$ProductMaterialsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get itemCode => $composableBuilder(
    column: $table.itemCode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get itemName => $composableBuilder(
    column: $table.itemName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get quantity => $composableBuilder(
    column: $table.quantity,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get imageUrl => $composableBuilder(
    column: $table.imageUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get isPrimary => $composableBuilder(
    column: $table.isPrimary,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get productItemCode => $composableBuilder(
    column: $table.productItemCode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get isCustomizable => $composableBuilder(
    column: $table.isCustomizable,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> productMaterialRelationsRefs(
    Expression<bool> Function($$ProductMaterialRelationsTableFilterComposer f)
    f,
  ) {
    final $$ProductMaterialRelationsTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.productMaterialRelations,
          getReferencedColumn: (t) => t.materialId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ProductMaterialRelationsTableFilterComposer(
                $db: $db,
                $table: $db.productMaterialRelations,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$ProductMaterialsTableOrderingComposer
    extends Composer<_$AppDatabase, $ProductMaterialsTable> {
  $$ProductMaterialsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get itemCode => $composableBuilder(
    column: $table.itemCode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get itemName => $composableBuilder(
    column: $table.itemName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get quantity => $composableBuilder(
    column: $table.quantity,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get imageUrl => $composableBuilder(
    column: $table.imageUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get isPrimary => $composableBuilder(
    column: $table.isPrimary,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get productItemCode => $composableBuilder(
    column: $table.productItemCode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get isCustomizable => $composableBuilder(
    column: $table.isCustomizable,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ProductMaterialsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProductMaterialsTable> {
  $$ProductMaterialsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get itemCode =>
      $composableBuilder(column: $table.itemCode, builder: (column) => column);

  GeneratedColumn<String> get itemName =>
      $composableBuilder(column: $table.itemName, builder: (column) => column);

  GeneratedColumn<double> get quantity =>
      $composableBuilder(column: $table.quantity, builder: (column) => column);

  GeneratedColumn<String> get imageUrl =>
      $composableBuilder(column: $table.imageUrl, builder: (column) => column);

  GeneratedColumn<String> get isPrimary =>
      $composableBuilder(column: $table.isPrimary, builder: (column) => column);

  GeneratedColumn<String> get productItemCode => $composableBuilder(
    column: $table.productItemCode,
    builder: (column) => column,
  );

  GeneratedColumn<String> get isCustomizable => $composableBuilder(
    column: $table.isCustomizable,
    builder: (column) => column,
  );

  Expression<T> productMaterialRelationsRefs<T extends Object>(
    Expression<T> Function($$ProductMaterialRelationsTableAnnotationComposer a)
    f,
  ) {
    final $$ProductMaterialRelationsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.productMaterialRelations,
          getReferencedColumn: (t) => t.materialId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ProductMaterialRelationsTableAnnotationComposer(
                $db: $db,
                $table: $db.productMaterialRelations,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$ProductMaterialsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ProductMaterialsTable,
          ProductMaterialEntity,
          $$ProductMaterialsTableFilterComposer,
          $$ProductMaterialsTableOrderingComposer,
          $$ProductMaterialsTableAnnotationComposer,
          $$ProductMaterialsTableCreateCompanionBuilder,
          $$ProductMaterialsTableUpdateCompanionBuilder,
          (ProductMaterialEntity, $$ProductMaterialsTableReferences),
          ProductMaterialEntity,
          PrefetchHooks Function({bool productMaterialRelationsRefs})
        > {
  $$ProductMaterialsTableTableManager(
    _$AppDatabase db,
    $ProductMaterialsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProductMaterialsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProductMaterialsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProductMaterialsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> itemCode = const Value.absent(),
                Value<String?> itemName = const Value.absent(),
                Value<double> quantity = const Value.absent(),
                Value<String?> imageUrl = const Value.absent(),
                Value<String?> isPrimary = const Value.absent(),
                Value<String?> productItemCode = const Value.absent(),
                Value<String?> isCustomizable = const Value.absent(),
              }) => ProductMaterialsCompanion(
                id: id,
                itemCode: itemCode,
                itemName: itemName,
                quantity: quantity,
                imageUrl: imageUrl,
                isPrimary: isPrimary,
                productItemCode: productItemCode,
                isCustomizable: isCustomizable,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String itemCode,
                Value<String?> itemName = const Value.absent(),
                required double quantity,
                Value<String?> imageUrl = const Value.absent(),
                Value<String?> isPrimary = const Value.absent(),
                Value<String?> productItemCode = const Value.absent(),
                Value<String?> isCustomizable = const Value.absent(),
              }) => ProductMaterialsCompanion.insert(
                id: id,
                itemCode: itemCode,
                itemName: itemName,
                quantity: quantity,
                imageUrl: imageUrl,
                isPrimary: isPrimary,
                productItemCode: productItemCode,
                isCustomizable: isCustomizable,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ProductMaterialsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({productMaterialRelationsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (productMaterialRelationsRefs) db.productMaterialRelations,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (productMaterialRelationsRefs)
                    await $_getPrefetchedData<
                      ProductMaterialEntity,
                      $ProductMaterialsTable,
                      ProductMaterialRelation
                    >(
                      currentTable: table,
                      referencedTable: $$ProductMaterialsTableReferences
                          ._productMaterialRelationsRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$ProductMaterialsTableReferences(
                            db,
                            table,
                            p0,
                          ).productMaterialRelationsRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.materialId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$ProductMaterialsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ProductMaterialsTable,
      ProductMaterialEntity,
      $$ProductMaterialsTableFilterComposer,
      $$ProductMaterialsTableOrderingComposer,
      $$ProductMaterialsTableAnnotationComposer,
      $$ProductMaterialsTableCreateCompanionBuilder,
      $$ProductMaterialsTableUpdateCompanionBuilder,
      (ProductMaterialEntity, $$ProductMaterialsTableReferences),
      ProductMaterialEntity,
      PrefetchHooks Function({bool productMaterialRelationsRefs})
    >;
typedef $$CategoryAccompanimentsTableCreateCompanionBuilder =
    CategoryAccompanimentsCompanion Function({
      Value<int> id,
      required int lineNumber,
      required String accompanimentItemCode,
      required String accompanimentItemName,
      Value<String?> accompanimentImageUrl,
      required double accompanimentPrice,
      required double discount,
      Value<String?> enlargementItemCode,
      required double enlargementDiscount,
      Value<String?> categoryItemCode,
    });
typedef $$CategoryAccompanimentsTableUpdateCompanionBuilder =
    CategoryAccompanimentsCompanion Function({
      Value<int> id,
      Value<int> lineNumber,
      Value<String> accompanimentItemCode,
      Value<String> accompanimentItemName,
      Value<String?> accompanimentImageUrl,
      Value<double> accompanimentPrice,
      Value<double> discount,
      Value<String?> enlargementItemCode,
      Value<double> enlargementDiscount,
      Value<String?> categoryItemCode,
    });

final class $$CategoryAccompanimentsTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $CategoryAccompanimentsTable,
          CategoryAccompanimentEntity
        > {
  $$CategoryAccompanimentsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<
    $CategoryAccompanimentRelationsTable,
    List<CategoryAccompanimentRelation>
  >
  _categoryAccompanimentRelationsRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.categoryAccompanimentRelations,
        aliasName: $_aliasNameGenerator(
          db.categoryAccompaniments.id,
          db.categoryAccompanimentRelations.accompanimentId,
        ),
      );

  $$CategoryAccompanimentRelationsTableProcessedTableManager
  get categoryAccompanimentRelationsRefs {
    final manager = $$CategoryAccompanimentRelationsTableTableManager(
      $_db,
      $_db.categoryAccompanimentRelations,
    ).filter((f) => f.accompanimentId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _categoryAccompanimentRelationsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$CategoryAccompanimentsTableFilterComposer
    extends Composer<_$AppDatabase, $CategoryAccompanimentsTable> {
  $$CategoryAccompanimentsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get lineNumber => $composableBuilder(
    column: $table.lineNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get accompanimentItemCode => $composableBuilder(
    column: $table.accompanimentItemCode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get accompanimentItemName => $composableBuilder(
    column: $table.accompanimentItemName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get accompanimentImageUrl => $composableBuilder(
    column: $table.accompanimentImageUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get accompanimentPrice => $composableBuilder(
    column: $table.accompanimentPrice,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get discount => $composableBuilder(
    column: $table.discount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get enlargementItemCode => $composableBuilder(
    column: $table.enlargementItemCode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get enlargementDiscount => $composableBuilder(
    column: $table.enlargementDiscount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get categoryItemCode => $composableBuilder(
    column: $table.categoryItemCode,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> categoryAccompanimentRelationsRefs(
    Expression<bool> Function(
      $$CategoryAccompanimentRelationsTableFilterComposer f,
    )
    f,
  ) {
    final $$CategoryAccompanimentRelationsTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.categoryAccompanimentRelations,
          getReferencedColumn: (t) => t.accompanimentId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$CategoryAccompanimentRelationsTableFilterComposer(
                $db: $db,
                $table: $db.categoryAccompanimentRelations,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$CategoryAccompanimentsTableOrderingComposer
    extends Composer<_$AppDatabase, $CategoryAccompanimentsTable> {
  $$CategoryAccompanimentsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get lineNumber => $composableBuilder(
    column: $table.lineNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get accompanimentItemCode => $composableBuilder(
    column: $table.accompanimentItemCode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get accompanimentItemName => $composableBuilder(
    column: $table.accompanimentItemName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get accompanimentImageUrl => $composableBuilder(
    column: $table.accompanimentImageUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get accompanimentPrice => $composableBuilder(
    column: $table.accompanimentPrice,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get discount => $composableBuilder(
    column: $table.discount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get enlargementItemCode => $composableBuilder(
    column: $table.enlargementItemCode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get enlargementDiscount => $composableBuilder(
    column: $table.enlargementDiscount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get categoryItemCode => $composableBuilder(
    column: $table.categoryItemCode,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CategoryAccompanimentsTableAnnotationComposer
    extends Composer<_$AppDatabase, $CategoryAccompanimentsTable> {
  $$CategoryAccompanimentsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get lineNumber => $composableBuilder(
    column: $table.lineNumber,
    builder: (column) => column,
  );

  GeneratedColumn<String> get accompanimentItemCode => $composableBuilder(
    column: $table.accompanimentItemCode,
    builder: (column) => column,
  );

  GeneratedColumn<String> get accompanimentItemName => $composableBuilder(
    column: $table.accompanimentItemName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get accompanimentImageUrl => $composableBuilder(
    column: $table.accompanimentImageUrl,
    builder: (column) => column,
  );

  GeneratedColumn<double> get accompanimentPrice => $composableBuilder(
    column: $table.accompanimentPrice,
    builder: (column) => column,
  );

  GeneratedColumn<double> get discount =>
      $composableBuilder(column: $table.discount, builder: (column) => column);

  GeneratedColumn<String> get enlargementItemCode => $composableBuilder(
    column: $table.enlargementItemCode,
    builder: (column) => column,
  );

  GeneratedColumn<double> get enlargementDiscount => $composableBuilder(
    column: $table.enlargementDiscount,
    builder: (column) => column,
  );

  GeneratedColumn<String> get categoryItemCode => $composableBuilder(
    column: $table.categoryItemCode,
    builder: (column) => column,
  );

  Expression<T> categoryAccompanimentRelationsRefs<T extends Object>(
    Expression<T> Function(
      $$CategoryAccompanimentRelationsTableAnnotationComposer a,
    )
    f,
  ) {
    final $$CategoryAccompanimentRelationsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.categoryAccompanimentRelations,
          getReferencedColumn: (t) => t.accompanimentId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$CategoryAccompanimentRelationsTableAnnotationComposer(
                $db: $db,
                $table: $db.categoryAccompanimentRelations,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$CategoryAccompanimentsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CategoryAccompanimentsTable,
          CategoryAccompanimentEntity,
          $$CategoryAccompanimentsTableFilterComposer,
          $$CategoryAccompanimentsTableOrderingComposer,
          $$CategoryAccompanimentsTableAnnotationComposer,
          $$CategoryAccompanimentsTableCreateCompanionBuilder,
          $$CategoryAccompanimentsTableUpdateCompanionBuilder,
          (
            CategoryAccompanimentEntity,
            $$CategoryAccompanimentsTableReferences,
          ),
          CategoryAccompanimentEntity,
          PrefetchHooks Function({bool categoryAccompanimentRelationsRefs})
        > {
  $$CategoryAccompanimentsTableTableManager(
    _$AppDatabase db,
    $CategoryAccompanimentsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CategoryAccompanimentsTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$CategoryAccompanimentsTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$CategoryAccompanimentsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> lineNumber = const Value.absent(),
                Value<String> accompanimentItemCode = const Value.absent(),
                Value<String> accompanimentItemName = const Value.absent(),
                Value<String?> accompanimentImageUrl = const Value.absent(),
                Value<double> accompanimentPrice = const Value.absent(),
                Value<double> discount = const Value.absent(),
                Value<String?> enlargementItemCode = const Value.absent(),
                Value<double> enlargementDiscount = const Value.absent(),
                Value<String?> categoryItemCode = const Value.absent(),
              }) => CategoryAccompanimentsCompanion(
                id: id,
                lineNumber: lineNumber,
                accompanimentItemCode: accompanimentItemCode,
                accompanimentItemName: accompanimentItemName,
                accompanimentImageUrl: accompanimentImageUrl,
                accompanimentPrice: accompanimentPrice,
                discount: discount,
                enlargementItemCode: enlargementItemCode,
                enlargementDiscount: enlargementDiscount,
                categoryItemCode: categoryItemCode,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int lineNumber,
                required String accompanimentItemCode,
                required String accompanimentItemName,
                Value<String?> accompanimentImageUrl = const Value.absent(),
                required double accompanimentPrice,
                required double discount,
                Value<String?> enlargementItemCode = const Value.absent(),
                required double enlargementDiscount,
                Value<String?> categoryItemCode = const Value.absent(),
              }) => CategoryAccompanimentsCompanion.insert(
                id: id,
                lineNumber: lineNumber,
                accompanimentItemCode: accompanimentItemCode,
                accompanimentItemName: accompanimentItemName,
                accompanimentImageUrl: accompanimentImageUrl,
                accompanimentPrice: accompanimentPrice,
                discount: discount,
                enlargementItemCode: enlargementItemCode,
                enlargementDiscount: enlargementDiscount,
                categoryItemCode: categoryItemCode,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$CategoryAccompanimentsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({categoryAccompanimentRelationsRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (categoryAccompanimentRelationsRefs)
                      db.categoryAccompanimentRelations,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (categoryAccompanimentRelationsRefs)
                        await $_getPrefetchedData<
                          CategoryAccompanimentEntity,
                          $CategoryAccompanimentsTable,
                          CategoryAccompanimentRelation
                        >(
                          currentTable: table,
                          referencedTable:
                              $$CategoryAccompanimentsTableReferences
                                  ._categoryAccompanimentRelationsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$CategoryAccompanimentsTableReferences(
                                db,
                                table,
                                p0,
                              ).categoryAccompanimentRelationsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.accompanimentId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$CategoryAccompanimentsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CategoryAccompanimentsTable,
      CategoryAccompanimentEntity,
      $$CategoryAccompanimentsTableFilterComposer,
      $$CategoryAccompanimentsTableOrderingComposer,
      $$CategoryAccompanimentsTableAnnotationComposer,
      $$CategoryAccompanimentsTableCreateCompanionBuilder,
      $$CategoryAccompanimentsTableUpdateCompanionBuilder,
      (CategoryAccompanimentEntity, $$CategoryAccompanimentsTableReferences),
      CategoryAccompanimentEntity,
      PrefetchHooks Function({bool categoryAccompanimentRelationsRefs})
    >;
typedef $$ProductCategoriesTableCreateCompanionBuilder =
    ProductCategoriesCompanion Function({
      Value<int> id,
      required String categoryItemCode,
      required String categoryItemName,
      required String enabled,
      required String dataSource,
      required int visOrder,
      Value<String?> frgnName,
      Value<String?> imageUrl,
      Value<String?> description,
      Value<String?> frgnDescription,
      Value<String?> groupItemCode,
    });
typedef $$ProductCategoriesTableUpdateCompanionBuilder =
    ProductCategoriesCompanion Function({
      Value<int> id,
      Value<String> categoryItemCode,
      Value<String> categoryItemName,
      Value<String> enabled,
      Value<String> dataSource,
      Value<int> visOrder,
      Value<String?> frgnName,
      Value<String?> imageUrl,
      Value<String?> description,
      Value<String?> frgnDescription,
      Value<String?> groupItemCode,
    });

final class $$ProductCategoriesTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $ProductCategoriesTable,
          ProductCategoryEntity
        > {
  $$ProductCategoriesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<
    $CategoryAccompanimentRelationsTable,
    List<CategoryAccompanimentRelation>
  >
  _categoryAccompanimentRelationsRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.categoryAccompanimentRelations,
        aliasName: $_aliasNameGenerator(
          db.productCategories.id,
          db.categoryAccompanimentRelations.categoryId,
        ),
      );

  $$CategoryAccompanimentRelationsTableProcessedTableManager
  get categoryAccompanimentRelationsRefs {
    final manager = $$CategoryAccompanimentRelationsTableTableManager(
      $_db,
      $_db.categoryAccompanimentRelations,
    ).filter((f) => f.categoryId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _categoryAccompanimentRelationsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ProductCategoriesTableFilterComposer
    extends Composer<_$AppDatabase, $ProductCategoriesTable> {
  $$ProductCategoriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get categoryItemCode => $composableBuilder(
    column: $table.categoryItemCode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get categoryItemName => $composableBuilder(
    column: $table.categoryItemName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get enabled => $composableBuilder(
    column: $table.enabled,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get dataSource => $composableBuilder(
    column: $table.dataSource,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get visOrder => $composableBuilder(
    column: $table.visOrder,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get frgnName => $composableBuilder(
    column: $table.frgnName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get imageUrl => $composableBuilder(
    column: $table.imageUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get frgnDescription => $composableBuilder(
    column: $table.frgnDescription,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get groupItemCode => $composableBuilder(
    column: $table.groupItemCode,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> categoryAccompanimentRelationsRefs(
    Expression<bool> Function(
      $$CategoryAccompanimentRelationsTableFilterComposer f,
    )
    f,
  ) {
    final $$CategoryAccompanimentRelationsTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.categoryAccompanimentRelations,
          getReferencedColumn: (t) => t.categoryId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$CategoryAccompanimentRelationsTableFilterComposer(
                $db: $db,
                $table: $db.categoryAccompanimentRelations,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$ProductCategoriesTableOrderingComposer
    extends Composer<_$AppDatabase, $ProductCategoriesTable> {
  $$ProductCategoriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get categoryItemCode => $composableBuilder(
    column: $table.categoryItemCode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get categoryItemName => $composableBuilder(
    column: $table.categoryItemName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get enabled => $composableBuilder(
    column: $table.enabled,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get dataSource => $composableBuilder(
    column: $table.dataSource,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get visOrder => $composableBuilder(
    column: $table.visOrder,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get frgnName => $composableBuilder(
    column: $table.frgnName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get imageUrl => $composableBuilder(
    column: $table.imageUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get frgnDescription => $composableBuilder(
    column: $table.frgnDescription,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get groupItemCode => $composableBuilder(
    column: $table.groupItemCode,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ProductCategoriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProductCategoriesTable> {
  $$ProductCategoriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get categoryItemCode => $composableBuilder(
    column: $table.categoryItemCode,
    builder: (column) => column,
  );

  GeneratedColumn<String> get categoryItemName => $composableBuilder(
    column: $table.categoryItemName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get enabled =>
      $composableBuilder(column: $table.enabled, builder: (column) => column);

  GeneratedColumn<String> get dataSource => $composableBuilder(
    column: $table.dataSource,
    builder: (column) => column,
  );

  GeneratedColumn<int> get visOrder =>
      $composableBuilder(column: $table.visOrder, builder: (column) => column);

  GeneratedColumn<String> get frgnName =>
      $composableBuilder(column: $table.frgnName, builder: (column) => column);

  GeneratedColumn<String> get imageUrl =>
      $composableBuilder(column: $table.imageUrl, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get frgnDescription => $composableBuilder(
    column: $table.frgnDescription,
    builder: (column) => column,
  );

  GeneratedColumn<String> get groupItemCode => $composableBuilder(
    column: $table.groupItemCode,
    builder: (column) => column,
  );

  Expression<T> categoryAccompanimentRelationsRefs<T extends Object>(
    Expression<T> Function(
      $$CategoryAccompanimentRelationsTableAnnotationComposer a,
    )
    f,
  ) {
    final $$CategoryAccompanimentRelationsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.categoryAccompanimentRelations,
          getReferencedColumn: (t) => t.categoryId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$CategoryAccompanimentRelationsTableAnnotationComposer(
                $db: $db,
                $table: $db.categoryAccompanimentRelations,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$ProductCategoriesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ProductCategoriesTable,
          ProductCategoryEntity,
          $$ProductCategoriesTableFilterComposer,
          $$ProductCategoriesTableOrderingComposer,
          $$ProductCategoriesTableAnnotationComposer,
          $$ProductCategoriesTableCreateCompanionBuilder,
          $$ProductCategoriesTableUpdateCompanionBuilder,
          (ProductCategoryEntity, $$ProductCategoriesTableReferences),
          ProductCategoryEntity,
          PrefetchHooks Function({bool categoryAccompanimentRelationsRefs})
        > {
  $$ProductCategoriesTableTableManager(
    _$AppDatabase db,
    $ProductCategoriesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProductCategoriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProductCategoriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProductCategoriesTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> categoryItemCode = const Value.absent(),
                Value<String> categoryItemName = const Value.absent(),
                Value<String> enabled = const Value.absent(),
                Value<String> dataSource = const Value.absent(),
                Value<int> visOrder = const Value.absent(),
                Value<String?> frgnName = const Value.absent(),
                Value<String?> imageUrl = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String?> frgnDescription = const Value.absent(),
                Value<String?> groupItemCode = const Value.absent(),
              }) => ProductCategoriesCompanion(
                id: id,
                categoryItemCode: categoryItemCode,
                categoryItemName: categoryItemName,
                enabled: enabled,
                dataSource: dataSource,
                visOrder: visOrder,
                frgnName: frgnName,
                imageUrl: imageUrl,
                description: description,
                frgnDescription: frgnDescription,
                groupItemCode: groupItemCode,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String categoryItemCode,
                required String categoryItemName,
                required String enabled,
                required String dataSource,
                required int visOrder,
                Value<String?> frgnName = const Value.absent(),
                Value<String?> imageUrl = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String?> frgnDescription = const Value.absent(),
                Value<String?> groupItemCode = const Value.absent(),
              }) => ProductCategoriesCompanion.insert(
                id: id,
                categoryItemCode: categoryItemCode,
                categoryItemName: categoryItemName,
                enabled: enabled,
                dataSource: dataSource,
                visOrder: visOrder,
                frgnName: frgnName,
                imageUrl: imageUrl,
                description: description,
                frgnDescription: frgnDescription,
                groupItemCode: groupItemCode,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ProductCategoriesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({categoryAccompanimentRelationsRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (categoryAccompanimentRelationsRefs)
                      db.categoryAccompanimentRelations,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (categoryAccompanimentRelationsRefs)
                        await $_getPrefetchedData<
                          ProductCategoryEntity,
                          $ProductCategoriesTable,
                          CategoryAccompanimentRelation
                        >(
                          currentTable: table,
                          referencedTable: $$ProductCategoriesTableReferences
                              ._categoryAccompanimentRelationsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ProductCategoriesTableReferences(
                                db,
                                table,
                                p0,
                              ).categoryAccompanimentRelationsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.categoryId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$ProductCategoriesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ProductCategoriesTable,
      ProductCategoryEntity,
      $$ProductCategoriesTableFilterComposer,
      $$ProductCategoriesTableOrderingComposer,
      $$ProductCategoriesTableAnnotationComposer,
      $$ProductCategoriesTableCreateCompanionBuilder,
      $$ProductCategoriesTableUpdateCompanionBuilder,
      (ProductCategoryEntity, $$ProductCategoriesTableReferences),
      ProductCategoryEntity,
      PrefetchHooks Function({bool categoryAccompanimentRelationsRefs})
    >;
typedef $$ProductMaterialRelationsTableCreateCompanionBuilder =
    ProductMaterialRelationsCompanion Function({
      required int productId,
      required int materialId,
      Value<int> rowid,
    });
typedef $$ProductMaterialRelationsTableUpdateCompanionBuilder =
    ProductMaterialRelationsCompanion Function({
      Value<int> productId,
      Value<int> materialId,
      Value<int> rowid,
    });

final class $$ProductMaterialRelationsTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $ProductMaterialRelationsTable,
          ProductMaterialRelation
        > {
  $$ProductMaterialRelationsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $ProductsTable _productIdTable(_$AppDatabase db) =>
      db.products.createAlias(
        $_aliasNameGenerator(
          db.productMaterialRelations.productId,
          db.products.id,
        ),
      );

  $$ProductsTableProcessedTableManager get productId {
    final $_column = $_itemColumn<int>('product_id')!;

    final manager = $$ProductsTableTableManager(
      $_db,
      $_db.products,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_productIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $ProductMaterialsTable _materialIdTable(_$AppDatabase db) =>
      db.productMaterials.createAlias(
        $_aliasNameGenerator(
          db.productMaterialRelations.materialId,
          db.productMaterials.id,
        ),
      );

  $$ProductMaterialsTableProcessedTableManager get materialId {
    final $_column = $_itemColumn<int>('material_id')!;

    final manager = $$ProductMaterialsTableTableManager(
      $_db,
      $_db.productMaterials,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_materialIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ProductMaterialRelationsTableFilterComposer
    extends Composer<_$AppDatabase, $ProductMaterialRelationsTable> {
  $$ProductMaterialRelationsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$ProductsTableFilterComposer get productId {
    final $$ProductsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.productId,
      referencedTable: $db.products,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductsTableFilterComposer(
            $db: $db,
            $table: $db.products,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ProductMaterialsTableFilterComposer get materialId {
    final $$ProductMaterialsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.materialId,
      referencedTable: $db.productMaterials,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductMaterialsTableFilterComposer(
            $db: $db,
            $table: $db.productMaterials,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ProductMaterialRelationsTableOrderingComposer
    extends Composer<_$AppDatabase, $ProductMaterialRelationsTable> {
  $$ProductMaterialRelationsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$ProductsTableOrderingComposer get productId {
    final $$ProductsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.productId,
      referencedTable: $db.products,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductsTableOrderingComposer(
            $db: $db,
            $table: $db.products,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ProductMaterialsTableOrderingComposer get materialId {
    final $$ProductMaterialsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.materialId,
      referencedTable: $db.productMaterials,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductMaterialsTableOrderingComposer(
            $db: $db,
            $table: $db.productMaterials,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ProductMaterialRelationsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProductMaterialRelationsTable> {
  $$ProductMaterialRelationsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$ProductsTableAnnotationComposer get productId {
    final $$ProductsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.productId,
      referencedTable: $db.products,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductsTableAnnotationComposer(
            $db: $db,
            $table: $db.products,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ProductMaterialsTableAnnotationComposer get materialId {
    final $$ProductMaterialsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.materialId,
      referencedTable: $db.productMaterials,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductMaterialsTableAnnotationComposer(
            $db: $db,
            $table: $db.productMaterials,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ProductMaterialRelationsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ProductMaterialRelationsTable,
          ProductMaterialRelation,
          $$ProductMaterialRelationsTableFilterComposer,
          $$ProductMaterialRelationsTableOrderingComposer,
          $$ProductMaterialRelationsTableAnnotationComposer,
          $$ProductMaterialRelationsTableCreateCompanionBuilder,
          $$ProductMaterialRelationsTableUpdateCompanionBuilder,
          (ProductMaterialRelation, $$ProductMaterialRelationsTableReferences),
          ProductMaterialRelation,
          PrefetchHooks Function({bool productId, bool materialId})
        > {
  $$ProductMaterialRelationsTableTableManager(
    _$AppDatabase db,
    $ProductMaterialRelationsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProductMaterialRelationsTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$ProductMaterialRelationsTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$ProductMaterialRelationsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> productId = const Value.absent(),
                Value<int> materialId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ProductMaterialRelationsCompanion(
                productId: productId,
                materialId: materialId,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required int productId,
                required int materialId,
                Value<int> rowid = const Value.absent(),
              }) => ProductMaterialRelationsCompanion.insert(
                productId: productId,
                materialId: materialId,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ProductMaterialRelationsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({productId = false, materialId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (productId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.productId,
                                referencedTable:
                                    $$ProductMaterialRelationsTableReferences
                                        ._productIdTable(db),
                                referencedColumn:
                                    $$ProductMaterialRelationsTableReferences
                                        ._productIdTable(db)
                                        .id,
                              )
                              as T;
                    }
                    if (materialId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.materialId,
                                referencedTable:
                                    $$ProductMaterialRelationsTableReferences
                                        ._materialIdTable(db),
                                referencedColumn:
                                    $$ProductMaterialRelationsTableReferences
                                        ._materialIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$ProductMaterialRelationsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ProductMaterialRelationsTable,
      ProductMaterialRelation,
      $$ProductMaterialRelationsTableFilterComposer,
      $$ProductMaterialRelationsTableOrderingComposer,
      $$ProductMaterialRelationsTableAnnotationComposer,
      $$ProductMaterialRelationsTableCreateCompanionBuilder,
      $$ProductMaterialRelationsTableUpdateCompanionBuilder,
      (ProductMaterialRelation, $$ProductMaterialRelationsTableReferences),
      ProductMaterialRelation,
      PrefetchHooks Function({bool productId, bool materialId})
    >;
typedef $$CategoryAccompanimentRelationsTableCreateCompanionBuilder =
    CategoryAccompanimentRelationsCompanion Function({
      required int categoryId,
      required int accompanimentId,
      Value<int> rowid,
    });
typedef $$CategoryAccompanimentRelationsTableUpdateCompanionBuilder =
    CategoryAccompanimentRelationsCompanion Function({
      Value<int> categoryId,
      Value<int> accompanimentId,
      Value<int> rowid,
    });

final class $$CategoryAccompanimentRelationsTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $CategoryAccompanimentRelationsTable,
          CategoryAccompanimentRelation
        > {
  $$CategoryAccompanimentRelationsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $ProductCategoriesTable _categoryIdTable(_$AppDatabase db) =>
      db.productCategories.createAlias(
        $_aliasNameGenerator(
          db.categoryAccompanimentRelations.categoryId,
          db.productCategories.id,
        ),
      );

  $$ProductCategoriesTableProcessedTableManager get categoryId {
    final $_column = $_itemColumn<int>('category_id')!;

    final manager = $$ProductCategoriesTableTableManager(
      $_db,
      $_db.productCategories,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_categoryIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $CategoryAccompanimentsTable _accompanimentIdTable(_$AppDatabase db) =>
      db.categoryAccompaniments.createAlias(
        $_aliasNameGenerator(
          db.categoryAccompanimentRelations.accompanimentId,
          db.categoryAccompaniments.id,
        ),
      );

  $$CategoryAccompanimentsTableProcessedTableManager get accompanimentId {
    final $_column = $_itemColumn<int>('accompaniment_id')!;

    final manager = $$CategoryAccompanimentsTableTableManager(
      $_db,
      $_db.categoryAccompaniments,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_accompanimentIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$CategoryAccompanimentRelationsTableFilterComposer
    extends Composer<_$AppDatabase, $CategoryAccompanimentRelationsTable> {
  $$CategoryAccompanimentRelationsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$ProductCategoriesTableFilterComposer get categoryId {
    final $$ProductCategoriesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.categoryId,
      referencedTable: $db.productCategories,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductCategoriesTableFilterComposer(
            $db: $db,
            $table: $db.productCategories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CategoryAccompanimentsTableFilterComposer get accompanimentId {
    final $$CategoryAccompanimentsTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.accompanimentId,
          referencedTable: $db.categoryAccompaniments,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$CategoryAccompanimentsTableFilterComposer(
                $db: $db,
                $table: $db.categoryAccompaniments,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }
}

class $$CategoryAccompanimentRelationsTableOrderingComposer
    extends Composer<_$AppDatabase, $CategoryAccompanimentRelationsTable> {
  $$CategoryAccompanimentRelationsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$ProductCategoriesTableOrderingComposer get categoryId {
    final $$ProductCategoriesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.categoryId,
      referencedTable: $db.productCategories,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductCategoriesTableOrderingComposer(
            $db: $db,
            $table: $db.productCategories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CategoryAccompanimentsTableOrderingComposer get accompanimentId {
    final $$CategoryAccompanimentsTableOrderingComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.accompanimentId,
          referencedTable: $db.categoryAccompaniments,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$CategoryAccompanimentsTableOrderingComposer(
                $db: $db,
                $table: $db.categoryAccompaniments,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }
}

class $$CategoryAccompanimentRelationsTableAnnotationComposer
    extends Composer<_$AppDatabase, $CategoryAccompanimentRelationsTable> {
  $$CategoryAccompanimentRelationsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$ProductCategoriesTableAnnotationComposer get categoryId {
    final $$ProductCategoriesTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.categoryId,
          referencedTable: $db.productCategories,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ProductCategoriesTableAnnotationComposer(
                $db: $db,
                $table: $db.productCategories,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }

  $$CategoryAccompanimentsTableAnnotationComposer get accompanimentId {
    final $$CategoryAccompanimentsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.accompanimentId,
          referencedTable: $db.categoryAccompaniments,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$CategoryAccompanimentsTableAnnotationComposer(
                $db: $db,
                $table: $db.categoryAccompaniments,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }
}

class $$CategoryAccompanimentRelationsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CategoryAccompanimentRelationsTable,
          CategoryAccompanimentRelation,
          $$CategoryAccompanimentRelationsTableFilterComposer,
          $$CategoryAccompanimentRelationsTableOrderingComposer,
          $$CategoryAccompanimentRelationsTableAnnotationComposer,
          $$CategoryAccompanimentRelationsTableCreateCompanionBuilder,
          $$CategoryAccompanimentRelationsTableUpdateCompanionBuilder,
          (
            CategoryAccompanimentRelation,
            $$CategoryAccompanimentRelationsTableReferences,
          ),
          CategoryAccompanimentRelation,
          PrefetchHooks Function({bool categoryId, bool accompanimentId})
        > {
  $$CategoryAccompanimentRelationsTableTableManager(
    _$AppDatabase db,
    $CategoryAccompanimentRelationsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CategoryAccompanimentRelationsTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$CategoryAccompanimentRelationsTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$CategoryAccompanimentRelationsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> categoryId = const Value.absent(),
                Value<int> accompanimentId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CategoryAccompanimentRelationsCompanion(
                categoryId: categoryId,
                accompanimentId: accompanimentId,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required int categoryId,
                required int accompanimentId,
                Value<int> rowid = const Value.absent(),
              }) => CategoryAccompanimentRelationsCompanion.insert(
                categoryId: categoryId,
                accompanimentId: accompanimentId,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$CategoryAccompanimentRelationsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({categoryId = false, accompanimentId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (categoryId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.categoryId,
                                referencedTable:
                                    $$CategoryAccompanimentRelationsTableReferences
                                        ._categoryIdTable(db),
                                referencedColumn:
                                    $$CategoryAccompanimentRelationsTableReferences
                                        ._categoryIdTable(db)
                                        .id,
                              )
                              as T;
                    }
                    if (accompanimentId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.accompanimentId,
                                referencedTable:
                                    $$CategoryAccompanimentRelationsTableReferences
                                        ._accompanimentIdTable(db),
                                referencedColumn:
                                    $$CategoryAccompanimentRelationsTableReferences
                                        ._accompanimentIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$CategoryAccompanimentRelationsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CategoryAccompanimentRelationsTable,
      CategoryAccompanimentRelation,
      $$CategoryAccompanimentRelationsTableFilterComposer,
      $$CategoryAccompanimentRelationsTableOrderingComposer,
      $$CategoryAccompanimentRelationsTableAnnotationComposer,
      $$CategoryAccompanimentRelationsTableCreateCompanionBuilder,
      $$CategoryAccompanimentRelationsTableUpdateCompanionBuilder,
      (
        CategoryAccompanimentRelation,
        $$CategoryAccompanimentRelationsTableReferences,
      ),
      CategoryAccompanimentRelation,
      PrefetchHooks Function({bool categoryId, bool accompanimentId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$ProductsTableTableManager get products =>
      $$ProductsTableTableManager(_db, _db.products);
  $$ProductMaterialsTableTableManager get productMaterials =>
      $$ProductMaterialsTableTableManager(_db, _db.productMaterials);
  $$CategoryAccompanimentsTableTableManager get categoryAccompaniments =>
      $$CategoryAccompanimentsTableTableManager(
        _db,
        _db.categoryAccompaniments,
      );
  $$ProductCategoriesTableTableManager get productCategories =>
      $$ProductCategoriesTableTableManager(_db, _db.productCategories);
  $$ProductMaterialRelationsTableTableManager get productMaterialRelations =>
      $$ProductMaterialRelationsTableTableManager(
        _db,
        _db.productMaterialRelations,
      );
  $$CategoryAccompanimentRelationsTableTableManager
  get categoryAccompanimentRelations =>
      $$CategoryAccompanimentRelationsTableTableManager(
        _db,
        _db.categoryAccompanimentRelations,
      );
}
