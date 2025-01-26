import 'package:clothes/clothes_app/core/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../core/app_text_style.dart';

class MobileScreen extends StatelessWidget {
  const MobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _container(),
        _title(text: 'Швейное производство в Кыргызстане'),
        _button(isColor: true),
        _button(isColor: true),
      ],
    );
  }
  Widget _title({required String text, Color? color}) {
    return Center(
      child: Text(
        text,
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _text(){
    return Column(
      children: [
        Text('под вашим брендом', style: AppTextStyle.s18w500,), Text('брендом', style: AppTextStyle.s18w500,)],
    );
  }

  Widget _container(){
    return Container(
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.yellow,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }

  Widget _button({required bool isColor, Color? borderColor}) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 10),
      child: Container(
        height: 70,
        width: 200,
        decoration: BoxDecoration(
            color: isColor ? AppColors.green : AppColors.white,
            borderRadius: BorderRadius.circular(40),
            border: Border.all(
                color: AppColors.green
            )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('связаться', style: TextStyle(
              color: isColor ? AppColors.white : AppColors.green, fontSize: 18,)),
            SizedBox(width: 10,),
            Icon(Icons.arrow_circle_right, size: 40,
              color: isColor ? AppColors.yellow : AppColors.green,),
          ],
        ),
      ),
    );
  }
}