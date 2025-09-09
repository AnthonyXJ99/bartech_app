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

                    final screenWidth = MediaQuery.of(context).size.width;
                    final sidebarWidth = screenWidth > 1000 
                        ? screenWidth * 0.18  // 18% en desktop
                        : screenWidth > 700 
                            ? screenWidth * 0.20  // 20% en tablet
                            : screenWidth * 0.25; // 25% en mobile
                    
                    return Container(
                      width: sidebarWidth,
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
                            // Grid optimizado para tablet y desktop
                            int crossAxisCount;
                            double cardAspectRatio;
                            
                            if (constraints.maxWidth > 1000) {
                              // Desktop: 4 columnas
                              crossAxisCount = 4;
                              cardAspectRatio = 0.75;
                            } else if (constraints.maxWidth > 700) {
                              // Tablet: 3 columnas - CLAVE para la mejora
                              crossAxisCount = 3;
                              cardAspectRatio = 0.8;
                            } else if (constraints.maxWidth > 500) {
                              // Tablet pequeño: 2 columnas
                              crossAxisCount = 2;
                              cardAspectRatio = 0.9;
                            } else {
                              // Mobile: 1 columna
                              crossAxisCount = 1;
                              cardAspectRatio = 1.1;
                            }

                            return GridView.builder(
                              key: ValueKey(
                                state.selectedCategory?.categoryItemCode ??
                                    'no-category',
                              ),
                              padding: const EdgeInsets.only(bottom: 12),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: crossAxisCount,
                                    childAspectRatio: cardAspectRatio,
                                    crossAxisSpacing: constraints.maxWidth > 700 ? 20.0 : 16.0,
                                    mainAxisSpacing: constraints.maxWidth > 700 ? 24.0 : 20.0,
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

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            spreadRadius: 1,
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            spreadRadius: 0,
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
        onTap: () {
          showDialog(
            context: context,
            barrierDismissible: true,
            builder: (_) => BlocBuilder<DetailsBloc, DetailsState>(
              builder: (context, state) => DialogScreen(
                product: product,
                categoryAccompaniments: state.categoryAccompaniments,
              ),
            ),
          );
        },
          child: Padding(
            padding: EdgeInsets.all(screenWidth > 700 ? 20 : 16),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Imagen del producto con mejor proporción
                    Expanded(
                      flex: screenWidth > 700 ? 4 : 3, // Más espacio para imagen en tablet
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.grey[50],
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: _buildProductImage(product.imageUrl),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    
                    // Información del producto compacta
                    Expanded(
                      flex: screenWidth > 700 ? 3 : 2, // Menos espacio para texto en tablet
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Título del producto responsivo
                          Text(
                            product.itemName,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: screenWidth > 700 ? 15 : screenWidth > 500 ? 14 : 13,
                              color: Colors.black87,
                              height: 1.2,
                            ),
                            maxLines: screenWidth > 700 ? 2 : 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 6),
                          
                          // Rating y tiempo
                          Row(
                            children: [
                              Icon(
                                Icons.access_time,
                                size: 14,
                                color: Colors.grey[600],
                              ),
                              const SizedBox(width: 4),
                              Text(
                                "${product.waitingTime ?? "0"}min",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey[600],
                                ),
                              ),
                              const SizedBox(width: 12),
                              Icon(
                                Icons.star_rounded,
                                size: 14,
                                color: Colors.amber[600],
                              ),
                              const SizedBox(width: 2),
                              Text(
                                product.rating?.toStringAsFixed(1) ?? "0.0",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey[600],
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          // Precios y botón mejorados
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              // Precios con mejor jerarquía visual
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    if ((product.discount ?? 0) > 0) ...[
                                      Text(
                                        "CLP \$${product.price.toStringAsFixed(0)}",
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey[500],
                                          decoration: TextDecoration.lineThrough,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      const SizedBox(height: 2),
                                    ],
                                    Text(
                                      "CLP \$${((product.discount ?? 0) > 0 ? (product.price - (product.discount ?? 0)) : product.price).toStringAsFixed(0)}",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: screenWidth > 700 ? 16 : screenWidth > 500 ? 15 : 14,
                                        color: const Color(0xFFFBA63C),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // Botón de agregar mejorado
                              AnimatedContainer(
                                duration: const Duration(milliseconds: 200),
                                width: 40,
                                height: 40,
                                child: AnimatedSwitcher(
                                  duration: const Duration(milliseconds: 300),
                                  child: isAdding
                                      ? Container(
                                          key: const ValueKey('loading'),
                                          decoration: BoxDecoration(
                                            color: Colors.orange[100],
                                            shape: BoxShape.circle,
                                          ),
                                          child: const Center(
                                            child: SizedBox(
                                              width: 20,
                                              height: 20,
                                              child: CircularProgressIndicator(
                                                strokeWidth: 2,
                                                valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
                                              ),
                                            ),
                                          ),
                                        )
                                      : Material(
                                          key: const ValueKey('button'),
                                          color: Colors.transparent,
                                          child: InkWell(
                                            borderRadius: BorderRadius.circular(20),
                                            onTap: () async {
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
                                                  backgroundColor: Colors.green[600],
                                                  behavior: SnackBarBehavior.floating,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(8),
                                                  ),
                                                ),
                                              );
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                gradient: LinearGradient(
                                                  colors: [
                                                    Colors.orange[400]!,
                                                    Colors.orange[600]!,
                                                  ],
                                                  begin: Alignment.topLeft,
                                                  end: Alignment.bottomRight,
                                                ),
                                                shape: BoxShape.circle,
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.orange.withOpacity(0.3),
                                                    spreadRadius: 1,
                                                    blurRadius: 6,
                                                    offset: const Offset(0, 2),
                                                  ),
                                                ],
                                              ),
                                              child: const Center(
                                                child: Icon(
                                                  Icons.add,
                                                  color: Colors.white,
                                                  size: 20,
                                                ),
                                              ),
                                            ),
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
                ),
                
                // Badge de oferta mejorado
                if ((product.discount ?? 0) > 0)
                  Positioned(
                    top: 8,
                    left: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.red[500]!,
                            Colors.red[700]!,
                          ],
                        ),
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.red.withOpacity(0.3),
                            spreadRadius: 1,
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: const Text(
                        "OFERTA",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
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
