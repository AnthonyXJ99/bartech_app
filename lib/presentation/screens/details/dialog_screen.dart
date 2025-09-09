import 'package:bartech_app/data/models/cart_item.dart';
import 'package:bartech_app/data/models/product.dart';
import 'package:bartech_app/data/models/category_accompaniment.dart';
import 'package:bartech_app/data/repository/products_drift_repository.dart';
import 'package:bartech_app/presentation/bloc/cart_bloc/cart_bloc.dart';
import 'package:bartech_app/presentation/bloc/product_customize_bloc/product_customize_bloc.dart';
import 'package:bartech_app/presentation/screens/details/component/acompanamiento_list.dart';
import 'package:bartech_app/presentation/screens/details/component/ingredient_selector.dart';
import 'package:bartech_app/presentation/screens/util/util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:bartech_app/presentation/screens/util/icons_utils.dart';
import 'package:provider/provider.dart';

class DialogScreen extends StatelessWidget {
  const DialogScreen({
    super.key, 
    required this.product, 
    required this.categoryAccompaniments,
  });
  final Product product;
  final List<CategoryAccompaniment> categoryAccompaniments;

  List<Map<String, dynamic>> get ingredientsFromProduct {
    return (product.material ?? [])
        .map(
          (mat) => {
            "name": mat.itemName ?? "Ingrediente",
            "icon": getIconForName(mat.itemName ?? ""),
            "amount": 1,
            "isCustomizable": mat.isCustomizable == "Y",
          },
        )
        .toList();
  }

  List<Map<String, dynamic>> get accompanimentsFromProduct {
    return categoryAccompaniments
        .map(
          (acc) => {
            "name": acc.accompanimentItemName,
            "icon": getIconForName(acc.accompanimentItemName),
            "quantity": 0,
            "price": acc.accompanimentPrice,
            "discount": acc.discount,
            "enlargementItemCode": acc.enlargementItemCode,
            "enlargementDiscount": acc.enlargementDiscount,
            "isEnlarged": false, // Estado para controlar si está agrandado
            "originalName": acc.accompanimentItemName, // Guardar nombre original
            "originalPrice": acc.accompanimentPrice, // Guardar precio original
          },
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductCustomizeBloc(
        ingredientsFromProduct,
        accompanimentsFromProduct,
        context.read<ProductsDriftRepository>(),
      ),
      child: _DialogScreenContent(
        product: product,
        categoryAccompaniments: categoryAccompaniments,
      ),
    );
  }
}

class _DialogScreenContent extends StatelessWidget {
  final Product product;
  final List<CategoryAccompaniment> categoryAccompaniments;
  const _DialogScreenContent({
    required this.product,
    required this.categoryAccompaniments,
  });

