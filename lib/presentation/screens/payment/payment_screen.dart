import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bartech_app/presentation/bloc/cart_bloc/cart_bloc.dart';
import 'package:bartech_app/presentation/bloc/payment_bloc/payment_bloc.dart';
import 'package:bartech_app/data/repository/order_repository.dart';
import 'package:go_router/go_router.dart';

class PaymentScreen extends StatefulWidget {
  final String ticketNumber;
  const PaymentScreen({super.key, required this.ticketNumber});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final _nicknameController = TextEditingController();
  String _selectedDocType = 'T'; // T=Ticket, B=Boleta, F=Factura
  bool _isProcessing = false;
  
  @override
  void dispose() {
    _nicknameController.dispose();
    super.dispose();
  }

  // 🎯 Determinar tipo de documento según método de pago
  String _getDefaultDocType(PaymentMethod? method) {
    switch (method) {
      case PaymentMethod.cash:
        return 'T'; // Ticket por defecto para efectivo
      case PaymentMethod.card:
        return 'B'; // Boleta por defecto para tarjeta
      default:
        return 'T';
    }
  }

  // 🚀 Procesar orden
  Future<void> _processOrder(BuildContext context) async {
    setState(() => _isProcessing = true);
    
    final cartBloc = context.read<CartBloc>();
    final orderRepository = context.read<OrderRepository>();
    final paymentState = context.read<PaymentBloc>().state;
    
    try {
      final orderResponse = await cartBloc.processOrder(
        orderRepository: orderRepository,
        customerCode: "WALK_IN", // Cliente genérico
        customerName: _nicknameController.text.isNotEmpty 
            ? _nicknameController.text 
            : "Cliente",
        deviceCode: "KIOSK_001", // Configurable
        nickName: _nicknameController.text.isNotEmpty 
            ? _nicknameController.text 
            : null,
        docType: _selectedDocType,
        paidType: paymentState.selectedMethod == PaymentMethod.cash ? "C" : "T",
        comments: "Pedido desde kiosk - Ticket #${widget.ticketNumber}",
      );

      if (mounted) {
        // ✅ Orden creada exitosamente
        _showSuccessDialog(context, orderResponse.docEntry?.toString() ?? "N/A");
      }
      
    } catch (e) {
      if (mounted) {
        // ❌ Error al procesar
        _showErrorDialog(context, e.toString());
      }
    } finally {
      if (mounted) {
        setState(() => _isProcessing = false);
      }
    }
  }

