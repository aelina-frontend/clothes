import 'package:clothes/feature/presentation/screens/desktop_body/desktop_detail_screen.dart';
import 'package:flutter/material.dart';

import '../../../../core/app_colors.dart';
import '../../../../core/app_text_style.dart';
import '../../widgets/button_to_order.dart';

Widget productsWidget() {
  return SliverGrid(
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 4,
      mainAxisSpacing: 8,
      crossAxisSpacing: 8,
      childAspectRatio: 0.7,
    ),
    delegate: SliverChildBuilderDelegate(
      childCount: 8,
          (BuildContext context, int index) {
        return Card(
          child: GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => DesktopDetailScreen()));
            },
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 350,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                              'assets/image14.jpg',
                            ))),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                        children: [
                          const Text('Бирюзовый костюм двойка', style: AppTextStyle.s22w600,),
                          const SizedBox(height: 5,),
                          const Text('Стильный костюм двойка актуального кроя', style: AppTextStyle.s12w200, ),
                          const SizedBox(height: 5,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('${200}\$', style: AppTextStyle.s16w400,),
                              buttonToOrder(text: 'Заказать', width: 100, onTap: (){}, isColor: true),
                            ],
                          ),
                        ]),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    ),
  );
}