
import 'package:clothes/data/social_media.dart';
import 'package:flutter/material.dart';

import '../../core/app_colors.dart';
import '../../core/app_constants/app_function.dart';
import '../../core/app_text_style.dart';

class FooterWidget extends StatelessWidget {
  final bool isDesktop;
  final bool isMobile;
  const FooterWidget({super.key, required this.isDesktop, required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.lightYellow,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Свяжитесь с нами',
            style: AppTextStyle.s22w600,
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: socialMedia
                  .map((icon) => Padding(
                padding: EdgeInsets.only(right: 10),
                child: InkWell(
                  onTap: (){
                    AppFunctions.openSocialMedia(icon.url);
                  },
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: AppColors.black,
                    child: Icon(icon.icon, color: AppColors.white,),
                  ),
                ),
              ))
                  .toList()),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Кыргызстан, Бишкек',
            style: TextStyle(color: Colors.black54, fontSize: 14),
          ),
          const Text(
            'Политика конфиденциальности',
            style: TextStyle(color: Colors.black54, fontSize: 14),
          ),
          const Text(
            '© Права защищены от копирования 2025',
            style: TextStyle(color: Colors.black54, fontSize: 14),
          ),
        ],
      ),
    );
  }
}
