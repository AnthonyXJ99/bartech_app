import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'inactivity_event.dart';
part 'inactivity_state.dart';

class InactivityBloc extends Bloc<InactivityEvent, InactivityState> {
  Timer? _timer;
  int _totalSeconds = 0;
  int _remainingSeconds = 0;

  InactivityBloc() : super(InactivityIdle()) {
    on<StartInactivityTimer>(_onStart);
    on<ResetInactivityTimer>(_onReset);
    on<StopInactivityTimer>(_onStop);
    on<InactivityTimeoutOccurred>(_onTimeout);
  }

  void _onStart(StartInactivityTimer event, Emitter<InactivityState> emit) {
    print('🟢 Iniciando timer de inactividad: ${event.seconds} segundos');
    _totalSeconds = event.seconds;
    _remainingSeconds = event.seconds;
    _startTimer();
    emit(InactivityRunning(_remainingSeconds));
  }

  void _onReset(ResetInactivityTimer event, Emitter<InactivityState> emit) {
    print('🔄 Reiniciando timer de inactividad');
    _timer?.cancel();
    _remainingSeconds = _totalSeconds;
    _startTimer();
    emit(InactivityRunning(_remainingSeconds));
  }

  void _onStop(StopInactivityTimer event, Emitter<InactivityState> emit) {
    print('🛑 Deteniendo timer de inactividad');
    _timer?.cancel();
    emit(InactivityIdle());
  }

  void _onTimeout(
    InactivityTimeoutOccurred event,
    Emitter<InactivityState> emit,
  ) {
    print('⏰ ¡Timeout de inactividad!');
    _timer?.cancel();
    emit(InactivityExpired());
  }

  void _startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _remainingSeconds--;
      print('⏱️  Tiempo restante: $_remainingSeconds segundos');
      if (_remainingSeconds <= 0) {
        timer.cancel(); // ← Detén el timer aquí
        add(InactivityTimeoutOccurred());
      }
    });
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
