part of 'inactivity_bloc.dart';

abstract class InactivityState extends Equatable {
  const InactivityState();
  @override
  List<Object> get props => [];
}

class InactivityIdle extends InactivityState {}

class InactivityRunning extends InactivityState {
  final int remainingSeconds;
  const InactivityRunning(this.remainingSeconds);
  @override
  List<Object> get props => [remainingSeconds];
}

class InactivityExpired extends InactivityState {}
