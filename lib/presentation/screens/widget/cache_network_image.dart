import 'dart:typed_data';

import 'package:bartech_app/presentation/screens/util/memory_image_cache.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CachedNetworkImage extends StatefulWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit fit;
  final Widget? placeholder;
  final Widget? errorWidget;
  final Duration? fadeInDuration;
  final Color? backgroundColor;
  final BorderRadius? borderRadius;
  
  const CachedNetworkImage({
    Key? key,
    required this.imageUrl,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.placeholder,
    this.errorWidget,
    this.fadeInDuration,
    this.backgroundColor,
    this.borderRadius,
  }) : super(key: key);
  
  @override
  State<CachedNetworkImage> createState() => _CachedNetworkImageState();
}

class _CachedNetworkImageState extends State<CachedNetworkImage>
    with SingleTickerProviderStateMixin {
  Uint8List? _imageBytes;
  bool _isLoading = true;
  bool _hasError = false;
  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;
  
  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
      duration: widget.fadeInDuration ?? const Duration(milliseconds: 300),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _fadeController, curve: Curves.easeInOut),
    );
    _loadImage();
  }
  
  @override
  void dispose() {
    _fadeController.dispose();
    super.dispose();
  }
  
  Future<void> _loadImage() async {
    try {
      final bytes = await MemoryImageCache.getImage(widget.imageUrl);
      
      if (mounted) {
        setState(() {
          _imageBytes = bytes;
          _isLoading = false;
          _hasError = bytes == null;
        });
        
        if (bytes != null) {
          _fadeController.forward();
        }
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _isLoading = false;
          _hasError = true;
        });
      }
    }
  }
  
  Widget _buildPlaceholder() {
    return widget.placeholder ??
        Container(
          width: widget.width,
          height: widget.height,
          color: widget.backgroundColor ?? Colors.grey[300],
          child: const Center(
            child: CircularProgressIndicator(strokeWidth: 2),
          ),
        );
  }
  
  Widget _buildErrorWidget() {
    return widget.errorWidget ??
        Container(
          width: widget.width,
          height: widget.height,
          color: widget.backgroundColor ?? Colors.grey[300],
          child: const Icon(
            Icons.image_not_supported,
            color: Colors.grey,
          ),
        );
  }
  
  Widget _buildImage() {
    final image = Image.memory(
      _imageBytes!,
      width: widget.width,
      height: widget.height,
      fit: widget.fit,
      errorBuilder: (context, error, stackTrace) => _buildErrorWidget(),
    );
    
    if (widget.fadeInDuration != null) {
      return FadeTransition(
        opacity: _fadeAnimation,
        child: image,
      );
    }
    
    return image;
  }
  
  @override
  Widget build(BuildContext context) {
    Widget child;
    
    if (_isLoading) {
      child = _buildPlaceholder();
    } else if (_hasError || _imageBytes == null) {
      child = _buildErrorWidget();
    } else {
      child = _buildImage();
    }
    
    if (widget.borderRadius != null) {
      child = ClipRRect(
        borderRadius: widget.borderRadius!,
        child: child,
      );
    }
    
    return child;
  }
}