  // ✅ Dialog de éxito
  void _showSuccessDialog(BuildContext context, String orderId) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.check_circle, color: Colors.green, size: 64),
            const SizedBox(height: 16),
            const Text(
              "¡Pago Procesado!",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              "Orden #$orderId creada exitosamente",
              style: TextStyle(color: Colors.grey[600]),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                context.go("/");
              },
              child: const Text("Continuar"),
            ),
          ],
        ),
      ),
    );
  }

  // ❌ Dialog de error
  void _showErrorDialog(BuildContext context, String error) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Text("Error al procesar"),
        content: Text(error),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text("Entendido"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final orange = const Color(0xFFFBA63C);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Pagar tu Pedido"),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: orange,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Text(
                "Ticket #${widget.ticketNumber}",
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: BlocBuilder<CartBloc, CartState>(
            builder: (context, cartState) {
              return BlocBuilder<PaymentBloc, PaymentState>(
                builder: (context, paymentState) {
                  final total = cartState.subtotal;
                  final method = paymentState.selectedMethod;

                  // Actualizar tipo de documento cuando cambia el método
                  if (method != null && _selectedDocType != _getDefaultDocType(method)) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      setState(() {
                        _selectedDocType = _getDefaultDocType(method);
                      });
                    });
                  }

                  return SingleChildScrollView(
                    child: Column(
                  children: [
                    const SizedBox(height: 10),
                    const Text(
                      "Total a pagar",
                      style: TextStyle(color: Colors.grey, fontSize: 15),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "\$${total.toStringAsFixed(2)}",
                      style: TextStyle(
                        color: orange,
                        fontWeight: FontWeight.bold,
                        fontSize: 38,
                        letterSpacing: 1.2,
                      ),
                    ),
                    const SizedBox(height: 30),
                    
                    // 💳 Selección de método de pago
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "¿Cómo deseas pagar?",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: PaymentOptionCard(
                            icon: Icons.attach_money,
                            label: "Efectivo",
                            color: orange,
                            selected: method == PaymentMethod.cash,
                            onTap: () => context.read<PaymentBloc>().add(
                              SelectPaymentMethod(PaymentMethod.cash),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: PaymentOptionCard(
                            icon: Icons.contactless,
                            label: "Tarjeta/NFC",
                            color: orange,
                            selected: method == PaymentMethod.card,
                            onTap: () => context.read<PaymentBloc>().add(
                              SelectPaymentMethod(PaymentMethod.card),
                            ),
                          ),
                        ),
                      ],
                    ),
                    
                    // 📋 Sección de detalles adicionales (se expande cuando se selecciona método)
                    if (method != null) ...[
                      const SizedBox(height: 30),
                      PaymentDetailsSection(
                        paymentMethod: method,
                        nicknameController: _nicknameController,
                        selectedDocType: _selectedDocType,
                        onDocTypeChanged: (newType) {
                          setState(() => _selectedDocType = newType);
                        },
                        color: orange,
                      ),
                    ],
                    
                    const SizedBox(height: 40),
                    
                    // 🔄 Indicador de procesamiento o instrucciones
                    if (method == PaymentMethod.card && !_isProcessing)
                      Column(
                        children: [
                          Icon(Icons.contactless, size: 48, color: orange),
                          const SizedBox(height: 10),
                          const Text(
                            "Acerca tu tarjeta o dispositivo NFC...",
                            style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    if (method == PaymentMethod.cash && !_isProcessing)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: Text(
                          "Espera al cajero para finalizar tu pago.",
                          style: TextStyle(
                            color: Colors.grey[800],
                            fontSize: 16,
                          ),
                        ),
                      ),
                    
                    if (_isProcessing)
                      Column(
                        children: [
                          CircularProgressIndicator(color: orange),
                          const SizedBox(height: 16),
                          const Text(
                            "Procesando tu orden...",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    
                    // ✅ Espacio adaptativo en lugar de Spacer()
                    SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                    
                    // 🚀 Botón de pago
                    SizedBox(
                      width: double.infinity,
                      height: 54,
                      child: ElevatedButton(
                        onPressed: (method == null || _isProcessing)
                            ? null
                            : () => _processOrder(context),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: orange,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          textStyle: const TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                          ),
                          elevation: 0,
                        ),
                        child: _isProcessing
                            ? const SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 2,
                                ),
                              )
                            : const Text("Pagar ahora"),
                      ),
                    ),
                    const SizedBox(height: 18),
                    const Text(
                      "¡Gracias por tu compra!",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ]
                    )
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}

// 📋 Sección de detalles de pago
class PaymentDetailsSection extends StatelessWidget {
  final PaymentMethod paymentMethod;
  final TextEditingController nicknameController;
  final String selectedDocType;
  final Function(String) onDocTypeChanged;
  final Color color;

  const PaymentDetailsSection({
    super.key,
    required this.paymentMethod,
    required this.nicknameController,
    required this.selectedDocType,
    required this.onDocTypeChanged,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: color.withAlpha(15),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withAlpha(50)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 👤 Campo de nickname
          const Text(
            "Nombre para la orden (opcional)",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: nicknameController,
            decoration: InputDecoration(
              hintText: "Ej: Juan, Mesa 5, etc...",
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.grey[300]!),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: color, width: 2),
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
            ),
          ),
          
          const SizedBox(height: 20),
          
          // 📄 Selección de tipo de documento
          const Text(
            "Tipo de comprobante",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 12),
          
          Row(
            children: [
              Expanded(
                child: DocumentTypeCard(
                  label: "Ticket",
                  value: "T",
                  selected: selectedDocType == "T",
                  onTap: () => onDocTypeChanged("T"),
                  color: color,
                  icon: Icons.receipt,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: DocumentTypeCard(
                  label: "Boleta",
                  value: "B",
                  selected: selectedDocType == "B",
                  onTap: () => onDocTypeChanged("B"),
                  color: color,
                  icon: Icons.description,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: DocumentTypeCard(
                  label: "Factura",
                  value: "F",
                  selected: selectedDocType == "F",
                  onTap: () => onDocTypeChanged("F"),
                  color: color,
                  icon: Icons.business,
                ),
              ),
            ],
          ),
          
          // 💡 Información adicional
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.blue[50],
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.blue[200]!),
            ),
            child: Row(
              children: [
                Icon(Icons.info_outline, color: Colors.blue[700], size: 20),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    _getDocTypeInfo(selectedDocType),
                    style: TextStyle(
                      color: Colors.blue[700],
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _getDocTypeInfo(String docType) {
    switch (docType) {
      case "T":
        return "Comprobante simple sin valor fiscal";
      case "B":
        return "Comprobante de pago válido para personas naturales";
      case "F":
        return "Comprobante de pago válido para empresas";
      default:
        return "";
    }
  }
}

// 📄 Card para selección de tipo de documento
class DocumentTypeCard extends StatelessWidget {
  final String label;
  final String value;
  final bool selected;
  final VoidCallback onTap;
  final Color color;
  final IconData icon;

  const DocumentTypeCard({
    super.key,
    required this.label,
    required this.value,
    required this.selected,
    required this.onTap,
    required this.color,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        decoration: BoxDecoration(
          color: selected ? color.withAlpha(30) : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: selected ? color : Colors.grey[300]!,
            width: selected ? 2 : 1,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: selected ? color : Colors.grey[600],
              size: 24,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                color: selected ? color : Colors.grey[700],
                fontWeight: selected ? FontWeight.bold : FontWeight.w500,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// 💳 Card de método de pago (reutilizando tu componente existente)
class PaymentOptionCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final bool selected;
  final VoidCallback onTap;

  const PaymentOptionCard({
    super.key,
    required this.icon,
    required this.label,
    required this.color,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOut,
        padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 6),
        decoration: BoxDecoration(
          color: selected ? color.withAlpha(23) : Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: selected ? color : Colors.grey[200]!,
            width: selected ? 2.2 : 1.2,
          ),
          boxShadow: [
            if (selected)
              BoxShadow(
                color: color.withAlpha(46),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: color, size: 38),
            const SizedBox(height: 10),
            Text(
              label,
              style: TextStyle(
                color: color,
                fontSize: 15,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}