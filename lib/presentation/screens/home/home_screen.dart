import 'package:bartech_app/presentation/bloc/Inactivity_bloc/inactivity_bloc.dart';
import 'package:bartech_app/presentation/bloc/cart_bloc/cart_bloc.dart';
import 'package:bartech_app/presentation/bloc/image_bloc/image_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

// Enum para mejor gestión de tipos de comida
enum OrderType { dineIn, takeaway }

// Enum para idiomas soportados
enum Language { english, spanish }

// Constantes para colores y dimensiones
class AppTheme {
  static const Color mainGreen = Color(0xFF2E7D32);
  static const Color accentYellow = Color(0xFFFFEB3B);
  static const Color buttonWhite = Colors.white;
  static const Color shadowColor = Color(0x15000000);

  static const double buttonHeight = 180.0;
  static const double horizontalPadding = 18.0;
  static const double borderRadius = 16.0;
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  ImageBloc? _imageBloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _imageBloc = context.read<ImageBloc>();
  }

  @override
  void initState() {
    super.initState();

    // Configurar animaciones
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.0, 0.7, curve: Curves.easeOut),
      ),
    );

    _slideAnimation =
        Tween<Offset>(begin: const Offset(0, 0.3), end: Offset.zero).animate(
          CurvedAnimation(
            parent: _animationController,
            curve: const Interval(0.3, 1.0, curve: Curves.easeOutBack),
          ),
        );

    // Cargar logo
    _loadLogo();

    // Iniciar animaciones
    _animationController.forward();
  }

  @override
  void dispose() {
    // Limpiar imágenes de logo al salir
    _imageBloc?.add(const ClearImagesEvent(type: "Logo"));
    _animationController.dispose();
    super.dispose();
  }

  void _loadLogo() {
    context.read<ImageBloc>().add(const LoadImagesEvent(type: "Logo"));
  }

  void _handleOrderTypeSelection(OrderType orderType) {
    // Aquí puedes agregar lógica específica según el tipo de orden
    // Por ejemplo, guardar en un provider o bloc el tipo seleccionado

    context.push("/products");

    // Ejemplo de como podrías pasar parámetros:
    // context.push("/products", extra: {"orderType": orderType});
  }

  void _handleLanguageSelection(Language language) {
    // Implementar cambio de idioma
    // Aquí puedes usar un provider de localización o bloc
    print('Idioma seleccionado: ${language.name}');

    // Ejemplo: context.read<LanguageBloc>().add(ChangeLanguage(language));
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final isCompactScreen = screenHeight < 700;

    return Scaffold(
      backgroundColor: AppTheme.mainGreen,
      body: SafeArea(
        child: BlocListener<InactivityBloc, InactivityState>(
          listener: _handleInactivityState,
          child: AnimatedBuilder(
            animation: _animationController,
            builder: (context, child) {
              return FadeTransition(
                opacity: _fadeAnimation,
                child: SlideTransition(
                  position: _slideAnimation,
                  child: _buildContent(isCompactScreen),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  void _handleInactivityState(BuildContext context, InactivityState state) {
    debugPrint('Estado de inactividad: $state');

    if (state is InactivityExpired) {
      final currentRoute = GoRouterState.of(context).uri.toString();
      if (currentRoute != '/') {
        context.read<CartBloc>().add(ClearCart());
        context.go('/');
      }
      context.read<InactivityBloc>().add(StopInactivityTimer());
    }
  }

  Widget _buildContent(bool isCompactScreen) {
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: AppTheme.horizontalPadding,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: isCompactScreen ? 10 : 20),

            // Logo con estado mejorado
            _buildLogo(),

            SizedBox(height: isCompactScreen ? 15 : 20),

            // Título con mejor tipografía
            _buildTitle(),

            SizedBox(height: isCompactScreen ? 20 : 28),

            // Botones principales mejorados
            _buildOrderTypeButtons(),

            SizedBox(height: isCompactScreen ? 30 : 44),

            // Sección de idiomas mejorada
            _buildLanguageSection(),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return BlocBuilder<ImageBloc, ImageState>(
      builder: (context, state) {
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: _buildLogoContent(state),
        );
      },
    );
  }

  Widget _buildLogoContent(ImageState state) {
    if (state is ImageLoaded) {
      final logoImages = state.getImagesByType("Logo");
      if (logoImages.isNotEmpty) {
        final logoImage = logoImages.first;
        return Hero(
          tag: 'app_logo',
          child: CachedNetworkImage(
            imageUrl: logoImage.publicUrl!,
            height: 120,
            fit: BoxFit.contain,
            placeholder: (context, url) => Container(
              color: Colors.grey[300],
              child: const Center(child: CircularProgressIndicator()),
            ),
            errorWidget: (context, url, error) {
              return Image.asset("assets/choose/logo.png", fit: BoxFit.contain);
            },
          ),
        );
      }
    } else if (state is ImageLoading && state.type == "Logo") {
      return _buildLogoPlaceholder();
    } else if (state is ImageError && state.type == "Logo") {
      return _buildFallbackLogo();
    }

    return _buildFallbackLogo();
  }

  Widget _buildLogoPlaceholder() {
    return const SizedBox(
      height: 120,
      child: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(AppTheme.accentYellow),
          strokeWidth: 3,
        ),
      ),
    );
  }

  Widget _buildFallbackLogo() {
    return Image.asset(
      "assets/choose/logo.png",
      height: 120,
      fit: BoxFit.contain,
      errorBuilder: (context, error, stackTrace) {
        return Container(
          height: 120,
          width: 120,
          decoration: BoxDecoration(
            color: AppTheme.buttonWhite,
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Icon(
            Icons.restaurant_menu,
            size: 48,
            color: AppTheme.mainGreen,
          ),
        );
      },
    );
  }

  Widget _buildTitle() {
    return Text(
      "Selecciona",
      style: Theme.of(context).textTheme.headlineLarge?.copyWith(
        color: Colors.white,
        fontSize: 34,
        fontWeight: FontWeight.w700,
        letterSpacing: 1.2,
        shadows: [
          Shadow(
            blurRadius: 6,
            color: Colors.black.withOpacity(0.3),
            offset: const Offset(1, 2),
          ),
        ],
      ),
    );
  }

  Widget _buildOrderTypeButtons() {
    return Row(
      children: [
        Expanded(
          child: MenuButton(
            image: "assets/choose/mesa.jpeg",
            label: "Para comer aquí",
            icon: Icons.restaurant,
            onTap: () => _handleOrderTypeSelection(OrderType.dineIn),
          ),
        ),
        const SizedBox(width: AppTheme.horizontalPadding),
        Expanded(
          child: MenuButton(
            image: "assets/choose/bolso.jpeg",
            label: "Para llevar",
            icon: Icons.takeout_dining,
            onTap: () => _handleOrderTypeSelection(OrderType.takeaway),
          ),
        ),
      ],
    );
  }

  Widget _buildLanguageSection() {
    return Column(
      children: [
        Text(
          "Selecciona tu idioma",
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LanguageButton(
              label: "English",
              flag: "🇺🇸",
              onTap: () => _handleLanguageSelection(Language.english),
            ),
            const SizedBox(width: AppTheme.horizontalPadding),
            LanguageButton(
              label: "Español",
              flag: "🇪🇸",
              onTap: () => _handleLanguageSelection(Language.spanish),
            ),
          ],
        ),
      ],
    );
  }
}

class MenuButton extends StatefulWidget {
  final String image;
  final String label;
  final IconData icon;
  final VoidCallback onTap;

  const MenuButton({
    super.key,
    required this.image,
    required this.label,
    required this.icon,
    required this.onTap,
  });

  @override
  State<MenuButton> createState() => _MenuButtonState();
}

class _MenuButtonState extends State<MenuButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  bool _isPressed = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 0.95,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleTapDown(TapDownDetails details) {
    setState(() => _isPressed = true);
    _controller.forward();
  }

  void _handleTapUp(TapUpDetails details) {
    setState(() => _isPressed = false);
    _controller.reverse();
    widget.onTap();
  }

  void _handleTapCancel() {
    setState(() => _isPressed = false);
    _controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _handleTapDown,
      onTapUp: _handleTapUp,
      onTapCancel: _handleTapCancel,
      child: AnimatedBuilder(
        animation: _scaleAnimation,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 150),
              height: AppTheme.buttonHeight,
              margin: const EdgeInsets.symmetric(vertical: 4),
              decoration: BoxDecoration(
                color: AppTheme.buttonWhite,
                borderRadius: BorderRadius.circular(AppTheme.borderRadius),
                border: Border.all(
                  color: _isPressed
                      ? AppTheme.accentYellow.withOpacity(0.8)
                      : AppTheme.accentYellow,
                  width: 2,
                ),
                boxShadow: [
                  BoxShadow(
                    color: _isPressed
                        ? Colors.black.withOpacity(0.1)
                        : Colors.black.withOpacity(0.08),
                    blurRadius: _isPressed ? 8 : 14,
                    offset: _isPressed
                        ? const Offset(0, 2)
                        : const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  // Imagen
                  Expanded(
                    flex: 3,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(AppTheme.borderRadius - 2),
                      ),
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          Image.asset(
                            widget.image,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                color: Colors.grey.shade200,
                                child: Icon(
                                  widget.icon,
                                  size: 48,
                                  color: AppTheme.mainGreen,
                                ),
                              );
                            },
                          ),
                          // Overlay sutil
                          Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.transparent,
                                  Colors.black.withOpacity(0.1),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Label
                  Expanded(
                    flex: 1,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            widget.icon,
                            size: 20,
                            color: AppTheme.mainGreen,
                          ),
                          const SizedBox(width: 8),
                          Flexible(
                            child: Text(
                              widget.label,
                              style: const TextStyle(
                                color: Colors.black87,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
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
        },
      ),
    );
  }
}

class LanguageButton extends StatefulWidget {
  final String label;
  final String flag;
  final VoidCallback onTap;

  const LanguageButton({
    super.key,
    required this.label,
    required this.flag,
    required this.onTap,
  });

  @override
  State<LanguageButton> createState() => _LanguageButtonState();
}

class _LanguageButtonState extends State<LanguageButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) {
        setState(() => _isPressed = false);
        widget.onTap();
      },
      onTapCancel: () => setState(() => _isPressed = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        width: 130,
        height: 48,
        margin: const EdgeInsets.symmetric(vertical: 4),
        decoration: BoxDecoration(
          color: _isPressed
              ? AppTheme.buttonWhite.withOpacity(0.9)
              : AppTheme.buttonWhite,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: _isPressed
                ? AppTheme.accentYellow.withOpacity(0.8)
                : AppTheme.accentYellow,
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: _isPressed
                  ? Colors.black.withOpacity(0.05)
                  : Colors.black.withOpacity(0.08),
              blurRadius: _isPressed ? 4 : 6,
              offset: _isPressed ? const Offset(0, 1) : const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(widget.flag, style: const TextStyle(fontSize: 18)),
            const SizedBox(width: 8),
            Text(
              widget.label,
              style: TextStyle(
                color: AppTheme.mainGreen,
                fontSize: 16,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
