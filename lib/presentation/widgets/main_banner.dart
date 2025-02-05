import 'package:clothes/core/app_constants/app_images.dart';
import 'package:clothes/core/app_constants/app_string.dart';
import 'package:flutter/material.dart';

import '../../core/app_colors.dart';
import '../../core/app_text_style.dart';
import '../../feature/presentation/screens/desktop_body/button_widget.dart';

class MainBanner extends StatelessWidget {
  final bool isDesktop;
  final bool isTablet;

  const MainBanner({
    Key? key,
    required this.isDesktop,
    required this.isTablet,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: isDesktop ? 500 : 300,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppImages.bannerImage),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          left: isDesktop ? null : 20,
          right: isDesktop ? 30 : 20,
          top: isDesktop ? 60 : 50,
          child: Container(
            padding: const EdgeInsets.all(20),
            width: isDesktop ? 550 : null,
            height: isDesktop ? 350 : null,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.lightYellow.withOpacity(0.9),
              border: isDesktop ? Border.all(color: AppColors.white) : null,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  AppString.bunnerTitle,
                  textAlign: TextAlign.center,
                  style: isDesktop ? AppTextStyle.s30cBrown : AppTextStyle.s22cBrown,
                ),
                const SizedBox(height: 5),
                const Text(
                  AppString.description,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                buttonWidget(isColor: true, isTextColor: true, text: AppString.contactMe),
              ],
            ),
          ),
        ),
      ],
    );
  }
}