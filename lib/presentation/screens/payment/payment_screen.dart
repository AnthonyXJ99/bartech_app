import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bartech_app/presentation/bloc/cart_bloc/cart_bloc.dart';
import 'package:bartech_app/presentation/bloc/payment_bloc/payment_bloc.dart';
import 'package:go_router/go_router.dart';

class PaymentScreen extends StatelessWidget {
  final String ticketNumber;
  const PaymentScreen({super.key, required this.ticketNumber});

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
                "Ticket #$ticketNumber",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: BlocBuilder<CartBloc, CartState>(
          builder: (context, cartState) {
            return BlocBuilder<PaymentBloc, PaymentState>(
              builder: (context, paymentState) {
                final total = cartState.subtotal;
                final method = paymentState.selectedMethod;

                return Column(
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
                    const SizedBox(height: 40),
                    if (method == PaymentMethod.card)
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
                    if (method == PaymentMethod.cash)
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
                    const Spacer(),
                    SizedBox(
                      width: double.infinity,
                      height: 54,
                      child: ElevatedButton(
                        onPressed: method == null
                            ? null
                            : () {
                                // Procesar pago aquí
                                context.read<CartBloc>().add(ProccesCart());
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      method == PaymentMethod.cash
                                          ? "Pago en efectivo confirmado"
                                          : "Pago con tarjeta/NFC confirmado",
                                    ),
                                  ),
                                );
                                context.go("/");
                              },
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
                        child: const Text("Pagar ahora"),
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
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}

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
