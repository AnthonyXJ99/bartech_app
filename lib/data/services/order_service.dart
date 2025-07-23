// =================================================================
// 🌐 ORDER SERVICE - SIGUIENDO TU PATRÓN CON DIO
// =================================================================
import 'dart:convert';
import 'dart:developer';
import 'package:bartech_app/data/models/cart_item.dart';
import 'package:bartech_app/data/models/order/order_create_dto.dart';
import 'package:bartech_app/data/models/order/order_response_dto.dart';
import 'package:bartech_app/data/models/order/order_update_dto.dart';
import 'package:dio/dio.dart';

class OrderService {
  final Dio _dio;
  static const String _endpoint = 'api/Order';

  OrderService(this._dio);

  // 🚀 Crear nueva orden - POST /api/Order
  Future<OrderResponseDto> createOrder(OrderCreateDto orderRequest) async {
    try {
      log('🚀 Creando orden: ${orderRequest.folioNum}');
      log('📦 Líneas: ${orderRequest.orderLines?.length ?? 0}');
      log('💰 Total: \${orderRequest.docTotal}');
      
      // 📋 IMPRIMIR JSON COMPLETO ANTES DE ENVIAR
      final jsonData = orderRequest.toJson();
      log('📄 JSON COMPLETO A ENVIAR:');
      log('===================================');
      log('${jsonEncode(jsonData)}');
      log('===================================');
      
      // 📋 DETALLES DE CADA LÍNEA
      if (orderRequest.orderLines != null) {
        log('📦 DETALLES DE LÍNEAS:');
        for (int i = 0; i < orderRequest.orderLines!.length; i++) {
          final line = orderRequest.orderLines![i];
          log('  Línea $i:');
          log('    - itemCode: ${line.itemCode} (${line.itemCode.runtimeType})');
          log('    - itemName: ${line.itemName} (${line.itemName.runtimeType})');
          log('    - quantity: ${line.quantity} (${line.quantity.runtimeType})');
          log('    - price: ${line.price} (${line.price.runtimeType})');
          log('    - lineTotal: ${line.lineTotal} (${line.lineTotal.runtimeType})');
          log('    - lineStatus: ${line.lineStatus} (${line.lineStatus.runtimeType})');
          log('    - taxCode: ${line.taxCode} (${line.taxCode.runtimeType})');
        }
      }

      final response = await _dio.post(
        _endpoint,
        data: jsonData,
      );

      log('✅ Orden creada - Status: ${response.statusCode}');
      return OrderResponseDto.fromJson(response.data);
      
    } on DioException catch (e) {
      log('❌ Error DioException: ${e.type} - ${e.message}');
      log('📋 Response data: ${e.response?.data}');
      log('📋 Response status: ${e.response?.statusCode}');
      log('📋 Response headers: ${e.response?.headers}');
      throw _handleDioException(e);
    } catch (e) {
      log('❌ Error inesperado: $e');
      log('❌ Error type: ${e.runtimeType}');
      throw Exception('Error inesperado al crear orden: $e');
    }
  }

  // 📋 Obtener órdenes con paginación - GET /api/Order
  Future<OrderResponseDtoPaginatedResult> getOrders({
    int page = 1,
    int pageSize = 10,
    String? filter,
  }) async {
    try {
      log('📋 Obteniendo órdenes - Página: $page, Tamaño: $pageSize');
      
      final queryParams = <String, dynamic>{
        'page': page,
        'pageSize': pageSize,
      };
      
      if (filter != null && filter.isNotEmpty) {
        queryParams['filter'] = filter;
      }

      final response = await _dio.get(
        _endpoint,
        queryParameters: queryParams,
      );

      log('✅ Órdenes obtenidas - Status: ${response.statusCode}');
      return OrderResponseDtoPaginatedResult.fromJson(response.data);
      
    } on DioException catch (e) {
      log('❌ Error obteniendo órdenes: ${e.message}');
      throw _handleDioException(e);
    }
  }

  // 🔍 Obtener orden por ID - GET /api/Order/{id}
  Future<OrderResponseDto> getOrderById(int orderId) async {
    try {
      log('🔍 Obteniendo orden ID: $orderId');
      
      final response = await _dio.get('$_endpoint/$orderId');
      
      log('✅ Orden obtenida - Status: ${response.statusCode}');
      return OrderResponseDto.fromJson(response.data);
      
    } on DioException catch (e) {
      log('❌ Error obteniendo orden $orderId: ${e.message}');
      throw _handleDioException(e);
    }
  }

