import 'package:clothes/core/app_constants/app_string.dart';
import 'package:flutter/material.dart';

import '../../core/app_text_style.dart';

class MainTitle extends StatelessWidget {
  final bool isDesktop;
  final bool isTablet;
  const MainTitle({super.key, required this.isDesktop, required this.isTablet});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 30, bottom: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            AppString.sewingTitle,
            textAlign: TextAlign.center,
            style: isDesktop ? AppTextStyle.s32w700 : AppTextStyle.s22w600,
          ),
          const Text(
            AppString.catalogTitle,
            textAlign: TextAlign.center,
            style: AppTextStyle.s20w400,
          )
        ],
      ),
    );
  }
}
