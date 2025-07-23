// =================================================================
// 📂 ORDER REPOSITORY - SIGUIENDO TU PATRÓN
// =================================================================


import 'dart:developer';

import 'package:bartech_app/data/models/cart_item.dart';
import 'package:bartech_app/data/models/order/order_create_dto.dart';
import 'package:bartech_app/data/models/order/order_response_dto.dart';
import 'package:bartech_app/data/services/order_service.dart';

class OrderRepository {
  final OrderService _orderService;

  OrderRepository(this._orderService);

  // 🚀 Crear orden
  Future<OrderResponseDto> createOrder(OrderCreateDto orderRequest) async {
    try {
      return await _orderService.createOrder(orderRequest);
    } catch (e) {
      log('❌ Repository - Error creando orden: $e');
      rethrow;
    }
  }

  // 🔥 Crear orden desde carrito
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
    try {

      log(' Repository - Error creando orden desde carrito: $cartItems');

      return await _orderService.createOrderFromCart(
        cartItems: cartItems,
        customerCode: customerCode,
        customerName: customerName,
        deviceCode: deviceCode,
        nickName: nickName,
        docType: docType,
        paidType: paidType,
        comments: comments,
      );
    } catch (e) {
      log('❌ Repository - Error creando orden desde carrito: $e');
      rethrow;
    }
  }

  // 📋 Obtener órdenes con paginación
  Future<OrderResponseDtoPaginatedResult> getOrders({
    int page = 1,
    int pageSize = 10,
    String? filter,
  }) async {
    try {
      return await _orderService.getOrders(
        page: page,
        pageSize: pageSize,
        filter: filter,
      );
    } catch (e) {
      log('❌ Repository - Error obteniendo órdenes: $e');
      rethrow;
    }
  }

  // 🔍 Obtener orden por ID
  Future<OrderResponseDto> getOrderById(int orderId) async {
    try {
      return await _orderService.getOrderById(orderId);
    } catch (e) {
      log('❌ Repository - Error obteniendo orden $orderId: $e');
      rethrow;
    }
  }

  // 👤 Obtener órdenes por cliente
  Future<List<OrderResponseDto>> getOrdersByCustomer(String customerCode) async {
    try {
      return await _orderService.getOrdersByCustomer(customerCode);
    } catch (e) {
      log('❌ Repository - Error obteniendo órdenes del cliente: $e');
      rethrow;
    }
  }

  // 📊 Obtener órdenes por estado
  Future<List<OrderResponseDto>> getOrdersByStatus(String status) async {
    try {
      return await _orderService.getOrdersByStatus(status);
    } catch (e) {
      log('❌ Repository - Error obteniendo órdenes por estado: $e');
      rethrow;
    }
  }
}