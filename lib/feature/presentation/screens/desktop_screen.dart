
import 'package:clothes/feature/presentation/screens/desktop_body/footer_section.dart';
import 'package:clothes/feature/presentation/screens/desktop_body/products_widget.dart';
import 'package:clothes/feature/presentation/widgets/about_us_widget.dart';
import 'package:clothes/feature/presentation/widgets/button_to_order.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/app_text_style.dart';
import 'desktop_body/main_pictute_widget.dart';
import 'desktop_body/type_of_clothes_widget.dart';

class DesktopScreen extends StatelessWidget {
  const DesktopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      scrollDirection: Axis.vertical,
      shrinkWrap: false,
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              mainPictureWidget(),
              _text(),
              TypeOfClothes(),
              const SizedBox(
                height: 15,
              ),
              AboutUsWidget(),
              const SizedBox(
                height: 15,
              ),
              _textInfo(),
            ],
          ),
        ),
        productsWidget(),
        _button(),
        FooterSection(),
      ],
    );
  }

  Widget _text() {
    return const Padding(
      padding: EdgeInsets.only(top: 30, bottom: 20),
      child: Column(
        children: [
          Text(
            'Швейное производство в Кыргызстане',
            style: AppTextStyle.s32w700,
          ),
          Text(
            'Каталог моделей',
            style: AppTextStyle.s20w400,
          )
        ],
      ),
    );
  }

  Widget _textInfo() {
    return const Row(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 20, top: 30, bottom: 30),
          child: Text(
            'Предлагаем ознакомиться с ассортиментом\nпродукции на которой мы специализируемся',
            style: AppTextStyle.s30w500,
          ),
        ),
      ],
    );
  }

  Widget _button(){
    return SliverToBoxAdapter(
      child:
      Padding(
        padding: const EdgeInsets.only(top: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            buttonToOrder(
                text: 'Show more', width: 180, onTap: () {}, isColor: true),
          ],
        ),
      ),
    );
  }
}
