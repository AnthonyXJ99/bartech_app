import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double buttonHeight = 180;
    final Color mainGreen = const Color(0xFF2E7D32);
    final Color accentYellow = const Color(0xFFFFEB3B);
    final Color buttonWhite = Colors.white;

    return Scaffold(
      backgroundColor: mainGreen,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 10),
                // Logo
                Image.asset(
                  "assets/choose/logo.png",
                  height: 120,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 20),
                // Título
                Text(
                  "Selecciona",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 34,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.2,
                    shadows: [
                      Shadow(
                        blurRadius: 6,
                        color: Colors.black.withAlpha(57),
                        offset: const Offset(1, 2),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 28),

                // Botones grandes (Comer aquí / Para llevar)
                Row(
                  children: [
                    _MenuButton(
                      image: "assets/choose/mesa.jpeg",
                      label: "Para comer aquí",
                      color: buttonWhite,
                      accent: accentYellow,
                      height: buttonHeight,
                      onTap: () {
                        context.push("/products");
                      },
                      // onTap: () => Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => const DetailsScreen(
                      //       carruselImages: carruselImages,
                      //     ),
                      //   ),
                      // ),
                    ),
                    const SizedBox(width: 18),
                    _MenuButton(
                      image: "assets/choose/bolso.jpeg",
                      label: "Para llevar",
                      color: buttonWhite,
                      accent: accentYellow,
                      height: buttonHeight,
                      onTap: () {
                        context.push("/products");
                      },
                      // onTap: () => Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => const DetailsScreen(
                      //       carruselImages: carruselImages,
                      //     ),
                      //   ),
                      // ),
                    ),
                  ],
                ),
                const SizedBox(height: 44),

                // Texto de idioma
                Text(
                  "Selecciona tu idioma",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),

                // Botones de idioma
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _LanguageButton(
                      label: "English",
                      color: buttonWhite,
                      accent: accentYellow,
                      textColor: mainGreen,
                      onTap: () {},
                    ),
                    const SizedBox(width: 18),
                    _LanguageButton(
                      label: "Español",
                      color: buttonWhite,
                      accent: accentYellow,
                      textColor: mainGreen,
                      onTap: () {},
                    ),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _MenuButton extends StatelessWidget {
  final String image;
  final String label;
  final Color color;
  final Color accent;
  final double height;
  final VoidCallback onTap;

  const _MenuButton({
    required this.image,
    required this.label,
    required this.color,
    required this.accent,
    required this.height,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: height,
          margin: const EdgeInsets.symmetric(vertical: 4),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: accent, width: 2),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha(21),
                blurRadius: 14,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(14),
                ),
                child: Image.asset(
                  image,
                  height: height * 0.68,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    label,
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 19,
                      fontWeight: FontWeight.w600,
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

class _LanguageButton extends StatelessWidget {
  final String label;
  final Color color;
  final Color accent;
  final Color textColor;
  final VoidCallback onTap;

  const _LanguageButton({
    required this.label,
    required this.color,
    required this.accent,
    required this.textColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 130,
        height: 48,
        margin: const EdgeInsets.symmetric(vertical: 4),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: accent, width: 2),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.08),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: textColor,
              fontSize: 16,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.8,
            ),
          ),
        ),
      ),
    );
  }
}
