import 'package:clothes/feature/presentation/screens/desktop_body/button_widget.dart';
import 'package:flutter/material.dart';

import '../../../../core/app_colors.dart';
import '../../../../core/app_text_style.dart';

Widget mainPictureWidget() {
  return Stack(children: [
    Container(
        height: 500,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Image.asset(
          'assets/image17.jpg',
          fit: BoxFit.cover,
        )),
    Positioned(
      right: 30,
      top: 60,
      child: Container(
        height: 350,
        width: 550,
        decoration: BoxDecoration(
            color: AppColors.lightYellow,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: AppColors.white)),
        child: const Padding(
          padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('ПОШИВ ДИЗАЙНЕРСКОЙ ОДЕЖДЫ ЛЮБОЙ СЛОЖНОСТИ',
                  style: AppTextStyle.s30cBrown),
              SizedBox(
                height: 10,
              ),
              Text(
                  'Полный цикл производства, от разработки лекала до оперативного пошива крупной партии, ее упаковки и отгрузки.')
            ],
          ),
        ),
      ),
    ),
    Positioned(right: 400, bottom: 120, child: buttonWidget(text: 'Связаться',isColor: true, isTextColor: true)),
  ]);
}