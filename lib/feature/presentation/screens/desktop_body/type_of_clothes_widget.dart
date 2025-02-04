import 'dart:async';

import 'package:clothes/feature/data/clothes_data.dart';
import 'package:flutter/material.dart';

class TypeOfClothes extends StatefulWidget {
  const TypeOfClothes({super.key});

  @override
  State<TypeOfClothes> createState() => _TypeOfClothesState();
}

class _TypeOfClothesState extends State<TypeOfClothes> {


  List<PageController> _pageControllers = [];

  late Timer _timer;

  List<int> currentPages = [];
  @override
  void initState() {
    super.initState();

    // Инициализация PageController и начальных страниц
    for (int i = 0; i < catalog.length; i++) {
      _pageControllers.add(PageController(initialPage: 0));
      currentPages.add(0);
    }


    startProgress();
  }   void startProgress() {
    _timer = Timer.periodic(Duration(seconds: 4), (Timer timer) {
      for (int index = 0; index < catalog.length; index++) {
        if (currentPages[index] < catalog[index].images.length - 1) {
          currentPages[index]++;
        } else {
          currentPages[index] = 0;
        }

        _pageControllers[index].animateToPage(
          currentPages[index],
          duration: Duration(milliseconds: 500),
          curve: Curves.linear,
        );
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel(); // Останавливаем таймер
    for (var controller in _pageControllers) {
      controller.dispose();
    }
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    final isTablet = screenWidth >= 600 && screenWidth < 1200;

    int crossAxisCount = isMobile ? 1 : (isTablet ? 2 : 3);
    double childAspectRatio = isMobile ? 2.0 : (isTablet ? 2.8 : 2.5);
    double titleFontSize = isMobile ? 20 : (isTablet ? 22 : 24);
    double numberFontSize = isMobile ? 24 : (isTablet ? 28 : 32);
    double itemTitleFontSize = isMobile ? 16 : (isTablet ? 17 : 18);
    double descriptionFontSize = isMobile ? 12 : (isTablet ? 13 : 14);
    double buttonWidth = isMobile ? 180 : (isTablet ? 200 : 220);
    return SizedBox(
      height: isTablet ? 270 : 470,
      child: ListView.builder(
          itemCount: catalog.length,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Column(
                children: [
                  SizedBox(
                    height: isTablet ? 250: 450,
                    width: isTablet ? 250 : 450,
                    child: PageView.builder(
                        itemCount: catalog[index].images.length,
                        controller: _pageControllers[index],
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, pageIndex) {
                          return Container(
                            height: isTablet ? 250 : 450,
                            width: isTablet ? 250 : 450,
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
                  ),
                  // const Text('Костюмы'),
                ],
              ),
            );
          }),
    );
  }
}
