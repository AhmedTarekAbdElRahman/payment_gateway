import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constant.dart';
import '../../view_models/payment_cubit/payment_cubit.dart';
import '../../view_models/payment_cubit/payment_state.dart';
import '../utils/app_routers.dart';
import '../utils/functions/custom_toast.dart';
import 'custom_button.dart';
import 'custom_loading_indicator.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({
    Key? key,
    required this.globalKey,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.price,
  }) : super(key: key);

  final GlobalKey<FormState> globalKey;
  final TextEditingController firstName;
  final TextEditingController lastName;
  final TextEditingController email;
  final TextEditingController phone;
  final TextEditingController price;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit, PaymentStates>(
      listener: (context, state) {
        if (state is PaymentErrorState) {
          showToast(text: state.errMessage, state: ToastStates.error);
        } else if (state is PaymentRequestTokenErrorState) {
          showToast(text: state.errMessage, state: ToastStates.error);
        } else if (state is PaymentRefCodeErrorState) {
          showToast(text: state.errMessage, state: ToastStates.error);
        } else if (state is PaymentRequestKioskErrorState) {
          showToast(text: state.errMessage, state: ToastStates.error);
        } else if (state is PaymentOrderIDErrorState) {
          showToast(text: state.errMessage, state: ToastStates.error);
        } else if (state is PaymentSuccessState) {
          Navigator.of(context).pushNamed(Routes.toggleView);
        }
      },
      builder: (context, state) {
        if(state is PaymentLoadState) {
          return const CustomLoadingIndicator();
        }else{
          return CustomButton(
            backgroundColor: kPrimaryColor,
            textColor: Colors.white,
            text: "Go To Pay",
            function: () {
              if (globalKey.currentState!.validate()) {
                BlocProvider.of<PaymentCubit>(context).payment(
                  firstName: firstName.text,
                  lastName: lastName.text,
                  email: email.text,
                  phone: phone.text,
                  price: price.text,
                );
              }
            },
          );
        }
      },
    );
  }
}
