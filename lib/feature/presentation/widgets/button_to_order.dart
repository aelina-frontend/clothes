
import 'package:flutter/material.dart';

import '../../../core/app_colors.dart';

Widget buttonToOrder({required String text, required double width, required Function() onTap, required bool isColor}){
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: 50,
      width: width,
      decoration: BoxDecoration(
          color: isColor ? AppColors.white : AppColors.black,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: Colors.grey,
          )
      ),
      child: Center(
          child: Text(
            text,
            style: TextStyle(color: isColor ? AppColors.black : AppColors.white ),
          )),
    ),
  );
}