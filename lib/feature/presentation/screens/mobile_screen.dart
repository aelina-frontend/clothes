
import 'package:clothes/feature/presentation/widgets/about_us_widget.dart';
import 'package:clothes/feature/presentation/widgets/button_to_order.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:icons_plus/icons_plus.dart';
import '../../../core/app_colors.dart';
import '../../../core/app_text_style.dart';
import '../../data/clothes_data.dart';
import 'desktop_body/button_widget.dart';
import 'desktop_body/type_of_clothes_widget.dart';

List<IconData> icons = [
  Bootstrap.whatsapp,
  Bootstrap.instagram,
  Bootstrap.telegram,
  Icons.phone_outlined
];

List<PageController> _pageControllers = [];

class MobileScreen extends StatelessWidget {
  const MobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _mainBanner(),
          _title(text: 'Швейное производство в Кыргызстане'),
          // _pageViewBuilder(1),
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: AboutUsWidget(),
          ),
          const SizedBox(
            height: 20,
          ),
          _productsGrid(),
          const SizedBox(
            height: 20,
          ),
          _contactForm(),
        ],
      ),
    );
  }

  Widget _title({required String text}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: AppTextStyle.s22w600,
      ),
    );
  }

  Widget _mainBanner() {
    return Stack(
      children: [
        Container(
          height: 300,
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
                  height: 10,
                ),
                buttonWidget(
                    isColor: true, isTextColor: true, text: 'Связаться'),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _pageViewBuilder(int index){
    return SizedBox(
      height: 200,
      child: PageView.builder(
          itemCount: 3,
          controller: _pageControllers[index],
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, pageIndex) {
            return Container(
              height: 250,
              width: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      catalog[index].images[pageIndex],
                    )),
              ),
            );
          }),
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
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              childAspectRatio: 0.7,
              crossAxisSpacing: 10,
            ),
            itemBuilder: (context, index) {
              return _productCard();
            },
          )
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

  Widget _contactForm() {
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
              children: icons
                  .map((icon) => Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: InkWell(
                          onTap: (){},
                          child: CircleAvatar(
                            radius: 20,
                            backgroundColor: AppColors.black,
                            child: Icon(icon, color: AppColors.white,),
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
