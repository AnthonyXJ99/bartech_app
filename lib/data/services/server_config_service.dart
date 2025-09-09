import 'dart:developer';
import 'package:shared_preferences/shared_preferences.dart';

class ServerConfigService {
  static const String _baseUrlKey = 'server_base_url';
  static const String _defaultBaseUrl = 'http://192.168.18.239:5023/';

  static ServerConfigService? _instance;
  static ServerConfigService get instance {
    _instance ??= ServerConfigService._internal();
    return _instance!;
  }

  ServerConfigService._internal();

  Future<String> getBaseUrl() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final savedUrl = prefs.getString(_baseUrlKey);
      log('📡 ServerConfig - URL cargada: ${savedUrl ?? _defaultBaseUrl}');
      return savedUrl ?? _defaultBaseUrl;
    } catch (e) {
      log('❌ ServerConfig - Error cargando URL: $e');
      return _defaultBaseUrl;
    }
  }

  Future<bool> saveBaseUrl(String baseUrl) async {
    try {
      final prefs = await SharedPreferences.getInstance();

      // Asegurar que termine con /
      String formattedUrl = baseUrl.trim();
      if (!formattedUrl.endsWith('/')) {
        formattedUrl += '/';
      }

      // Asegurar que comience con http:// o https://
      if (!formattedUrl.startsWith('http://') &&
          !formattedUrl.startsWith('https://')) {
        formattedUrl = 'http://$formattedUrl';
      }

      final success = await prefs.setString(_baseUrlKey, formattedUrl);
      log('💾 ServerConfig - URL guardada: $formattedUrl - Success: $success');
      return success;
    } catch (e) {
      log('❌ ServerConfig - Error guardando URL: $e');
      return false;
    }
  }

  Future<bool> resetToDefault() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final success = await prefs.remove(_baseUrlKey);
      log('🔄 ServerConfig - Reset a URL por defecto: $_defaultBaseUrl');
      return success;
    } catch (e) {
      log('❌ ServerConfig - Error reseteando URL: $e');
      return false;
    }
  }

  String get defaultBaseUrl => _defaultBaseUrl;

  Future<Map<String, dynamic>> getConfigInfo() async {
    final currentUrl = await getBaseUrl();
    return {
      'currentUrl': currentUrl,
      'defaultUrl': _defaultBaseUrl,
      'isDefault': currentUrl == _defaultBaseUrl,
    };
  }
}
