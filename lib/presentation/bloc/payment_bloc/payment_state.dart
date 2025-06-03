part of 'payment_bloc.dart';

class PaymentState extends Equatable {
  final PaymentMethod? selectedMethod;

  const PaymentState({this.selectedMethod});

  PaymentState copyWith({PaymentMethod? selectedMethod}) {
    return PaymentState(selectedMethod: selectedMethod ?? this.selectedMethod);
  }

  @override
  List<Object?> get props => [selectedMethod];
}

enum PaymentMethod { cash, card }
