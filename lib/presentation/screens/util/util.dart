import 'dart:io';

class UrlValidator {
  /// Valida si una URL es válida
  /// Retorna la URL si es válida, null si no lo es
  static String? validateUrl(String? url) {
    if (url == null || url.isEmpty) {
      return null;
    }

    try {
      // Intentar parsear la URL
      final uri = Uri.parse(url);

      // Verificar que tenga un esquema válido (http, https, etc.)
      if (uri.scheme.isEmpty) {
        return null;
      }

      // Verificar que tenga un host
      if (uri.host.isEmpty) {
        return null;
      }

      // Si es una URL de red, verificar que sea accesible (opcional)
      if (uri.scheme == 'http' || uri.scheme == 'https') {
        // Aquí podrías agregar una verificación de conectividad si lo necesitas
        return url;
      }

      // Para otros esquemas (file, data, etc.)
      return url;
    } catch (e) {
      // Si hay cualquier error al parsear, la URL no es válida
      return null;
    }
  }

  /// Valida si una URL es una imagen válida
  /// Retorna la URL si es válida, null si no lo es
  static String? validateImageUrl(String? url) {
    final validatedUrl = validateUrl(url);
    if (validatedUrl == null) {
      return null;
    }

    // Verificar que sea una URL de imagen común
    final imageExtensions = ['.jpg', '.jpeg', '.png', '.gif', '.webp', '.bmp'];
    final lowerUrl = validatedUrl.toLowerCase();

    // Verificar extensión de archivo
    final hasValidExtension = imageExtensions.any(
      (ext) => lowerUrl.endsWith(ext),
    );

    // Verificar si contiene palabras clave de imagen en la URL
    final hasImageKeywords =
        lowerUrl.contains('/image') ||
        lowerUrl.contains('/img') ||
        lowerUrl.contains('/photo') ||
        lowerUrl.contains('image/');

    if (hasValidExtension || hasImageKeywords) {
      return validatedUrl;
    }

    return null;
  }

  /// Valida si una URL es accesible (hace una petición HTTP)
  /// Retorna la URL si es accesible, null si no lo es
  static Future<String?> validateAccessibleUrl(String? url) async {
    final validatedUrl = validateUrl(url);
    if (validatedUrl == null) {
      return null;
    }

    try {
      final uri = Uri.parse(validatedUrl);
      if (uri.scheme == 'http' || uri.scheme == 'https') {
        final request = await HttpClient().getUrl(uri);
        final response = await request.close();

        if (response.statusCode >= 200 && response.statusCode < 400) {
          return validatedUrl;
        }
      }
      return validatedUrl; // Para URLs que no son HTTP/HTTPS
    } catch (e) {
      return null;
    }
  }
}

/// Función de conveniencia para validar URLs
String? validateUrl(String? url) => UrlValidator.validateUrl(url);

/// Función de conveniencia para validar URLs de imagen
String? validateImageUrl(String? url) => UrlValidator.validateImageUrl(url);

/// Función de conveniencia para validar URLs accesibles
Future<String?> validateAccessibleUrl(String? url) =>
    UrlValidator.validateAccessibleUrl(url);
