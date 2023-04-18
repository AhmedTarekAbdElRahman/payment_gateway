import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:paymob/Core/utils/styles.dart';
import 'package:paymob/constant.dart';

class RefCodeView extends StatelessWidget {
  const RefCodeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'You should go to any market to pay',
              style: Styles.textStyle20,
            ),
            SizedBox(height: 20.h),
            const Text(
              'This is your ref code',
              style: Styles.textStyle18,
            ),
            SizedBox(height: 20.h),
            Card(
              shape: Border.all(color: kPrimaryColor, width: 1),
              elevation: 15,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  refCode,
                  style: Styles.textStyle30,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}