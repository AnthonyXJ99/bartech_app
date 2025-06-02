import 'package:bartech_app/data/models/cart_item.dart';
import 'package:bartech_app/presentation/bloc/cart_bloc/cart_bloc.dart';
import 'package:bartech_app/presentation/bloc/product_customize_bloc/product_customize_bloc.dart';
import 'package:bartech_app/presentation/screens/details/component/acompa%C3%B1amiento_list.dart';
import 'package:bartech_app/presentation/screens/details/component/ingredient_selector.dart';
import 'package:flutter/material.dart';
import 'package:bartech_app/data/models/model_products.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class DialogScreen extends StatelessWidget {
  const DialogScreen({super.key, required this.product});
  final Products product;

  List<Map<String, dynamic>> get ingredients => [
    {"name": "Cheese", "icon": Icons.egg_alt, "amount": 1},
    {"name": "Onion", "icon": Icons.ramen_dining, "amount": 1},
    {"name": "Lettuce", "icon": Icons.grass, "amount": 1},
    {"name": "Tomato", "icon": Icons.local_pizza, "amount": 1},
    {"name": "Pickles", "icon": Icons.eco, "amount": 1},
    {"name": "Bacon", "icon": Icons.lunch_dining, "amount": 1},
    {"name": "Ketchup", "icon": Icons.water_drop, "amount": 1},
    {"name": "Mayonnaise", "icon": Icons.icecream, "amount": 1},
    {"name": "Mustard", "icon": Icons.local_fire_department, "amount": 1},
    {"name": "Mushroom", "icon": Icons.restaurant, "amount": 1},
    {"name": "Jalapeño", "icon": Icons.whatshot, "amount": 1},
    {"name": "Egg", "icon": Icons.egg, "amount": 1},
    {"name": "Avocado", "icon": Icons.emoji_nature, "amount": 1},
    {"name": "Beef Patty", "icon": Icons.set_meal, "amount": 1},
    {"name": "Chicken", "icon": Icons.fastfood, "amount": 1},
    {"name": "Sesame", "icon": Icons.spa, "amount": 1},
  ];

  List<Map<String, dynamic>> get baseAccompaniments => [
    {
      "name": "French Fries",
      "icon": Icons.restaurant,
      "quantity": 0,
      "price": 3.00,
    },
    {"name": "Salad", "icon": Icons.eco, "quantity": 0, "price": 2.50},
    {
      "name": "Soft Drink",
      "icon": Icons.local_drink,
      "quantity": 0,
      "price": 2.00,
    },
    {"name": "Sundae", "icon": Icons.icecream, "quantity": 0, "price": 2.80},
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProductCustomizeBloc(ingredients, baseAccompaniments),
      child: _DialogScreenContent(product: product),
    );
  }
}

