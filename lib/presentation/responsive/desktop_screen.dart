import 'package:clothes/presentation/widgets/about_us_widget.dart';
import 'package:clothes/presentation/widgets/assortment_text.dart';
import 'package:clothes/presentation/widgets/footer_widget.dart';
import 'package:clothes/presentation/widgets/type_of_clothes.dart';
import 'package:flutter/material.dart';
import '../widgets/main_banner.dart';
import '../widgets/main_title.dart';
import '../widgets/product_card.dart';

class DesktopScreen extends StatelessWidget {
  final bool isDesktop;
  const DesktopScreen({super.key, required this.isDesktop});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      shrinkWrap: false,

      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              MainBanner(isDesktop: isDesktop, isTablet: false),
              MainTitle(isDesktop: isDesktop, isTablet: false),
              TypeOfClothes(isDesktop: isDesktop, isTablet: false),
              AboutUsWidget(isMobile: false, isTablet: false),
              AssortmentText(isDesktop: isDesktop, isTablet: false),
              ProductsGrid(crossAxisCount: 4, childAspectRatio: 0.7),
              FooterWidget(isDesktop: isDesktop, isMobile: false),
            ],
          ),
        ),
      ],
    );
  }
}
