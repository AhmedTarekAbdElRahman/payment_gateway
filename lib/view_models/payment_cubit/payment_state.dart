abstract class PaymentStates {}

class PaymentInitialState extends PaymentStates {}

class PaymentLoadState extends PaymentStates {}


class PaymentSuccessState extends PaymentStates {}

class PaymentErrorState extends PaymentStates {
  final String errMessage;

  PaymentErrorState(this.errMessage);
}

class PaymentOrderIDSuccessState extends PaymentStates {}

class PaymentOrderIDErrorState extends PaymentStates {
  final String errMessage;

  PaymentOrderIDErrorState(this.errMessage);
}

class PaymentRequestTokenSuccessState extends PaymentStates {}

class PaymentRequestTokenErrorState extends PaymentStates {
  final String errMessage;

  PaymentRequestTokenErrorState(this.errMessage);
}

class PaymentRequestKioskSuccessState extends PaymentStates {}

class PaymentRequestKioskErrorState extends PaymentStates {
  final String errMessage;

  PaymentRequestKioskErrorState(this.errMessage);
}

class PaymentRefCodeSuccessState extends PaymentStates {}

class PaymentRefCodeErrorState extends PaymentStates {
  final String errMessage;

  PaymentRefCodeErrorState(this.errMessage);
}