  double _getDialogWidth(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth > 1200) return screenWidth * 0.4; // Desktop: 40%
    if (screenWidth > 800) return screenWidth * 0.6;  // Tablet: 60%
    if (screenWidth > 600) return screenWidth * 0.8;  // Tablet pequeño: 80%
    return screenWidth * 0.95; // Mobile: 95%
  }

  double _getDialogHeight(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return screenHeight * 0.85; // Máximo 85% de altura
  }

  double _getDialogMargin(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth > 800) return 20;
    return 10;
  }

  Widget _buildProductImage(BuildContext context, String? imageUrl) {
    final validatedUrl = validateImageUrl(imageUrl);
    final screenWidth = MediaQuery.of(context).size.width;
    
    // Responsive image sizing
    double imageWidth = screenWidth > 1200 ? 280 : (screenWidth > 800 ? 240 : 200);
    double imageHeight = screenWidth > 1200 ? 220 : (screenWidth > 800 ? 180 : 150);

    if (validatedUrl != null) {
      return CachedNetworkImage(
        imageUrl: validatedUrl,
        width: imageWidth,
        height: imageHeight,
        fit: BoxFit.contain,
        placeholder: (context, url) => Container(
          width: imageWidth,
          height: imageHeight,
          color: Colors.grey[300],
          child: const Center(child: CircularProgressIndicator()),
        ),
        errorWidget: (context, url, error) {
          return Image.asset(
            "assets/products/no_image.png",
            width: imageWidth,
            height: imageHeight,
            fit: BoxFit.contain,
          );
        },
      );
    } else {
      return Image.asset(
        "assets/products/no_image.png",
        width: imageWidth,
        height: imageHeight,
        fit: BoxFit.contain,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.zero,
      child: Center(
        child: Container(
          width: _getDialogWidth(context),
          height: _getDialogHeight(context),
          margin: EdgeInsets.all(_getDialogMargin(context)),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(28),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                spreadRadius: 0,
                blurRadius: 30,
                offset: const Offset(0, 15),
              ),
              BoxShadow(
                color: Colors.black.withOpacity(0.06),
                spreadRadius: 0,
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: BlocConsumer<ProductCustomizeBloc, ProductCustomizeState>(
            listener: (context, state) {
              // Mostrar error si existe
              if (state.errorMessage != null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.errorMessage!),
                    backgroundColor: Colors.red[600],
                    behavior: SnackBarBehavior.floating,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    duration: const Duration(seconds: 3),
                  ),
                );
              }
            },
            builder: (context, state) {
              // Calcular el precio total
              double accompanimentsTotal = state.accompaniments.fold(0.0, (
                sum,
                acc,
              ) {
                double price = acc["price"] as double;
                int quantity = acc["quantity"] as int;
                
                return sum + (quantity * price);
              });

              final double priceWithDiscount =
                  (product.price -
                  ((product.discount ?? 0) > 0 ? (product.discount ?? 0) : 0));
              double total =
                  priceWithDiscount * state.quantity + accompanimentsTotal;

              final hasIngredients = state.ingredients.isNotEmpty;
              final hasAccompaniments = state.accompaniments.isNotEmpty;

              return Column(
                children: [
                  // Header fijo
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(28),
                        topRight: Radius.circular(28),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          offset: const Offset(0, 2),
                          blurRadius: 8,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(
                        MediaQuery.of(context).size.width > 800 ? 28 : 20,
                        MediaQuery.of(context).size.width > 800 ? 20 : 16,
                        MediaQuery.of(context).size.width > 800 ? 28 : 20,
                        12,
                      ),
                      child: Row(
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
                    ),
                  ),
                  
                  // Contenido scrolleable
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width > 800 ? 28 : 20,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(height: MediaQuery.of(context).size.width > 800 ? 16 : 12),
                            // Imagen flotante
                      Hero(
                        tag: product.imageUrl ?? "product_image",
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 6),
                          child: _buildProductImage(context, product.imageUrl),
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.width > 800 ? 18 : 12),
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
                                      "${product.rating ?? 0}",
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
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: MediaQuery.of(context).size.width > 800 ? 26 : 22,
                                    height: 1.2,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // Contador de cantidad
                          Container(
                            decoration: BoxDecoration(
                              color: const Color(0xFFF8F9FA),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: Colors.grey.withOpacity(0.12),
                                width: 1,
                              ),
                            ),
                            child: Row(
                              children: [
                                IconButton(
                                  icon: Icon(
                                    Icons.remove,
                                    size: 20,
                                    color: state.quantity > 1 ? Colors.grey[700] : Colors.grey[400],
                                  ),
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
                                  icon: Icon(
                                    Icons.add,
                                    size: 20,
                                    color: Colors.orange[600],
                                  ),
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
                        child: product.discount! > 0
                            ? Row(
                                children: [
                                  Text(
                                    "CLP \$${product.price.toStringAsFixed(0)}",
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                      decoration: TextDecoration.lineThrough,
                                    ),
                                  ),
                                  const SizedBox(width: 7),
                                  Text(
                                    "CLP \$${(product.price - product.discount!).toStringAsFixed(0)}",
                                    style: const TextStyle(
                                      color: Color(0xFFFBA63C),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              )
                            : Text(
                                "CLP \$${product.price.toStringAsFixed(0)}",
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18,
                                  color: Colors.grey[800],
                                ),
                              ),
                      ),

                      SizedBox(height: MediaQuery.of(context).size.width > 800 ? 28 : 22),
                      // Descripción
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Descripción",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: MediaQuery.of(context).size.width > 800 ? 18 : 16,
                            color: Colors.grey[800],
                            letterSpacing: 0.3,
                          ),
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.width > 800 ? 10 : 8),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          product.description.toString(),
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: MediaQuery.of(context).size.width > 800 ? 16 : 14,
                            height: 1.5,
                            letterSpacing: 0.2,
                          ),
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.width > 800 ? 20 : 16),
                      // Ingredientes
                      if (hasIngredients) ...[
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Ingredientes",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: MediaQuery.of(context).size.width > 800 ? 18 : 16,
                              color: Colors.grey[800],
                              letterSpacing: 0.3,
                            ),
                          ),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.width > 800 ? 10 : 8),
                        SizedBox(
                          height: MediaQuery.of(context).size.width > 800 ? 105 : 90,
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
                                isCustomizable: ing["isCustomizable"] ?? true,
                                onChanged: (newAmount) {
                                  if (ing["isCustomizable"] == true) {
                                    context.read<ProductCustomizeBloc>().add(
                                      SetIngredientAmount(
                                        index: index,
                                        amount: newAmount,
                                      ),
                                    );
                                  }
                                },
                              );
                            },
                          ),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.width > 800 ? 22 : 18),
                      ],
                      // Botón para expandir acompañamientos
                      if (hasAccompaniments) ...[
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
                                    fontSize: MediaQuery.of(context).size.width > 800 ? 18 : 16,
                                    color: Colors.grey[800],
                                    letterSpacing: 0.3,
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
                        SizedBox(height: MediaQuery.of(context).size.width > 800 ? 16 : 12),
                      ],
                            SizedBox(height: MediaQuery.of(context).size.width > 800 ? 24 : 18),
                          ],
                        ),
                      ),
                    ),
                  ),
                  
                  // Footer fijo con precio y botón
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(28),
                        bottomRight: Radius.circular(28),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          offset: const Offset(0, -2),
                          blurRadius: 8,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(
                        MediaQuery.of(context).size.width > 800 ? 28 : 20,
                        16,
                        MediaQuery.of(context).size.width > 800 ? 28 : 20,
                        MediaQuery.of(context).size.width > 800 ? 20 : 16,
                      ),
                      child: Row(
                        children: [
                          Text(
                            "CLP \$${total.toStringAsFixed(0)}",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: MediaQuery.of(context).size.width > 800 ? 28 : 24,
                              color: Colors.grey[900],
                              letterSpacing: 0.5,
                            ),
                          ),
                          const Spacer(),
                          SizedBox(
                            height: MediaQuery.of(context).size.width > 800 ? 56 : 50,
                            child: ElevatedButton(
                              onPressed: () {
                                final itemCart = CartItem(
                                  product: product,
                                  quantity: state.quantity,
                                  accompaniments: state.accompaniments,
                                  ingredients: state.ingredients,
                                );
                                context.read<CartBloc>().add(
                                  AddToCart(itemCart),
                                );

                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      '${product.itemName} agregado al Pedido',
                                    ),
                                    backgroundColor: Colors.green[600],
                                    behavior: SnackBarBehavior.floating,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    duration: const Duration(seconds: 2),
                                  ),
                                );
                                context.pop();
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFFF57C00),
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18),
                                ),
                                padding: EdgeInsets.symmetric(
                                  horizontal: MediaQuery.of(context).size.width > 800 ? 40 : 32,
                                  vertical: 12,
                                ),
                                elevation: 2,
                                shadowColor: Colors.orange.withOpacity(0.3),
                              ),
                              child: Text(
                                "Agregar Pedido",
                                style: TextStyle(
                                  fontSize: MediaQuery.of(context).size.width > 800 ? 18 : 16,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0.3,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
