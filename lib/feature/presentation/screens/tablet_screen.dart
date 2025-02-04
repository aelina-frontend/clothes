import 'package:clothes/feature/presentation/screens/desktop_body/button_widget.dart';
import 'package:clothes/feature/presentation/screens/desktop_body/type_of_clothes_widget.dart';
import 'package:flutter/material.dart';
import '../../../core/app_colors.dart';
import '../../../core/app_text_style.dart';
import '../widgets/about_us_widget.dart';

class TabletScreen extends StatelessWidget {
  const TabletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
        _mainBanner(),
          _text(),
          const TypeOfClothes(),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: AboutUsWidget(),
          ),
          const SizedBox(
            height: 20,
          ),
          _productsGrid(),

        ],
      ),
    );
  }

  Widget _mainBanner(){
    return Stack(
      children: [
        Container(
          height: 500,
          width: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/image17.jpg'), fit: BoxFit.cover)),
        ),
        Positioned(
          left: 20,
          right: 20,
          top: 50,
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.lightYellow.withOpacity(0.9),
            ),
            child: Column(
              children: [
                const Text(
                  'Пошив дизайнерской одежды',
                  textAlign: TextAlign.center,
                  style: AppTextStyle.s22cBrown,
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                    'Полный цикл производства, от разработки лекала до оперативного пошива крупной партии, ее упаковки и отгрузки.', textAlign: TextAlign.center,),
                const SizedBox(
                  height: 10,
                ),

                buttonWidget(isColor: true, isTextColor: true, text: 'Связаться'),
              ],
            ),
          ),
        ),
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

  Widget _productsGrid() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Наши продукты',
            style: AppTextStyle.s22w600,
          ),
          const SizedBox(
            height: 15,
          ),
          GridView.builder(
            itemCount: 4,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 10,
              childAspectRatio: 0.7,
              crossAxisSpacing: 10,
            ),
            itemBuilder: (context, index) {
              return _productCard();
            },
          ),
        ],
      ),
    );
  }

  Widget _productCard() {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 5,
            ),
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(10),
                  ),
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/image1.jpeg',
                    ),
                    fit: BoxFit.cover,
                  )),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              'Платье с рукавами',
              style: AppTextStyle.s16w400,
            ),
          ),
        ],
      ),
    );
  }
}
