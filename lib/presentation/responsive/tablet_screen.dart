import 'package:clothes/presentation/widgets/about_us_widget.dart';
import 'package:clothes/presentation/widgets/assortment_text.dart';
import 'package:clothes/presentation/widgets/footer_widget.dart';
import 'package:clothes/presentation/widgets/main_title.dart';
import 'package:clothes/presentation/widgets/type_of_clothes.dart';
import 'package:flutter/material.dart';
import '../widgets/main_banner.dart';
import '../widgets/product_card.dart';

class TabletScreen extends StatelessWidget {
  final bool isTablet;
  const TabletScreen({super.key, required this.isTablet});

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
              AboutUsWidget(isMobile: false, isTablet: isTablet),
              AssortmentText(isDesktop: false, isTablet: isTablet),
              const ProductsGrid(crossAxisCount: 2, childAspectRatio: 0.8),
              const FooterWidget(isDesktop: false, isMobile: false),
            ],
          ),
        ),

      ],
    );
  }
}
