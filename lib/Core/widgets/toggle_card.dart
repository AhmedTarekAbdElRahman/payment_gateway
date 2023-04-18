import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/styles.dart';

class ToggleCard extends StatelessWidget {
  const ToggleCard({
    Key? key,
    required this.image,
    required this.text,
    required this.navPath,
  }) : super(key: key);
  final String image;
  final String text;
  final String navPath;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        elevation: 15.0,
        clipBehavior: Clip.hardEdge,
        margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: InkWell(
          onTap: () {
            Navigator.of(context).pushReplacementNamed(navPath);
          },
          child: Column(
            children: [
              Image.asset(
                image,
                fit: BoxFit.cover,
                height: MediaQuery.of(context).size.height * 0.3,
                width: double.infinity,
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                text,
                style: Styles.textStyle20,
              ),
              SizedBox(
                height: 10.h,
              )
            ],
          ),
        ),
      ),
    );
  }
}
