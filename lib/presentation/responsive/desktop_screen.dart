import 'package:clothes/data/social_media.dart';
import 'package:clothes/presentation/widgets/about_us_widget.dart';
import 'package:clothes/presentation/widgets/assortment_text.dart';
import 'package:clothes/presentation/widgets/footer_widget.dart';
import 'package:clothes/presentation/widgets/type_of_clothes.dart';
import 'package:flutter/material.dart';
import '../widgets/main_banner.dart';
import '../widgets/main_title.dart';
import '../widgets/product_card.dart';

class DesktopScreen extends StatelessWidget
{
  final GlobalKey key1;
  final GlobalKey key2;
  final GlobalKey key3;
  final GlobalKey key4;

  const DesktopScreen(
      {super.key, required this.key1, required this.key2, required this.key3, required this.key4});

  @override
  Widget build(BuildContext context) {
    final String selectedUrl = socialMedia[0].url;
    return CustomScrollView(
      shrinkWrap: false,
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              MainBanner(key1: key1, url: selectedUrl),
              const MainTitle(),
              const TypeOfClothes(),
              AboutUsWidget(key2: key2,),
              const AssortmentText(),
              ProductsGrid(crossAxisCount: 4, childAspectRatio: 0.7, key3: key3,),
              FooterWidget(key4: key4,),
            ],
          ),
        ),
      ],
    );
  }
}
