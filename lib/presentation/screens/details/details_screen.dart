import 'package:bartech_app/data/models/cart_item.dart';
import 'package:bartech_app/data/models/model_groups.dart';
import 'package:bartech_app/data/models/product.dart';
import 'package:bartech_app/presentation/bloc/cart_bloc/cart_bloc.dart';
import 'package:bartech_app/presentation/bloc/details_bloc/details_bloc.dart';
import 'package:bartech_app/presentation/bloc/details_bloc/details_event.dart';
import 'package:bartech_app/presentation/bloc/details_bloc/details_state.dart';
import 'package:bartech_app/presentation/bloc/image_bloc/image_bloc.dart';
import 'package:bartech_app/presentation/screens/details/component/card_categories.dart';
import 'package:bartech_app/presentation/screens/details/dialog_screen.dart';
import 'package:bartech_app/presentation/screens/util/util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.carruselImages});
  final List<GroupItems> carruselImages;

  @override
  Widget build(BuildContext context) {
    return DetailsView(images: carruselImages);
  }
}

class DetailsView extends StatefulWidget {
  const DetailsView({super.key, required this.images});
  final List<GroupItems> images;

  @override
  State<DetailsView> createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  ImageBloc? _imageBloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _imageBloc = context.read<ImageBloc>();
  }

  @override
  void initState() {
    super.initState();
    // Cargar imágenes de publicidad
    context.read<ImageBloc>().add(const LoadImagesEvent(type: "Banner"));
  }

  @override
  void dispose() {
    // Limpiar imágenes de publicidad al salir
    _imageBloc?.add(const ClearImagesEvent(type: "Banner"));
    super.dispose();
  }

  double _calculateAspectRatio(BoxConstraints constraints) {
    if (constraints.maxWidth > 700) return 0.9;
    if (constraints.maxWidth > 460) return 0.85;
    if (constraints.maxHeight > 400) return 1.3;
    if (constraints.maxHeight > 300) return 1.0;
    return 0.8; // ✅ Siempre mayor a 0
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<DetailsBloc>();

    return Scaffold(
      floatingActionButton: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          final int cartCount = state.items.length;

          return FloatingActionButton.extended(
            onPressed: () {
              context.push("/products/cart");
            },
            backgroundColor: Colors.orange.shade600,
            elevation: 8,
            icon: Stack(
              clipBehavior: Clip.none,
              children: [
                const Icon(
                  Icons.shopping_cart_outlined,
                  color: Colors.white,
                  size: 26,
                ),
                // Badge solo si hay productos
                if (cartCount > 0)
                  Positioned(
                    right: -2,
                    top: -2,
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: Colors.redAccent,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                      constraints: const BoxConstraints(
                        minWidth: 19,
                        minHeight: 19,
                      ),
                      child: Text(
                        '$cartCount',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
              ],
            ),
            label: const Text(
              "PEDIDOS",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 17,
                letterSpacing: 1.2,
              ),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          );
        },
      ),

      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Carrusel superior de imágenes
          BlocBuilder<ImageBloc, ImageState>(
            builder: (context, state) {
              if (state is ImageLoaded) {
                final publicidadImages = state.getImagesByType("Banner");
                if (publicidadImages.isNotEmpty) {
                  return CarouselSlider(
                    items: publicidadImages.map((image) {
                      // ✅ REEMPLAZADO: Image.network → CachedNetworkImage
                      return CachedNetworkImage(
                        imageUrl: image.publicUrl!,
                        fit: BoxFit.cover,
                        placeholder: (context, url) => Container(
                          color: Colors.grey[300],
                          child: const Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                        errorWidget: (context, url, error) => Container(
                          color: Colors.grey[300],
                          child: const Center(
                            child: Icon(
                              Icons.image_not_supported,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                    options: CarouselOptions(
                      height: MediaQuery.of(context).size.height * 0.20,
                      autoPlay: true,
                      autoPlayCurve: Curves.easeInCubic,
                      enlargeCenterPage: true,
                      autoPlayInterval: const Duration(seconds: 3),
                      scrollDirection: Axis.horizontal,
                      viewportFraction: 1.0,
                      disableCenter: true,
                    ),
                  );
                }
              } else if (state is ImageLoading && state.type == "Banner") {
                return Container(
                  height: MediaQuery.of(context).size.height * 0.20,
                  color: Colors.grey[300],
                  child: const Center(child: CircularProgressIndicator()),
                );
              }

              // Fallback a imágenes locales si no hay datos o hay error
              return CarouselSlider(
                items: [
                  Image.asset('assets/slider/1.jpeg', fit: BoxFit.cover),
                  Image.asset('assets/slider/2.jpeg', fit: BoxFit.cover),
                  Image.asset('assets/slider/3.jpeg', fit: BoxFit.cover),
                  Image.asset('assets/slider/4.jpeg', fit: BoxFit.cover),
                ],
                options: CarouselOptions(
                  height: MediaQuery.of(context).size.height * 0.20,
                  autoPlay: true,
                  autoPlayCurve: Curves.easeInCubic,
                  enlargeCenterPage: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  scrollDirection: Axis.horizontal,
                  viewportFraction: 1.0,
                  disableCenter: true,
                ),
              );
            },
          ),

          const SizedBox(height: 5),

          // Row con logo, cupón y texto dinámico
          BlocBuilder<DetailsBloc, DetailsState>(
            builder: (context, state) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'assets/choose/logo.png',
                    width: 40,
                    height: 40,
                    fit: BoxFit.cover,
                  ),

                  const SizedBox(width: 10),
                  Text(
                    state.selectedCategory?.categoryItemName ??
                        "Selecciona una categoría",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Contenedor con carrusel vertical y grilla de productos
          Expanded(
            child: Row(
              children: [
                // Lado izquierdo: carrusel vertical de grupos
                BlocBuilder<DetailsBloc, DetailsState>(
                  builder: (context, state) {
                    // Manejar estado de carga
                    if (state.isLoading && state.categories.isEmpty) {
                      return Container(
                        width: MediaQuery.of(context).size.width * 0.25,
                        color: Colors.white,
                        child: const Center(child: CircularProgressIndicator()),
                      );
                    }

                    // Manejar estado de error
                    if (state.error.isNotEmpty && state.categories.isEmpty) {
                      return Container(
                        width: MediaQuery.of(context).size.width * 0.25,
                        color: Colors.white,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.error_outline,
                                color: Colors.red[400],
                                size: 32,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Error al cargar categorías',
                                style: TextStyle(
                                  color: Colors.red[400],
                                  fontSize: 12,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      );
                    }

                    final categories = state.categories;
                    if (categories.isEmpty) {
                      return Container(
                        width: MediaQuery.of(context).size.width * 0.25,
                        color: Colors.white,
                        child: const Center(
                          child: Text(
                            'No hay categorías disponibles',
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      );
                    }

                    return Container(
                      width: MediaQuery.of(context).size.width * 0.25,
                      color: Colors.white,
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          final maxCarouselHeight = constraints.maxHeight - 10;
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: CarouselSlider.builder(
                              itemCount: categories.length,
                              itemBuilder: (context, index, realIndex) {
                                final category = categories[index];
                                return CardCategory(
                                  category: category,
                                  onTap: () {
                                    bloc.add(CategorySelectedEvent(category));
                                  },
                                );
                              },
                              options: CarouselOptions(
                                height: maxCarouselHeight > 0
                                    ? maxCarouselHeight
                                    : 200,
                                autoPlay: false,
                                enlargeCenterPage: true,
                                scrollDirection: Axis.vertical,
                                viewportFraction: 0.33,
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),

                // Lado derecho: grilla de productos filtrados por categoría seleccionada
                Expanded(
                  child: Container(
                    color: const Color(0xFFF9F9F9),
                    padding: const EdgeInsets.symmetric(
                      vertical: 16,
                      horizontal: 8,
                    ),
                    child: BlocBuilder<DetailsBloc, DetailsState>(
                      builder: (context, state) {
                        final products = state.products;
                        if (products.isEmpty) {
                          return Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.shopping_bag_outlined,
                                  size: 48,
                                  color: Colors.grey[400],
                                ),
                                const SizedBox(height: 12),
                                const Text(
                                  'Selecciona una categoría para ver los productos.',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black54,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          );
                        }

                        // Muestra productos en grilla
                        return LayoutBuilder(
                          builder: (context, constraints) {
                            int crossAxisCount = constraints.maxWidth > 1100
                                ? 4
                                : constraints.maxWidth > 700
                                ? 3
                                : constraints.maxWidth > 450
                                ? 2
                                : 1;

                            return GridView.builder(
                              key: ValueKey(
                                state.selectedCategory?.categoryItemCode ??
                                    'no-category',
                              ),
                              padding: const EdgeInsets.only(bottom: 12),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: crossAxisCount,
                                    childAspectRatio: _calculateAspectRatio(
                                      constraints,
                                    ),
                                    crossAxisSpacing: 20.0,
                                    mainAxisSpacing: 20.0,
                                  ),
                              itemCount: products.length,
                              itemBuilder: (context, index) {
                                final product = products[index];
                                return TweenAnimationBuilder<double>(
                                  tween: Tween(begin: 0, end: 1),
                                  duration: Duration(
                                    milliseconds: 350 + index * 60,
                                  ),
                                  curve: Curves.easeOutBack,
                                  builder: (context, value, child) {
                                    return Opacity(
                                      opacity: value.clamp(0.0, 1.0),
                                      child: Transform.scale(
                                        scale: value.clamp(0.0, 1.0),
                                        child: child,
                                      ),
                                    );
                                  },
                                  child: _ProductCard(
                                    key: ValueKey(
                                      '${state.selectedCategory?.categoryItemCode}-${product.itemCode}',
                                    ),
                                    product: product,
                                  ),
                                );
                              },
                            );
                          },
                        );
                      },
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
}

class _ProductCard extends StatefulWidget {
  final Product product;
  const _ProductCard({super.key, required this.product});

  @override
  State<_ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<_ProductCard> {
  bool isAdding = false;

  Widget _buildProductImage(String? imageUrl) {
    final validatedUrl = validateImageUrl(imageUrl);

    if (validatedUrl != null) {
      // ✅ REEMPLAZADO: Image.network → CachedNetworkImage
      return CachedNetworkImage(
        imageUrl: validatedUrl,
        fit: BoxFit.fill,
        memCacheWidth: 180, // Optimización de memoria
        memCacheHeight: 180,
        placeholder: (context, url) => Container(
          color: Colors.grey[300],
          child: const Center(child: CircularProgressIndicator()),
        ),
        errorWidget: (context, url, error) {
          return Image.asset(
            "assets/products/no_image.png",
            fit: BoxFit.contain,
          );
        },
      );
    } else {
      return Image.asset("assets/products/no_image.png", fit: BoxFit.contain);
    }
  }

  @override
  Widget build(BuildContext context) {
    final product = widget.product;
    final screenWidth = MediaQuery.of(context).size.width;
    final imageSize = screenWidth < 370
        ? 55.0
        : screenWidth < 450
        ? 70.0
        : 90.0;
    final fontTitle = screenWidth < 370
        ? 13.0
        : screenWidth < 450
        ? 15.0
        : 17.0;
    final fontPrice = screenWidth < 370 ? 14.0 : 18.0;
    final iconSize = screenWidth < 370 ? 13.0 : 15.0;
    final buttonSize = screenWidth < 370 ? 26.0 : 36.0;
    final badgeFont = screenWidth < 370 ? 9.0 : 10.0;

    return Material(
      color: Colors.white,
      elevation: 2,
      borderRadius: BorderRadius.circular(16),
      shadowColor: Colors.black12,
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () {
          showDialog(
            context: context,
            barrierDismissible: true,
            builder: (_) => DialogScreen(product: product),
          );
        },
        child: Padding(
          padding: EdgeInsets.all(screenWidth < 370 ? 8 : 13),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(
                    child: SizedBox(
                      height: imageSize,
                      width: imageSize,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: _buildProductImage(product.imageUrl),
                      ),
                    ),
                  ),
                  SizedBox(height: screenWidth < 370 ? 6 : 12),
                  Text(
                    product.itemName,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: fontTitle,
                      color: Colors.black87,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: screenWidth < 370 ? 3 : 6),
                  Row(
                    children: [
                      Icon(
                        Icons.timer,
                        size: iconSize,
                        color: Colors.grey[500],
                      ),
                      SizedBox(width: 4),
                      Text(
                        "${product.waitingTime ?? "0"} min",
                        style: TextStyle(
                          fontSize: iconSize - 1,
                          color: Colors.grey[700],
                        ),
                      ),
                      SizedBox(width: 8),
                      Icon(Icons.star, color: Colors.amber, size: iconSize),
                      Text(
                        product.rating?.toStringAsFixed(1) ?? "0.0",
                        style: TextStyle(
                          fontSize: iconSize - 1,
                          color: Colors.grey[700],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenWidth < 370 ? 5 : 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Si hay descuento, mostramos el precio original tachado y el precio con descuento
                      Flexible(
                        child: (product.discount ?? 0) > 0
                            ? Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "\$${(product.price).toStringAsFixed(0)}",
                                    style: TextStyle(
                                      fontSize: fontPrice - 4,
                                      color: Colors.grey,
                                      decoration: TextDecoration.lineThrough,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(width: 6),
                                  Text(
                                    "\$${(product.price - (product.discount ?? 0)).toStringAsFixed(0)}",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: fontPrice,
                                      color: const Color(0xFFFBA63C),
                                    ),
                                  ),
                                ],
                              )
                            : Text(
                                "\$${product.price.toStringAsFixed(0)}",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: fontPrice,
                                  color: const Color(0xFFFBA63C),
                                ),
                              ),
                      ),
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 300),
                        child: isAdding
                            ? SizedBox(
                                width: buttonSize,
                                height: buttonSize,
                                child: const CircularProgressIndicator(
                                  strokeWidth: 2,
                                ),
                              )
                            : SizedBox(
                                width: buttonSize,
                                height: buttonSize,
                                child: ElevatedButton(
                                  onPressed: () async {
                                    setState(() => isAdding = true);
                                    await Future.delayed(
                                      const Duration(milliseconds: 700),
                                    );

                                    setState(() => isAdding = false);
                                    // ignore: use_build_context_synchronously
                                    context.read<CartBloc>().add(
                                      AddToCart(CartItem(product: product)),
                                    );
                                    // ignore: use_build_context_synchronously
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          '${product.itemName} agregado al Pedido',
                                        ),
                                        duration: const Duration(seconds: 1),
                                      ),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    shape: const CircleBorder(),
                                    padding: EdgeInsets.zero,
                                    backgroundColor: Colors.orange,
                                    foregroundColor: Colors.white,
                                    elevation: 2,
                                  ),
                                  child: Icon(
                                    Icons.shopping_cart,
                                    size: iconSize + 4,
                                  ),
                                ),
                              ),
                      ),
                    ],
                  ),
                ],
              ),
              if (product.discount != 0)
                Positioned(
                  left: -3,
                  top: -3,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                    decoration: BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: BorderRadius.circular(11),
                    ),
                    child: Text(
                      "OFERTA",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: badgeFont,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

// Clase CardImages para mostrar las imágenes y los nombres de las recetas
class CardImages extends StatelessWidget {
  final GroupItems carruselImages;
  final VoidCallback onTap;
  const CardImages({
    super.key,
    required this.carruselImages,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: Column(
        children: [
          // Imagen del carrusel
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: InkWell(
              splashColor: Colors.red,
              onTap: onTap,
              child: FadeInImage(
                placeholder: const AssetImage("assets/loading1.gif"),
                image: AssetImage(carruselImages.image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Nombre de la receta debajo de la imagen
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              carruselImages.groupItemName,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
