import 'dart:developer';
import 'package:bartech_app/data/services/server_config_service.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:restart_app/restart_app.dart';

class ServerConfigScreen extends StatefulWidget {
  const ServerConfigScreen({super.key});

  @override
  State<ServerConfigScreen> createState() => _ServerConfigScreenState();
}

class _ServerConfigScreenState extends State<ServerConfigScreen> {
  final TextEditingController _urlController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  
  bool _isLoading = false;
  String _currentUrl = '';
  String _defaultUrl = '';

  @override
  void initState() {
    super.initState();
    _loadCurrentConfig();
  }

  Future<void> _loadCurrentConfig() async {
    try {
      setState(() => _isLoading = true);
      
      final configInfo = await ServerConfigService.instance.getConfigInfo();
      _currentUrl = configInfo['currentUrl'];
      _defaultUrl = configInfo['defaultUrl'];
      
      _urlController.text = _currentUrl;
      
      setState(() => _isLoading = false);
    } catch (e) {
      log('❌ Error cargando configuración: $e');
      setState(() => _isLoading = false);
    }
  }

  Future<void> _saveConfig() async {
    if (!_formKey.currentState!.validate()) return;

    try {
      setState(() => _isLoading = true);
      
      final newUrl = _urlController.text.trim();
      final success = await ServerConfigService.instance.saveBaseUrl(newUrl);
      
      if (success) {
        _showSuccessDialog();
      } else {
        _showErrorDialog('Error guardando la configuración');
      }
    } catch (e) {
      log('❌ Error guardando configuración: $e');
      _showErrorDialog('Error inesperado: $e');
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _resetToDefault() async {
    try {
      setState(() => _isLoading = true);
      
      final success = await ServerConfigService.instance.resetToDefault();
      
      if (success) {
        _urlController.text = _defaultUrl;
        _showSuccessDialog(message: 'Configuración restablecida a valores por defecto.');
      } else {
        _showErrorDialog('Error restableciendo la configuración');
      }
    } catch (e) {
      log('❌ Error restableciendo configuración: $e');
      _showErrorDialog('Error inesperado: $e');
    } finally {
      setState(() => _isLoading = false);
    }
  }

  void _showSuccessDialog({String? message}) {
    showDialog(
      context: context,
      barrierDismissible: false, // No permitir cerrar tocando fuera
      builder: (context) => AlertDialog(
        title: const Text('✅ Configuración Guardada'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(message ?? 'Configuración guardada correctamente.'),
            const SizedBox(height: 16),
            const Text('La aplicación se reiniciará automáticamente en:'),
            const SizedBox(height: 8),
            _CountdownWidget(
              seconds: 5,
              onCompleted: () {
                Navigator.of(context).pop();
                _restartApp();
              },
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              _restartApp();
            },
            child: const Text('Reiniciar Ahora'),
          ),
        ],
      ),
    );
  }

  void _restartApp() {
    log('🔄 Reiniciando aplicación...');
    Restart.restartApp();
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('❌ Error'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  String? _validateUrl(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Por favor ingresa una URL';
    }
    
    final url = value.trim();
    
    // Validación básica de formato IP:Puerto o dominio
    if (!RegExp(r'^(https?:\/\/)?([\da-z\.-]+)\.?([a-z\.]{2,6})?([\/\w \.-]*)*\/?(\:\d+)?$').hasMatch(url) &&
        !RegExp(r'^(https?:\/\/)?(\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3})(\:\d+)?(\/.*)?\/?$').hasMatch(url)) {
      return 'Formato de URL inválido';
    }
    
    return null;
  }

  @override
  void dispose() {
    _urlController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('⚙️ Configuración del Servidor'),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/welcome'),
        ),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Información actual
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              '📡 Configuración Actual',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 12),
                            Text('URL: $_currentUrl'),
                            const SizedBox(height: 8),
                            Text('Por defecto: $_defaultUrl'),
                          ],
                        ),
                      ),
                    ),
                    
                    const SizedBox(height: 24),
                    
                    // Campo de URL
                    const Text(
                      '🌐 URL del Servidor API',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      controller: _urlController,
                      validator: _validateUrl,
                      decoration: const InputDecoration(
                        hintText: 'http://192.168.1.100:9095',
                        prefixIcon: Icon(Icons.language),
                        border: OutlineInputBorder(),
                        helperText: 'Ingresa la IP y puerto del servidor',
                      ),
                      keyboardType: TextInputType.url,
                    ),
                    
                    const SizedBox(height: 24),
                    
                    // Botones de acción
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: _isLoading ? null : _saveConfig,
                            icon: const Icon(Icons.save),
                            label: const Text('Guardar'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(vertical: 12),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: _isLoading ? null : _resetToDefault,
                            icon: const Icon(Icons.refresh),
                            label: const Text('Restablecer'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orange,
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(vertical: 12),
                            ),
                          ),
                        ),
                      ],
                    ),
                    
                    const SizedBox(height: 32),
                    
                    // Información de ayuda
                    Card(
                      color: Colors.blue[50],
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              '💡 Ayuda',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                            ),
                            const SizedBox(height: 8),
                            const Text('• Formato: http://IP:PUERTO o https://dominio.com'),
                            const Text('• Ejemplo: http://192.168.1.100:9095'),
                            const Text('• La URL debe ser accesible desde este dispositivo'),
                            const Text('• Reinicia la app después de guardar cambios'),
                          ],
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

// Widget para mostrar countdown antes del reinicio
class _CountdownWidget extends StatefulWidget {
  final int seconds;
  final VoidCallback onCompleted;

  const _CountdownWidget({
    required this.seconds,
    required this.onCompleted,
  });

  @override
  State<_CountdownWidget> createState() => _CountdownWidgetState();
}

class _CountdownWidgetState extends State<_CountdownWidget> {
  late int _currentSeconds;
  
  @override
  void initState() {
    super.initState();
    _currentSeconds = widget.seconds;
    _startCountdown();
  }

  void _startCountdown() {
    Future.delayed(const Duration(seconds: 1), () {
      if (mounted) {
        setState(() {
          _currentSeconds--;
        });
        
        if (_currentSeconds <= 0) {
          widget.onCompleted();
        } else {
          _startCountdown();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.orange.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircularProgressIndicator(
            value: (_currentSeconds / widget.seconds),
            backgroundColor: Colors.grey[300],
            valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
          ),
          const SizedBox(width: 16),
          Text(
            '$_currentSeconds segundos',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.orange,
            ),
          ),
        ],
      ),
    );
  }
}