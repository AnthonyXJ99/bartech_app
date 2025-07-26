import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:bartech_app/presentation/bloc/image_bloc/image_bloc.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final List<String> fallbackImages = [
    'assets/slider/1.jpeg',
    'assets/slider/2.jpeg',
    'assets/slider/3.jpeg',
    'assets/slider/4.jpeg',
  ];
  ImageBloc? _imageBloc;

  // Variables para triple tap detection
  int _tapCount = 0;
  DateTime? _lastTapTime;
  static const Duration _tapTimeout = Duration(
    milliseconds: 500,
  ); // 500ms entre taps

  // Variables para gesture drawing (patrón S)
  List<Offset> _gesturePoints = [];
  bool _isDrawing = false;

  // Variables para corner tap sequence (4 esquinas)
  List<String> _cornerSequence = [];
  DateTime? _lastCornerTap;
  static const Duration _cornerTimeout = Duration(seconds: 3);

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _imageBloc = context.read<ImageBloc>();
  }

  @override
  void initState() {
    super.initState();
    // Cargar imágenes de publicidad
    context.read<ImageBloc>().add(const LoadImagesEvent(type: "Publicidad"));
  }

  @override
  void dispose() {
    // Limpiar imágenes de publicidad al salir
    _imageBloc?.add(const ClearImagesEvent(type: "Publicidad"));
    super.dispose();
  }

  void _handleTripleTap() {
    final now = DateTime.now();

    // Si es el primer tap o ha pasado mucho tiempo, reiniciar contador
    if (_lastTapTime == null || now.difference(_lastTapTime!) > _tapTimeout) {
      _tapCount = 1;
    } else {
      _tapCount++;
    }

    _lastTapTime = now;

    // Triple tap detectado - ir a configuración
    if (_tapCount >= 7) {
      _tapCount = 0; // Reset counter
      _lastTapTime = null;
      context.push("/server-config");
      return;
    }
  }

  void _handleTapWithPosition(TapDownDetails details) {
    final position = details.localPosition;
    final screenSize = MediaQuery.of(context).size;

    // Determinar en qué esquina se hizo tap (área de 100x100 en cada esquina)
    String? corner;
    const double cornerSize = 100.0;

    // Ajustar áreas de esquinas para evitar conflicto con botón inferior
    const double bottomButtonHeight = 80.0; // Altura aproximada del botón verde

    if (position.dx < cornerSize && position.dy < cornerSize) {
      corner = 'TL'; // Top Left
    } else if (position.dx > screenSize.width - cornerSize &&
        position.dy < cornerSize) {
      corner = 'TR'; // Top Right
    } else if (position.dx < cornerSize &&
        position.dy > screenSize.height - cornerSize - bottomButtonHeight) {
      corner = 'BL'; // Bottom Left (más arriba del botón)
    } else if (position.dx > screenSize.width - cornerSize &&
        position.dy > screenSize.height - cornerSize - bottomButtonHeight) {
      corner = 'BR'; // Bottom Right (más arriba del botón)
    }

    if (corner != null) {
      final now = DateTime.now();

      // Reset sequence si ha pasado mucho tiempo
      if (_lastCornerTap == null ||
          now.difference(_lastCornerTap!) > _cornerTimeout) {
        _cornerSequence.clear();
      }

      _cornerSequence.add(corner);
      _lastCornerTap = now;

      // Verificar secuencia mágica: TL → TR → BL → BR
      if (_cornerSequence.length >= 4) {
        final last4 = _cornerSequence.take(4).toList();
        if (last4.join() == 'TLTRBLBR') {
          _cornerSequence.clear();
          context.push("/server-config");
          return;
        }
      }

      // Limpiar secuencia si es muy larga
      if (_cornerSequence.length > 6) {
        _cornerSequence.clear();
      }
    }

    // También detectar triple tap en cualquier parte
    _handleTripleTap();
  }

  void _onPanStart(DragStartDetails details) {
    _isDrawing = true;
    _gesturePoints.clear();
    _gesturePoints.add(details.localPosition);
  }

  void _onPanUpdate(DragUpdateDetails details) {
    if (_isDrawing) {
      _gesturePoints.add(details.localPosition);
    }
  }

  void _onPanEnd(DragEndDetails details) {
    if (_isDrawing && _gesturePoints.length > 10) {
      _checkSPattern();
    }
    _isDrawing = false;
    _gesturePoints.clear();
  }

  void _checkSPattern() {
    if (_gesturePoints.length < 10) return;

    // Simplificado: verificar movimiento en forma de S
    // Debe ir: derecha → abajo → izquierda → abajo → derecha
    try {
      final start = _gesturePoints.first;
      final end = _gesturePoints.last;
      final middle = _gesturePoints[_gesturePoints.length ~/ 2];

      // Verificar patrón básico de S: inicio arriba-izquierda, fin abajo-derecha
      bool isValidS =
          start.dx < middle.dx && // Inicia yendo a la derecha
          middle.dx > end.dx && // En el medio va a la izquierda
          start.dy < end.dy && // Va de arriba hacia abajo
          (end.dy - start.dy).abs() > 50 && // Movimiento vertical mínimo
          (middle.dx - start.dx).abs() > 50; // Movimiento horizontal mínimo

      if (isValidS) {
        context.push("/server-config");
      }
    } catch (e) {
      // Si hay error en el patrón, ignorar
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTapDown: _handleTapWithPosition,
        onPanStart: _onPanStart,
        onPanUpdate: _onPanUpdate,
        onPanEnd: _onPanEnd,

        child: Stack(
          children: [
            // Carrusel de imágenes sin padding
            BlocBuilder<ImageBloc, ImageState>(
              builder: (context, state) {
                if (state is ImageLoaded) {
                  final publicidadImages = state.getImagesByType("Publicidad");
                  if (publicidadImages.isNotEmpty) {
                    return CarouselSlider(
                      items: publicidadImages.map((image) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.black,
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: CachedNetworkImage(
                                  imageUrl: image.publicUrl!,
                                  fit: BoxFit.cover,
                                  placeholder: (context, url) => Container(
                                    color: Colors.grey[300],
                                    child: const Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                  ),
                                  errorWidget: (context, url, error) {
                                    return Image.asset(
                                      "assets/products/no_image.png",
                                      fit: BoxFit.contain,
                                    );
                                  },
                                ),
                              ),
                            );
                          },
                        );
                      }).toList(),
                      options: CarouselOptions(
                        height: MediaQuery.of(context).size.height,
                        enlargeCenterPage: true,
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 3),
                        autoPlayAnimationDuration: const Duration(
                          milliseconds: 800,
                        ),
                        scrollDirection: Axis.horizontal,
                        viewportFraction: 1.0,
                        disableCenter: true,
                      ),
                    );
                  }
                } else if (state is ImageLoading &&
                    state.type == "Publicidad") {
                  return Container(
                    height: MediaQuery.of(context).size.height,
                    color: Colors.grey[300],
                    child: const Center(child: CircularProgressIndicator()),
                  );
                }

                // Fallback a imágenes locales si no hay datos o hay error
                return CarouselSlider(
                  items: fallbackImages.map((imagePath) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.black,
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(imagePath, fit: BoxFit.cover),
                          ),
                        );
                      },
                    );
                  }).toList(),
                  options: CarouselOptions(
                    height: MediaQuery.of(context).size.height,
                    enlargeCenterPage: true,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 3),
                    autoPlayAnimationDuration: const Duration(
                      milliseconds: 800,
                    ),
                    scrollDirection: Axis.horizontal,
                    viewportFraction: 1.0,
                    disableCenter: true,
                  ),
                );
              },
            ),

            // Contenedor simulado como un AppBar en la parte inferior
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: GestureDetector(
                onTapDown: (details) {
                  // Verificar si es tap en esquinas del botón para gesto secreto
                  final buttonPosition = details.localPosition;
                  const double cornerSize =
                      50.0; // Esquinas más pequeñas en el botón

                  String? corner;
                  if (buttonPosition.dx < cornerSize &&
                      buttonPosition.dy < 20) {
                    corner = 'BL'; // Bottom Left en el botón
                  } else if (buttonPosition.dx > 300 &&
                      buttonPosition.dy < 20) {
                    // Suponiendo que el botón tiene ~350px de ancho
                    corner = 'BR'; // Bottom Right en el botón
                  }

                  if (corner != null) {
                    // Procesar como gesto secreto
                    final now = DateTime.now();
                    if (_lastCornerTap == null ||
                        now.difference(_lastCornerTap!) > _cornerTimeout) {
                      _cornerSequence.clear();
                    }
                    _cornerSequence.add(corner);
                    _lastCornerTap = now;

                    if (_cornerSequence.length >= 4) {
                      final last4 = _cornerSequence.take(4).toList();
                      if (last4.join() == 'TLTRBLBR') {
                        _cornerSequence.clear();
                        context.push("/server-config");
                        return;
                      }
                    }
                  } else {
                    // Tap normal en el botón - ir a home
                    context.push("/home");
                  }
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15.0,
                    vertical: 10.0,
                  ), // Ajustamos el padding
                  decoration: BoxDecoration(
                    color: Colors.green, // Color de fondo
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withAlpha(
                          127,
                        ), // Sombra para el efecto de AppBar
                        blurRadius: 10.0, // Difuminar la sombra
                        offset: const Offset(
                          0,
                          -3,
                        ), // Desplazamiento de la sombra
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment
                        .start, // Alinea el contenido a la izquierda
                    crossAxisAlignment:
                        CrossAxisAlignment.center, // Centra verticalmente
                    children: [
                      // Imagen del logo con un espacio debajo
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/choose/logo.png', // Ruta de la imagen
                            height: 50, // Ajusta el tamaño de la imagen
                            width: 50, // Ajusta el tamaño de la imagen
                          ),
                          const SizedBox(height: 5), // Espacio debajo del logo
                        ],
                      ),

                      const SizedBox(
                        width: 10,
                      ), // Espacio entre la imagen y el texto
                      // Texto centrado
                      const Expanded(
                        child: Center(
                          child: Text(
                            "ORDENE AQUÍ", // Texto del "AppBar"
                            style: TextStyle(
                              fontSize: 20, // Tamaño del texto
                              color: Colors.white,
                              fontWeight: FontWeight.bold, // Negrita
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
