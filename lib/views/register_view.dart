import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:paymob/Core/widgets/custom_form_field.dart';

import '../Core/widgets/register_button.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController firstName = TextEditingController();
    TextEditingController lastName = TextEditingController();
    TextEditingController phone = TextEditingController();
    TextEditingController email = TextEditingController();
    TextEditingController price = TextEditingController();
    var globalKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Register',
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: globalKey,
          child: Column(
            children: [
              SizedBox(
                height: 30.h,
              ),
              CustomFormFiled(
                controller: firstName,
                type: TextInputType.name,
                validate: (value) {
                  if (value!.isEmpty) {
                    return 'Please,enter your first name';
                  }
                  return null;
                },
                label: 'First Name',
                prefix: Icons.person,
              ),
              SizedBox(
                height: 10.h,
              ),
              CustomFormFiled(
                controller: lastName,
                type: TextInputType.name,
                validate: (value) {
                  if (value!.isEmpty) {
                    return 'Please,enter your last name';
                  }
                  return null;
                },
                label: 'Last Name',
                prefix: Icons.person,
              ),
              SizedBox(
                height: 10.h,
              ),
              CustomFormFiled(
                controller: email,
                type: TextInputType.emailAddress,
                validate: (value) {
                  if (value!.isEmpty) {
                    return 'Please,enter your email';
                  }
                  return null;
                },
                label: 'email',
                prefix: Icons.email,
              ),
              SizedBox(
                height: 10.h,
              ),
              CustomFormFiled(
                controller: phone,
                type: TextInputType.phone,
                validate: (value) {
                  if (value!.isEmpty) {
                    return 'Please,enter your phone';
                  }
                  return null;
                },
                label: 'Phone',
                prefix: Icons.phone,
              ),
              SizedBox(
                height: 10.h,
              ),
              CustomFormFiled(
                controller: price,
                type: TextInputType.number,
                validate: (value) {
                  if (value!.isEmpty) {
                    return 'Please,enter your price';
                  }
                  return null;
                },
                label: 'Price',
                prefix: Icons.price_change,
              ),
              SizedBox(
                height: 30.h,
              ),
              RegisterButton(globalKey: globalKey, firstName: firstName, lastName: lastName, email: email, phone: phone, price: price),
              SizedBox(
                height: 10.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

