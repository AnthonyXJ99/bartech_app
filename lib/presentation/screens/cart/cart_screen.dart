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
                        (product.discount > 0 ? product.discount : 0);

                    // Calcula total acompañamientos de este item
                    double accompTotal = cartItem.accompaniments.fold(
                      0.0,
                      (sum, acc) =>
                          sum +
                          (acc['quantity'] as int) * (acc['price'] as double),
                    );
                    final subtotal =
                        priceWithDiscount * cartItem.quantity + accompTotal;

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
                                    product.image,
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
                                          if (product.discount > 0)
                                            Text(
                                              "\$${product.price.toStringAsFixed(2)}",
                                              style: const TextStyle(
                                                color: Colors.grey,
                                                fontSize: 15,
                                                decoration:
                                                    TextDecoration.lineThrough,
                                              ),
                                            ),
                                          if (product.discount > 0)
                                            const SizedBox(width: 5),
                                          Text(
                                            "\$${priceWithDiscount.toStringAsFixed(2)}",
                                            style: TextStyle(
                                              color: product.discount > 0
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
                                  )
                                  .toList(),
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
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          "\$${state.subtotal.toStringAsFixed(2)}",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.orange,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 18),
                    ElevatedButton(
                      onPressed: () {
                        context.read<CartBloc>().add(ProccesCart());

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Tu pedido ha sido enviado '),
                            duration: const Duration(seconds: 1),
                          ),
                        );

                        context.pop();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(13),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: const Text(
                        "Pagar Pedido",
                        style: TextStyle(fontSize: 16),
                      ),
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
