import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'payment_event.dart';
part 'payment_state.dart';

class PaymentBloc extends Bloc<SelectPaymentMethod, PaymentState> {
  PaymentBloc() : super(const PaymentState()) {
    on<SelectPaymentMethod>((event, emit) {
      emit(state.copyWith(selectedMethod: event.method));
    });
  }
}
