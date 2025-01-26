import 'package:clothes/clothes_app/core/app_colors.dart';
import 'package:clothes/clothes_app/core/app_text_style.dart';
import 'package:flutter/material.dart';

class FirstInfo extends StatefulWidget {
  const FirstInfo({super.key});

  @override
  State<FirstInfo> createState() => _FirstInfoState();
}

class _FirstInfoState extends State<FirstInfo> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _title(text: 'ОПТОВЫЙ ПОШИВ ЖЕНСКОЙ ОДЕЖДЫ'),
        // _title(text: ''),
        // _title(text: '', color: AppColors.yellow),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _title(text: '', color: AppColors.yellow),
            _text()
          ],
        ),
        _containers(),
        _button(isColor: true),
        _button(isColor: false),
      ],
    );
  }

  Widget _title({required String text, Color? color}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            text,
            style: AppTextStyle.s40w500,
          ),
        ),
      ],
    );
  }

  Widget _text(){
    return Column(
      children: [
        Text('под вашим брендом', style: AppTextStyle.s18w500,), Text('брендом', style: AppTextStyle.s18w500,)],
    );
  }

  Widget _containers() {
    return SizedBox(
      height: 500,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            right: 10,
            top: 20,
            child: Container(
              height: 500,
              width: 250,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
          Positioned(
            left: 10,
            top: 120,
            child: Container(
              height: 270,
              width: 270,
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
          Positioned(
            bottom: 150,
            child: _experience(),
          ),
        ],
      ),
    );
  }

  Widget _experience() {
    return Container(
      height: 80,
      width: 300,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(Icons.local_fire_department_sharp, color: Colors.red, size: 40,),
          Text('Мы на рынке 5 лет', style: AppTextStyle.s18w500,),
        ],
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
