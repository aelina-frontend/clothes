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
  const MobileScreen({super.key, required this.isTablet, required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              MainBanner(isDesktop: false, isTablet: isTablet),
              MainTitle(isDesktop: false, isTablet: isTablet),
              TypeOfClothes(isDesktop: false, isTablet: isTablet),
              AboutUsWidget(isMobile: isMobile, isTablet: false),
              AssortmentText(isDesktop: false, isTablet: isTablet),
              ProductsGrid(crossAxisCount: 2, childAspectRatio: 0.8),
              FooterWidget(isDesktop: false, isMobile: isMobile),
            ],
          ),
        ),

      ],
    );
  }
}
