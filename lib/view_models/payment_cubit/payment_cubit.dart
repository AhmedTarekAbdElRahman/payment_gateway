import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paymob/repos/payment_repo/payment_repo.dart';
import 'package:paymob/view_models/payment_cubit/payment_state.dart';

class PaymentCubit extends Cubit<PaymentStates> {
  PaymentCubit(this.paymentRepo) : super(PaymentInitialState());
  final PaymentRepo paymentRepo;

  Future<void> payment({
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
    required String price,
  }) async {
    emit(PaymentLoadState());
    await paymentRepo.getFirstToken().then((value) {
      value.fold(
        (e) => emit(PaymentErrorState(e.errMessage)),
        (r) {
          getOrderId(
              firstName: firstName,
              lastName: lastName,
              email: email,
              phone: phone,
              price: price);
          emit(PaymentSuccessState());
        },
      );
    });
  }

  Future<void> getOrderId({
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
    required String price,
  }) async {
    await paymentRepo.getOrderId(price: price).then((value) {
      value.fold(
        (e) => emit(PaymentOrderIDErrorState(e.errMessage)),
        (r) {
          getFinalTokenCard(
            firstName: firstName,
            lastName: lastName,
            email: email,
            phone: phone,
            price: price,
          );
          getFinalTokenKiosk(
              firstName: firstName,
              lastName: lastName,
              email: email,
              phone: phone,
              price: price);
          emit(PaymentOrderIDSuccessState());
        },
      );
    });
  }

  Future<void> getFinalTokenCard({
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
    required String price,
  }) async {
    await paymentRepo
        .getFinalTokenCard(
            firstName: firstName,
            lastName: lastName,
            email: email,
            phone: phone,
            price: price)
        .then((value) {
      value.fold(
        (e) => emit(PaymentRequestTokenErrorState(e.errMessage)),
        (r) => emit(PaymentRequestTokenSuccessState()),
      );
    });
  }

  Future<void> getFinalTokenKiosk({
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
    required String price,
  }) async {
    await paymentRepo
        .getFinalTokenKiosk(
            firstName: firstName,
            lastName: lastName,
            email: email,
            phone: phone,
            price: price)
        .then((value) {
      value.fold(
        (e) => emit(PaymentRequestKioskErrorState(e.errMessage)),
        (r) {
          getRefCode();
          emit(PaymentRequestKioskSuccessState());
        },
      );
    });
  }

  Future<void> getRefCode() async {
    await paymentRepo.getRefCode().then((value) {
      value.fold(
        (e) => emit(PaymentRefCodeErrorState(e.errMessage)),
        (r) => emit(PaymentRefCodeSuccessState()),
      );
    });
  }
}
