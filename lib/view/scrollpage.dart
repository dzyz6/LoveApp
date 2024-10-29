



import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Scrollpage extends StatelessWidget {
  const Scrollpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Container(
        width: double.infinity,
        height: 200.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20.r)),
          color: Colors.white,
        ),
      ),
    );
  }
}
