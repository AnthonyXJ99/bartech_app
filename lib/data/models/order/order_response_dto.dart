// 📬 ORDER RESPONSE DTO (Lo que devuelve el servidor)
class OrderResponseDto {
  final int? docEntry;
  final String? folioPref;
  final String? folioNum;
  final String? customerCode;
  final String? customerName;
  final String? nickName;
  final String? deviceCode;
  final DateTime? docDate;
  final DateTime? docDueDate;
  final String? docStatus;
  final String? docType;
  final String? paidType;
  final String? transferred;
  final String? printed;
  final double? docRate;
  final double? docTotal;
  final double? docTotalFC;
  final String? comments;
  final List<DocumentLineResponseDto>? orderLines;

  OrderResponseDto({
    this.docEntry,
    this.folioPref,
    this.folioNum,
    this.customerCode,
    this.customerName,
    this.nickName,
    this.deviceCode,
    this.docDate,
    this.docDueDate,
    this.docStatus,
    this.docType,
    this.paidType,
    this.transferred,
    this.printed,
    this.docRate,
    this.docTotal,
    this.docTotalFC,
    this.comments,
    this.orderLines,
  });

  factory OrderResponseDto.fromJson(Map<String, dynamic> json) {
    return OrderResponseDto(
      docEntry: json['docEntry'] as int?,
      folioPref: json['folioPref'] as String?,
      folioNum: json['folioNum'] as String?,
      customerCode: json['customerCode'] as String?,
      customerName: json['customerName'] as String?,
      nickName: json['nickName'] as String?,
      deviceCode: json['deviceCode'] as String?,
      docDate: json['docDate'] != null 
          ? DateTime.parse(json['docDate']) 
          : null,
      docDueDate: json['docDueDate'] != null 
          ? DateTime.parse(json['docDueDate']) 
          : null,
      docStatus: json['docStatus'] as String?,
      docType: json['docType'] as String?,
      paidType: json['paidType'] as String?,
      transferred: json['transferred'] as String?,
      printed: json['printed'] as String?,
      docRate: (json['docRate'] as num?)?.toDouble(),
      docTotal: (json['docTotal'] as num?)?.toDouble(),
      docTotalFC: (json['docTotalFC'] as num?)?.toDouble(),
      comments: json['comments'] as String?,
      orderLines: json['orderLines'] != null
          ? (json['orderLines'] as List)
              .map((e) => DocumentLineResponseDto.fromJson(e))
              .toList()
          : null,
    );
  }
}

// 📋 DOCUMENT LINE RESPONSE DTO
class DocumentLineResponseDto {
  final int? docEntry;
  final int? lineId;
  final String? itemCode;
  final String? itemName;
  final double? quantity;
  final double? price;
  final String? lineStatus;
  final String? taxCode;
  final double? lineTotal;

  DocumentLineResponseDto({
    this.docEntry,
    this.lineId,
    this.itemCode,
    this.itemName,
    this.quantity,
    this.price,
    this.lineStatus,
    this.taxCode,
    this.lineTotal,
  });

  factory DocumentLineResponseDto.fromJson(Map<String, dynamic> json) {
    return DocumentLineResponseDto(
      docEntry: json['docEntry'] as int?,
      lineId: json['lineId'] as int?,
      itemCode: json['itemCode'] as String?,
      itemName: json['itemName'] as String?,
      quantity: (json['quantity'] as num?)?.toDouble(),
      price: (json['price'] as num?)?.toDouble(),
      lineStatus: json['lineStatus'] as String?,
      taxCode: json['taxCode'] as String?,
      lineTotal: (json['lineTotal'] as num?)?.toDouble(),
    );
  }
}

// 📊 PAGINATED RESULT (Para GET /api/Order)
class OrderResponseDtoPaginatedResult {
  final List<OrderResponseDto>? data;
  final int page;
  final int pageSize;
  final int totalRecords;
  final int totalPages;
  final bool hasNextPage;
  final bool hasPreviousPage;
  final String? filter;

  OrderResponseDtoPaginatedResult({
    this.data,
    required this.page,
    required this.pageSize,
    required this.totalRecords,
    required this.totalPages,
    required this.hasNextPage,
    required this.hasPreviousPage,
    this.filter,
  });

  factory OrderResponseDtoPaginatedResult.fromJson(Map<String, dynamic> json) {
    return OrderResponseDtoPaginatedResult(
      data: json['data'] != null
          ? (json['data'] as List)
              .map((e) => OrderResponseDto.fromJson(e))
              .toList()
          : null,
      page: json['page'] as int,
      pageSize: json['pageSize'] as int,
      totalRecords: json['totalRecords'] as int,
      totalPages: json['totalPages'] as int,
      hasNextPage: json['hasNextPage'] as bool,
      hasPreviousPage: json['hasPreviousPage'] as bool,
      filter: json['filter'] as String?,
    );
  }
}