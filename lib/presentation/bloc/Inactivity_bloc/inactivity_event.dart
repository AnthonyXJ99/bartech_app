part of 'inactivity_bloc.dart';

abstract class InactivityEvent extends Equatable {
  const InactivityEvent();
  @override
  List<Object> get props => [];
}

class StartInactivityTimer extends InactivityEvent {
  final int seconds;
  const StartInactivityTimer(this.seconds);
  @override
  List<Object> get props => [seconds];
}

class ResetInactivityTimer extends InactivityEvent {}

class StopInactivityTimer extends InactivityEvent {}

class InactivityTimeoutOccurred extends InactivityEvent {}