class _DialogScreenContent extends StatelessWidget {
  final Products product;
  const _DialogScreenContent({required this.product});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.zero,
      child: Center(
        child: Container(
          width: MediaQuery.of(context).size.width < 500
              ? double.infinity
              : 450,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(32),
          ),
          child: BlocBuilder<ProductCustomizeBloc, ProductCustomizeState>(
            builder: (context, state) {
              // Calcular el precio total
              double accompanimentsTotal = state.accompaniments.fold(0.0, (
                sum,
                acc,
              ) {
                return sum +
                    (acc["quantity"] as int) * (acc["price"] as double);
              });

              final double priceWithDiscount =
                  (product.price -
                  (product.discount > 0 ? product.discount : 0));
              double total =
                  priceWithDiscount * state.quantity + accompanimentsTotal;

              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 12,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Barra superior (back)
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(
                              Icons.arrow_back_ios_new,
                              color: Colors.black87,
                            ),
                            onPressed: () => context.pop(),
                          ),
                          const Spacer(),
                        ],
                      ),
                      // Imagen flotante
                      Hero(
                        tag: product.image,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 6),
                          child: Image.asset(
                            product.image,
                            width: 210,
                            height: 160,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      // Nombre, rating y cantidad
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.star,
                                      color: Color(0xFFFBA63C),
                                      size: 18,
                                    ),
                                    const SizedBox(width: 3),
                                    Text(
                                      "4.8",
                                      style: TextStyle(
                                        color: Colors.orange[700],
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 3),
                                Text(
                                  product.itemName,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // Contador de cantidad
                          Container(
                            decoration: BoxDecoration(
                              color: const Color(0xFFF3F3F3),
                              borderRadius: BorderRadius.circular(18),
                            ),
                            child: Row(
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.remove, size: 20),
                                  onPressed: () {
                                    if (state.quantity > 1) {
                                      context.read<ProductCustomizeBloc>().add(
                                        SetProductQuantity(state.quantity - 1),
                                      );
                                    }
                                  },
                                ),
                                Text(
                                  state.quantity.toString(),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                  ),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.add, size: 20),
                                  onPressed: () {
                                    context.read<ProductCustomizeBloc>().add(
                                      SetProductQuantity(state.quantity + 1),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      Align(
                        alignment: Alignment.centerLeft,
                        child: product.discount > 0
                            ? Row(
                                children: [
                                  Text(
                                    "\$${product.price.toStringAsFixed(2)}",
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                      decoration: TextDecoration.lineThrough,
                                    ),
                                  ),
                                  const SizedBox(width: 7),
                                  Text(
                                    "\$${(product.price - product.discount).toStringAsFixed(2)}",
                                    style: const TextStyle(
                                      color: Color(0xFFFBA63C),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              )
                            : Text(
                                "\$${product.price.toStringAsFixed(2)}",
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18,
                                  color: Colors.grey[800],
                                ),
                              ),
                      ),

                      const SizedBox(height: 22),
                      // Descripción
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Descripción",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            color: Colors.grey[800],
                          ),
                        ),
                      ),
                      const SizedBox(height: 6),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          product.description,
                          style: const TextStyle(
                            color: Colors.black45,
                            fontSize: 14,
                            height: 1.4,
                          ),
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(height: 14),
                      // Ingredientes
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Ingredientes",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            color: Colors.grey[800],
                          ),
                        ),
                      ),
                      const SizedBox(height: 6),
                      SizedBox(
                        height: 90,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: state.ingredients.length,
                          separatorBuilder: (_, __) =>
                              const SizedBox(width: 20),
                          itemBuilder: (context, index) {
                            final ing = state.ingredients[index];
                            return IngredientSelector(
                              name: ing["name"],
                              icon: ing["icon"],
                              amount: ing["amount"],
                              onChanged: (newAmount) {
                                context.read<ProductCustomizeBloc>().add(
                                  SetIngredientAmount(
                                    index: index,
                                    amount: newAmount,
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Botón para expandir acompañamientos
                      GestureDetector(
                        onTap: () => context.read<ProductCustomizeBloc>().add(
                          ToggleAccompanimentsPanel(),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Row(
                            children: [
                              Text(
                                "Acompañamientos",
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16,
                                  color: Colors.grey[800],
                                ),
                              ),
                              Icon(
                                state.showAccompaniments
                                    ? Icons.expand_less
                                    : Icons.expand_more,
                                color: Colors.grey[700],
                              ),
                            ],
                          ),
                        ),
                      ),

                      // Panel expandible
                      AnimatedCrossFade(
                        duration: const Duration(milliseconds: 250),
                        crossFadeState: state.showAccompaniments
                            ? CrossFadeState.showFirst
                            : CrossFadeState.showSecond,
                        firstChild: AccompanimentList(),
                        secondChild: const SizedBox.shrink(),
                      ),
                      const SizedBox(height: 10),

                      // Precio y botón de agregar al carrito
                      Row(
                        children: [
                          Text(
                            "\$${total.toStringAsFixed(2)}",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 23,
                              color: Colors.black,
                            ),
                          ),
                          const Spacer(),
                          SizedBox(
                            height: 48,
                            child: ElevatedButton(
                              onPressed: () {
                                final itemCart = CartItem(
                                  product: product,
                                  quantity: state.quantity,
                                  accompaniments: state.accompaniments,
                                );
                                context.read<CartBloc>().add(
                                  AddToCart(itemCart),
                                );

                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      '${product.itemName} agregado al Pedido',
                                    ),
                                    duration: const Duration(seconds: 1),
                                  ),
                                );
                                context.pop();
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.orange,
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 34,
                                  vertical: 10,
                                ),
                                elevation: 0,
                              ),
                              child: const Text(
                                "Agregar Pedido",
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 18),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
