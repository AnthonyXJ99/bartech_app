import 'package:bartech_app/presentation/bloc/cart_bloc/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Mi Pedido")),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state.items.isEmpty) {
            return const Center(child: Text("No items in cart"));
          }

          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: state.items.length,
                  itemBuilder: (context, i) {
                    final cartItem = state.items[i];
                    final product = cartItem.product;
                    final priceWithDiscount =
                        product.price -
                        ((product.discount ?? 0) > 0
                            ? (product.discount ?? 0)
                            : 0);

                    double accompTotal = cartItem.accompaniments.fold(
                      0.0,
                      (sum, acc) =>
                          sum +
                          (acc['quantity'] as int) * (acc['price'] as double),
                    );
                    final subtotal =
                        priceWithDiscount * cartItem.quantity + accompTotal;

                    // Solo ingredientes > 0
                    final selectedIngredients = cartItem.ingredients
                        .where(
                          (ing) => ing['amount'] != null && ing['amount'] != 1,
                        )
                        .toList();

                    return Card(
                      margin: EdgeInsets.only(left: 8, right: 8, bottom: 2),
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 14,
                          horizontal: 12,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // PRODUCTO PRINCIPAL
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    // product.imageUrl ??
                                    'assets/products/no_image.png',
                                    // Aquí deberías usar la imagen del producto
                                    // product.imageUrl,
                                    width: 52,
                                    height: 52,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                const SizedBox(width: 13),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        product.itemName,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            'x${cartItem.quantity}',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14,
                                              color: Colors.grey[700],
                                            ),
                                          ),
                                          const SizedBox(width: 12),
                                          if ((product.discount ?? 0) > 0)
                                            Text(
                                              "\$${product.price.toStringAsFixed(2)}",
                                              style: const TextStyle(
                                                color: Colors.grey,
                                                fontSize: 15,
                                                decoration:
                                                    TextDecoration.lineThrough,
                                              ),
                                            ),
                                          if (product.discount! > 0)
                                            const SizedBox(width: 5),
                                          Text(
                                            "\$${priceWithDiscount.toStringAsFixed(2)}",
                                            style: TextStyle(
                                              color: (product.discount ?? 0) > 0
                                                  ? Color(0xFFFBA63C)
                                                  : Colors.black87,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                IconButton(
                                  icon: const Icon(
                                    Icons.delete_outline,
                                    color: Colors.redAccent,
                                  ),
                                  onPressed: () {
                                    context.read<CartBloc>().add(
                                      RemoveFromCart(i),
                                    );
                                  },
                                ),
                              ],
                            ),
                            // INGREDIENTES (si hay)
                            if (selectedIngredients.isNotEmpty) ...[
                              const SizedBox(height: 8),
                              Text(
                                "Ingredientes personalizados:",
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.grey[800],
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              ...selectedIngredients.map((ing) {
                                String amountText = "Normal";
                                if (ing['amount'] == 0) {
                                  amountText = "No";
                                } else if (ing['amount'] == 2) {
                                  amountText = "Extra";
                                }

                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 1.5,
                                  ),
                                  child: Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 12,
                                        backgroundColor: Colors.grey[200],
                                        child: Icon(
                                          ing['icon'],
                                          size: 16,
                                          color: Colors.black87,
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Text(
                                        '${ing['name']}: $amountText',
                                        style: const TextStyle(fontSize: 13),
                                      ),
                                    ],
                                  ),
                                );
                              }),
                            ],
                            // ACOMPAÑAMIENTOS (si hay)
                            if (cartItem.accompaniments.any(
                              (acc) => acc['quantity'] > 0,
                            )) ...[
                              const SizedBox(height: 10),
                              Text(
                                "Acompañamientos:",
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.grey[700],
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              ...cartItem.accompaniments
                                  .where((acc) => acc['quantity'] > 0)
                                  .map(
                                    (acc) => Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 1.5,
                                      ),
                                      child: Row(
                                        children: [
                                          CircleAvatar(
                                            radius: 12,
                                            backgroundColor: Colors.grey[200],
                                            child: Icon(
                                              acc['icon'],
                                              size: 16,
                                              color: Colors.black87,
                                            ),
                                          ),
                                          const SizedBox(width: 8),
                                          Text(
                                            '${acc['name']} x${acc['quantity']}',
                                            style: const TextStyle(
                                              fontSize: 13,
                                            ),
                                          ),
                                          const Spacer(),
                                          Text(
                                            '\$${(acc['price'] * acc['quantity']).toStringAsFixed(2)}',
                                            style: const TextStyle(
                                              fontSize: 13,
                                              color: Colors.black54,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                            ],
                            // SUBTOTAL DE ESTE PEDIDO
                            const SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  "Subtotal: ",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13,
                                    color: Colors.grey[600],
                                  ),
                                ),
                                Text(
                                  "\$${subtotal.toStringAsFixed(2)}",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Colors.black87,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              // FOOTER TOTAL Y BOTÓN
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Total",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 32,
                          ),
                        ),
                        Text(
                          "\$${state.subtotal.toStringAsFixed(2)}",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 32,
                            color: Colors.orange,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 18),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Botón Cancelar
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(right: 8),
                            child: ElevatedButton(
                              onPressed: () {
                                context.read<CartBloc>().add(ProccesCart());
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: const Text('Pedido cancelado'),
                                    duration: const Duration(seconds: 1),
                                    behavior: SnackBarBehavior.floating,
                                  ),
                                );
                                context.go("/");
                              },
                              style:
                                  ElevatedButton.styleFrom(
                                    backgroundColor: Colors.redAccent,
                                    foregroundColor: Colors.white,
                                    disabledBackgroundColor: Colors.redAccent
                                        .withAlpha(153),
                                    disabledForegroundColor: Colors.white
                                        .withAlpha(153),
                                    elevation: 3,
                                    shadowColor: Colors.redAccent.withAlpha(76),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(13),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 18,
                                      horizontal: 16,
                                    ),
                                    minimumSize: const Size(0, 54),
                                    tapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                  ).copyWith(
                                    overlayColor:
                                        WidgetStateProperty.resolveWith<Color?>(
                                          (Set<WidgetState> states) {
                                            if (states.contains(
                                              WidgetState.pressed,
                                            )) {
                                              return Colors.red.withAlpha(76);
                                            }
                                            if (states.contains(
                                              WidgetState.hovered,
                                            )) {
                                              return Colors.red.withAlpha(76);
                                            }
                                            return null;
                                          },
                                        ),
                                  ),
                              child: const Text(
                                "Cancelar Pedido",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0.5,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),

                        // Botón Pagar
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(left: 8),
                            child: ElevatedButton(
                              onPressed: () {
                                context.push("/products/cart/payment/1578");
                              },
                              style:
                                  ElevatedButton.styleFrom(
                                    backgroundColor: Colors.black,
                                    foregroundColor: Colors.white,
                                    disabledBackgroundColor: Colors.black
                                        .withAlpha(153),
                                    disabledForegroundColor: Colors.white
                                        .withAlpha(153),
                                    elevation: 3,
                                    shadowColor: Colors.black.withAlpha(76),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(13),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 18,
                                      horizontal: 16,
                                    ),
                                    minimumSize: const Size(0, 54),
                                    tapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                  ).copyWith(
                                    overlayColor:
                                        WidgetStateProperty.resolveWith<Color?>(
                                          (Set<WidgetState> states) {
                                            if (states.contains(
                                              WidgetState.pressed,
                                            )) {
                                              return Colors.grey.withAlpha(76);
                                            }
                                            if (states.contains(
                                              WidgetState.hovered,
                                            )) {
                                              return Colors.grey.withAlpha(76);
                                            }
                                            return null;
                                          },
                                        ),
                                  ),
                              child: const Text(
                                "Pagar Pedido",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0.5,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
