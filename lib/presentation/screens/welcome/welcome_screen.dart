import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WelcomeScreen extends StatelessWidget {
  WelcomeScreen({super.key});

  final List<String> images = [
    'assets/slider/1.jpeg',
    'assets/slider/2.jpeg',
    'assets/slider/3.jpeg',
    'assets/slider/4.jpeg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          // Navegar a la página ChooseOptionPage
          context.push("/home");
        },
        child: Stack(
          children: [
            // Carrusel de imágenes sin padding
            CarouselSlider(
              items: images.map((imagePath) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(
                        context,
                      ).size.width, // El carrusel ocupa todo el ancho
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
                height: MediaQuery.of(
                  context,
                ).size.height, // Se adapta al tamaño de la pantalla
                enlargeCenterPage:
                    true, // Aumenta el tamaño de la imagen central
                autoPlay: true, // Activar el cambio automático de imágenes
                autoPlayInterval: const Duration(
                  seconds: 3,
                ), // Cambiar cada 3 segundos
                autoPlayAnimationDuration: const Duration(
                  milliseconds: 800,
                ), // Duración de la animación de transición
                scrollDirection: Axis.horizontal, // Deslizar horizontalmente
                viewportFraction: 1.0, // Ocupa todo el ancho de la pantalla
                disableCenter:
                    true, // Deshabilita el centrado automático de las imágenes
              ),
            ),

            // Contenedor simulado como un AppBar en la parte inferior
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
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
          ],
        ),
      ),
    );
  }
}
