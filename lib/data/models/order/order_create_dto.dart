import 'package:bartech_app/data/models/cart_item.dart';
import 'package:bartech_app/data/models/order/document_line_create_dto.dart';

// 📝 ORDER CREATE DTO (Request para POST /api/Order)
class OrderCreateDto {
  final String folioNum;
  final String? folioPref;
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
  final List<DocumentLineCreateDto>? orderLines;

  OrderCreateDto({
    required this.folioNum,
    this.folioPref,
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

  Map<String, dynamic> toJson() => {
        'folioNum': folioNum,
        'folioPref': folioPref,
        'customerCode': customerCode,
        'customerName': customerName,
        'nickName': nickName,
        'deviceCode': deviceCode,
        'docDate': docDate?.toIso8601String(),
        'docDueDate': docDueDate?.toIso8601String(),
        'docStatus': docStatus,
        'docType': docType,
        'paidType': paidType,
        'transferred': transferred,
        'printed': printed,
        'docRate': docRate,
        'docTotal': docTotal,
        'docTotalFC': docTotalFC,
        'comments': comments,
        'orderLines': orderLines?.map((line) => line.toJson()).toList(),
      };

  // 🎯 Factory desde CartState - CON líneas separadas para acompañamientos
  factory OrderCreateDto.fromCart({
    required List<CartItem> cartItems,
    required String customerCode,
    required String customerName,
    required String deviceCode,
    String? nickName,
    String? docType,
    String? paidType,
    String? comments,
    String folioPref = 'ORD',
  }) {
    final now = DateTime.now();
    final orderLines = <DocumentLineCreateDto>[];
    
    // Procesar cada item del carrito
    for (final cartItem in cartItems) {
      // 1. Agregar línea del producto principal
      orderLines.add(DocumentLineCreateDto.fromCartItem(cartItem));
      
      // 2. Agregar líneas de acompañamientos
      for (final accompaniment in cartItem.accompaniments) {
        orderLines.add(DocumentLineCreateDto.fromAccompaniment(
          accompaniment,
          cartItem.quantity,
        ));
      }
      
      // 3. Agregar líneas de materiales/ingredientes si es necesario
      for (final ingredient in cartItem.ingredients) {
        // Solo si el ingrediente tiene precio o es configurable
        if (ingredient['price'] != null && (ingredient['price'] as num) > 0) {
          orderLines.add(DocumentLineCreateDto.fromAccompaniment(
            ingredient,
            cartItem.quantity,
          ));
        }
      }
    }
    
    // Calcular total desde todas las líneas
    final docTotal = orderLines.fold<double>(
      0, 
      (sum, line) => sum + (line.lineTotal ?? 0),
    );

    // Generar folio único
    final folioNum = _generateFolioNumber();

    return OrderCreateDto(
      folioNum: folioNum,
      folioPref: folioPref,
      customerCode: customerCode,
      customerName: customerName,
      nickName: nickName,
      deviceCode: deviceCode,
      docDate: now,
      docDueDate: now.add(Duration(hours: 1)),
      docStatus: 'O',
      docTotal: docTotal,
      docTotalFC: docTotal,
      docRate: 1.0,
      transferred: 'N',
      printed: 'N',
      docType: docType,
      paidType: paidType,
      comments: comments,
      orderLines: orderLines,
    );
  }

  static String _generateFolioNumber() {
    final now = DateTime.now();
    final timestamp = now.millisecondsSinceEpoch.toString();
    return timestamp.substring(timestamp.length - 8);
  }
}