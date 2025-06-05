import 'package:bartech_app/presentation/bloc/Inactivity_bloc/inactivity_bloc.dart';
import 'package:bartech_app/presentation/bloc/cart_bloc/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class InactivityWrapperScreen extends StatelessWidget {
  final Widget child;
  final int timeoutInSeconds;
  final String redirectRoute;

  const InactivityWrapperScreen({
    super.key,
    required this.child,
    required this.timeoutInSeconds,
    required this.redirectRoute,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          InactivityBloc()..add(StartInactivityTimer(timeoutInSeconds)),
      child: BlocListener<InactivityBloc, InactivityState>(
        listener: (context, state) {
          if (state is InactivityExpired) {
            // Redirigir a la pantalla principal
            context.read<CartBloc>().add(ClearCart());
            context.go(redirectRoute);
          }
        },
        child: InactivityDetector(child: child),
      ),
    );
  }
}

class InactivityDetector extends StatefulWidget {
  final Widget child;

  const InactivityDetector({super.key, required this.child});

  @override
  State<InactivityDetector> createState() => _InactivityDetectorState();
}

class _InactivityDetectorState extends State<InactivityDetector> {
  DateTime? _lastActivityTime;
  static const _debounceTime = Duration(milliseconds: 500);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _resetTimer(context),
      onScaleStart: (_) => _resetTimer(context),
      onScaleUpdate: (_) => _resetTimer(context),
      behavior: HitTestBehavior.translucent,
      child: Listener(
        onPointerDown: (_) => _resetTimer(context),
        onPointerMove: (_) => _resetTimer(context),
        child: widget.child,
      ),
    );
  }

  void _resetTimer(BuildContext context) {
    final now = DateTime.now();

    // Debounce: solo procesar si ha pasado suficiente tiempo desde la última actividad
    if (_lastActivityTime == null ||
        now.difference(_lastActivityTime!) > _debounceTime) {
      print('👆 Actividad detectada - reiniciando timer');
      _lastActivityTime = now;

      // Usar addPostFrameCallback para evitar problemas de timing
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          context.read<InactivityBloc>().add(ResetInactivityTimer());
        }
      });
    }
  }
}
