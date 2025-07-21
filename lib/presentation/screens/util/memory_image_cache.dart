import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class MemoryImageCache {
  static final Map<String, Uint8List> _cache = {};
  static final Map<String, int> _accessCount = {};
  static final Map<String, DateTime> _lastAccess = {};
  static const int _maxCacheSize = 30 * 1024 * 1024; // 30MB en RAM
  static const int _maxImages = 150; // Máximo 150 imágenes
  static int _currentSize = 0;

  /// Obtiene una imagen del cache o la descarga
  static Future<Uint8List?> getImage(String imageUrl) async {
    if (_cache.containsKey(imageUrl)) {
      // Actualizar estadísticas de acceso
      _accessCount[imageUrl] = (_accessCount[imageUrl] ?? 0) + 1;
      _lastAccess[imageUrl] = DateTime.now();
      return _cache[imageUrl];
    }

    // Descargar si no está en cache
    try {
      final dio = Dio();
      final response = await dio.get<List<int>>(
        imageUrl,
        options: Options(responseType: ResponseType.bytes),
      );
      if (response.statusCode == 200) {
        final bytes = Uint8List.fromList(response.data!);

        // Verificar si necesitamos limpiar cache antes de agregar
        if (_needsCleanup(bytes.length)) {
          _performCleanup();
        }

        // Agregar al cache si hay espacio
        if (_currentSize + bytes.length <= _maxCacheSize &&
            _cache.length < _maxImages) {
          _cache[imageUrl] = bytes;
          _accessCount[imageUrl] = 1;
          _lastAccess[imageUrl] = DateTime.now();
          _currentSize += bytes.length;
        }

        return bytes;
      }
    } catch (e) {
      debugPrint('Error downloading image: $e');
    }

    return null;
  }

  /// Verifica si necesita limpieza del cache
  static bool _needsCleanup(int newImageSize) {
    return _currentSize + newImageSize > _maxCacheSize ||
        _cache.length >= _maxImages;
  }

  /// Limpia el cache eliminando las imágenes menos usadas
  static void _performCleanup() {
    if (_cache.isEmpty) return;

    // Crear lista de entradas ordenadas por prioridad (menos usadas primero)
    final entries = _cache.keys.map((key) {
      final accessCount = _accessCount[key] ?? 0;
      final lastAccess = _lastAccess[key] ?? DateTime.now();
      final size = _cache[key]!.length;

      // Calcular score (mayor score = más importante)
      final daysSinceAccess = DateTime.now().difference(lastAccess).inDays;
      final score = accessCount.toDouble() / (daysSinceAccess + 1);

      return MapEntry(key, {
        'score': score,
        'size': size,
        'accessCount': accessCount,
        'lastAccess': lastAccess,
      });
    }).toList();

    // Ordenar por score (menor score primero = candidatos a eliminación)
    entries.sort(
      (a, b) => ((a.value['score'] ?? 0.0) as double).compareTo(
        (b.value['score'] ?? 0.0) as double,
      ),
    );

    // Eliminar hasta estar dentro del límite (mantener 70% del límite)
    final targetSize = (_maxCacheSize * 0.7).round();
    final targetCount = (_maxImages * 0.7).round();

    for (final entry in entries) {
      if (_currentSize <= targetSize && _cache.length <= targetCount) {
        break;
      }

      final key = entry.key;
      final size = entry.value['size'] as int;

      _cache.remove(key);
      _accessCount.remove(key);
      _lastAccess.remove(key);
      _currentSize -= size;
    }

    debugPrint(
      'Cache cleanup completed. Size: ${_currentSize}B, Images: ${_cache.length}',
    );
  }

  /// Limpia todo el cache
  static void clearCache() {
    _cache.clear();
    _accessCount.clear();
    _lastAccess.clear();
    _currentSize = 0;
    debugPrint('Cache cleared completely');
  }

  /// Obtiene estadísticas del cache
  static Map<String, dynamic> getCacheStats() {
    return {
      'totalSize': _currentSize,
      'totalImages': _cache.length,
      'maxSize': _maxCacheSize,
      'maxImages': _maxImages,
      'usagePercentage': ((_currentSize / _maxCacheSize) * 100).toStringAsFixed(
        1,
      ),
      'imagesPercentage': ((_cache.length / _maxImages) * 100).toStringAsFixed(
        1,
      ),
    };
  }

  /// Precargar una imagen específica
  static Future<bool> preloadImage(String imageUrl) async {
    try {
      final bytes = await getImage(imageUrl);
      return bytes != null;
    } catch (e) {
      debugPrint('Error preloading image: $e');
      return false;
    }
  }

  /// Eliminar una imagen específica del cache
  static void removeImage(String imageUrl) {
    if (_cache.containsKey(imageUrl)) {
      _currentSize -= _cache[imageUrl]!.length;
      _cache.remove(imageUrl);
      _accessCount.remove(imageUrl);
      _lastAccess.remove(imageUrl);
    }
  }
}