  // 🔄 Actualizar orden - PUT /api/Order/{id}
  Future<OrderResponseDto> updateOrder(
    int orderId, 
    OrderUpdateDto updateData,
  ) async {
    try {
      log('🔄 Actualizando orden ID: $orderId');
      
      final response = await _dio.put(
        '$_endpoint/$orderId',
        data: updateData.toJson(),
      );
      
      log('✅ Orden actualizada - Status: ${response.statusCode}');
      return OrderResponseDto.fromJson(response.data);
      
    } on DioException catch (e) {
      log('❌ Error actualizando orden $orderId: ${e.message}');
      throw _handleDioException(e);
    }
  }

  // 👤 Obtener órdenes por cliente - GET /api/Order/customer/{customerCode}
  Future<List<OrderResponseDto>> getOrdersByCustomer(String customerCode) async {
    try {
      log('👤 Obteniendo órdenes del cliente: $customerCode');
      
      final response = await _dio.get('$_endpoint/customer/$customerCode');
      
      log('✅ Órdenes del cliente obtenidas - Status: ${response.statusCode}');
      return (response.data as List)
          .map((e) => OrderResponseDto.fromJson(e))
          .toList();
      
    } on DioException catch (e) {
      log('❌ Error obteniendo órdenes del cliente $customerCode: ${e.message}');
      throw _handleDioException(e);
    }
  }

  // 📊 Obtener órdenes por estado - GET /api/Order/status/{status}
  Future<List<OrderResponseDto>> getOrdersByStatus(String status) async {
    try {
      log('📊 Obteniendo órdenes con estado: $status');
      
      final response = await _dio.get('$_endpoint/status/$status');
      
      log('✅ Órdenes por estado obtenidas - Status: ${response.statusCode}');
      return (response.data as List)
          .map((e) => OrderResponseDto.fromJson(e))
          .toList();
      
    } on DioException catch (e) {
      log('❌ Error obteniendo órdenes por estado $status: ${e.message}');
      throw _handleDioException(e);
    }
  }

  // 📅 Obtener órdenes por rango de fechas - GET /api/Order/date-range
  Future<List<OrderResponseDto>> getOrdersByDateRange({
    DateTime? startDate,
    DateTime? endDate,
  }) async {
    try {
      log('📅 Obteniendo órdenes por rango de fechas');
      
      final queryParams = <String, dynamic>{};
      if (startDate != null) {
        queryParams['startDate'] = startDate.toIso8601String();
      }
      if (endDate != null) {
        queryParams['endDate'] = endDate.toIso8601String();
      }

      final response = await _dio.get(
        '$_endpoint/date-range',
        queryParameters: queryParams,
      );
      
      log('✅ Órdenes por fecha obtenidas - Status: ${response.statusCode}');
      return (response.data as List)
          .map((e) => OrderResponseDto.fromJson(e))
          .toList();
      
    } on DioException catch (e) {
      log('❌ Error obteniendo órdenes por fecha: ${e.message}');
      throw _handleDioException(e);
    }
  }

  // 🔥 Crear orden desde CartBloc (método conveniente)
  Future<OrderResponseDto> createOrderFromCart({
    required List<CartItem> cartItems,
    required String customerCode,
    required String customerName,
    required String deviceCode,
    String? nickName,
    String? docType,
    String? paidType,
    String? comments,
  }) async {
    if (cartItems.isEmpty) {
      throw Exception('El carrito está vacío');
    }

    final orderRequest = OrderCreateDto.fromCart(
      cartItems: cartItems,
      customerCode: customerCode,
      customerName: customerName,
      deviceCode: deviceCode,
      nickName: nickName,
      docType: docType,
      paidType: paidType,
      comments: comments,
    );

    return await createOrder(orderRequest);
  }

  // 🛡️ Manejo de errores DioException
  Exception _handleDioException(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return Exception('Error de conexión: Tiempo de espera agotado');
      
      case DioExceptionType.badResponse:
        final statusCode = e.response?.statusCode;
        final message = e.response?.data?['message'] ?? 
                       e.response?.data?['title'] ?? 
                       'Error del servidor';
        
        switch (statusCode) {
          case 400:
            return Exception('Datos inválidos: $message');
          case 401:
            return Exception('No autorizado');
          case 404:
            return Exception('Recurso no encontrado');
          case 500:
            return Exception('Error interno del servidor');
          default:
            return Exception('Error HTTP $statusCode: $message');
        }
      
      case DioExceptionType.cancel:
        return Exception('Petición cancelada');
      
      case DioExceptionType.unknown:
      default:
        return Exception('Error de red: ${e.message}');
    }
  }
}
