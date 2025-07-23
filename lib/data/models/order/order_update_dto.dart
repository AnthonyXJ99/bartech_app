// =================================================================
// 📝 ORDER UPDATE DTO (para actualizaciones)
// =================================================================
class OrderUpdateDto {
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

  OrderUpdateDto({
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
  });

  Map<String, dynamic> toJson() => {
        if (folioPref != null) 'folioPref': folioPref,
        if (folioNum != null) 'folioNum': folioNum,
        if (customerCode != null) 'customerCode': customerCode,
        if (customerName != null) 'customerName': customerName,
        if (nickName != null) 'nickName': nickName,
        if (deviceCode != null) 'deviceCode': deviceCode,
        if (docDate != null) 'docDate': docDate!.toIso8601String(),
        if (docDueDate != null) 'docDueDate': docDueDate!.toIso8601String(),
        if (docStatus != null) 'docStatus': docStatus,
        if (docType != null) 'docType': docType,
        if (paidType != null) 'paidType': paidType,
        if (transferred != null) 'transferred': transferred,
        if (printed != null) 'printed': printed,
        if (docRate != null) 'docRate': docRate,
        if (docTotal != null) 'docTotal': docTotal,
        if (docTotalFC != null) 'docTotalFC': docTotalFC,
        if (comments != null) 'comments': comments,
      };
}