import 'package:flutter/material.dart';

import '../../../../core/app_colors.dart';

Widget buttonWidget({required bool isColor, required bool isTextColor, required String text}) {
  return Container(
    height: 60,
    width: 120,
    decoration: BoxDecoration(
        color: isColor ? AppColors.brown : AppColors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.grey.shade300,
        )
    ),
    child: Center(
        child: Text(
          text,
          style: TextStyle(color: isTextColor ? AppColors.white : AppColors.black),
        )),
  );
}