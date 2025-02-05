import 'package:clothes/core/app_constants/app_string.dart';
import 'package:flutter/material.dart';

import '../../core/app_text_style.dart';

class AssortmentText extends StatelessWidget {
  final bool isDesktop;
  final bool isTablet;

  const AssortmentText(
      {super.key, required this.isDesktop, required this.isTablet});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 20, top: 30, bottom: 30),
          child: Text(
            AppString.assortment,
            style: isDesktop ? AppTextStyle.s30w500 : (isTablet ? AppTextStyle.s22w600 : AppTextStyle.s16w400),
          ),
        ),
      ],
    );
  }
}

