import 'package:clothes/presentation/widgets/about_us_widget.dart';
import 'package:clothes/presentation/widgets/assortment_text.dart';
import 'package:clothes/presentation/widgets/footer_widget.dart';
import 'package:clothes/presentation/widgets/main_banner.dart';
import 'package:clothes/presentation/widgets/product_card.dart';
import 'package:clothes/presentation/widgets/type_of_clothes.dart';
import 'package:flutter/material.dart';

import '../widgets/main_title.dart';

class MobileScreen extends StatelessWidget {
  final bool isTablet;
  final bool isMobile;
  final GlobalKey key1;
  final GlobalKey key2;
  final GlobalKey key3;
  final GlobalKey key4;
  final ScrollController controller;

  const MobileScreen(
      {super.key,
      required this.isTablet,
      required this.isMobile,
      required this.key1,
      required this.key2,
      required this.key3,
      required this.key4,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: controller,
      children: [
        MainBanner(
          isDesktop: false,
          isTablet: isTablet,
          key1: key1,
        ),
        MainTitle(isDesktop: false, isTablet: isTablet),
        TypeOfClothes(isDesktop: false, isTablet: isTablet),
        AboutUsWidget(
          isMobile: isMobile,
          isTablet: false,
          key2: key2,
        ),
        AssortmentText(isDesktop: false, isTablet: isTablet),
        ProductsGrid(crossAxisCount: 2, childAspectRatio: 0.8, key3: key3,),
        FooterWidget(isDesktop: false, isMobile: isMobile, key4: key4,),
      ],
    );
  }
}
