import 'package:clothes/core/app_constants/app_images.dart';
import 'package:clothes/core/app_constants/app_string.dart';
import 'package:clothes/core/utils.dart';
import 'package:flutter/material.dart';

import '../../core/app_colors.dart';
import '../../core/app_text_style.dart';
import 'button_widget.dart';

class MainBanner extends StatelessWidget {
  final GlobalKey key1;
  const MainBanner({
    super.key,
  required this.key1,
  });

  @override
  Widget build(BuildContext context)
  {
    final device = getDevice(MediaQuery.of(context).size.width);
    return Stack(
      key: key1,
      children: [
        Container(
          height: device == DeviceSize.desktop ? 500 : 300,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppImages.bannerImage),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          left: device == DeviceSize.desktop ? null : 20,
          right: device == DeviceSize.desktop ? 30 : 20,
          top: device == DeviceSize.desktop ? 60 : 50,
          child: Container(
            padding: const EdgeInsets.all(20),
            width: device == DeviceSize.desktop ? 550 : null,
            height: device == DeviceSize.desktop ? 350 : null,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.lightYellow.withOpacity(0.9),
              border: device == DeviceSize.desktop ? Border.all(color: AppColors.white) : null,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  AppString.bunnerTitle,
                  textAlign: TextAlign.center,
                  style: device == DeviceSize.desktop ? AppTextStyle.s30cBrown : AppTextStyle.s22cBrown,
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