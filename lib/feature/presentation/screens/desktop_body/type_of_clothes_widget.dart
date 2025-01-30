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
    return SizedBox(
      height: 420,
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
                    height: 400,
                    width: 400,
                    child: PageView.builder(
                        itemCount: catalog[index].images.length,
                        controller: _pageControllers[index],
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, pageIndex) {
                          return Container(
                            height: 400,
                            width: 400,
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
                  const Text('Костюмы'),
                ],
              ),
            );
          }),
    );
  }
}
