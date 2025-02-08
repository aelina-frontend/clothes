import 'dart:async';

import 'package:flutter/material.dart';

import '../../data/clothes.dart';

class TypeOfClothes extends StatefulWidget {
  final bool isDesktop;
  final bool isTablet;

  const TypeOfClothes({super.key, required this.isDesktop, required this.isTablet});

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
    for (int i = 0; i < catalog.length; i++) {
      _pageControllers.add(PageController(initialPage: 0));
      currentPages.add(0);
    }
    startProgress();
  }

  void startProgress() {
    _timer = Timer.periodic(const Duration(seconds: 4), (Timer timer) {
      for (int index = 0; index < catalog.length; index++) {
        if (currentPages[index] < catalog[index].images.length - 1) {
          currentPages[index]++;
        } else {
          currentPages[index] = 0;
        }

        _pageControllers[index].animateToPage(
          currentPages[index],
          duration: const Duration(milliseconds: 500),
          curve: Curves.linear,
        );
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    for (var controller in _pageControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double imageSize = widget.isDesktop ? 400 : (widget.isTablet ? 250 : 200);

    return SizedBox(
      height: widget.isTablet ? 270 : (widget.isDesktop ? 470 : 450),
      child: widget.isDesktop || widget.isTablet ? ListView.builder(
        itemCount: catalog.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return _clothes(imageSize: imageSize, index: index, isMobile: false);
        },
      ) : Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _clothes(imageSize: imageSize, index: 0, isMobile: true),
              _clothes(imageSize: imageSize, index: 1, isMobile: true),
            ],
          ),
          SizedBox(height: 10,),
          _clothes(imageSize: imageSize, index: 2, isMobile: true),

        ],
      )
    );
  }

  Widget _clothes({required double imageSize, required int index, required bool isMobile}){
    return Padding(
      padding: EdgeInsets.only(right: isMobile ? 0 : 15),
      child: SizedBox(
        height: imageSize,
        width: isMobile ? imageSize-10 : imageSize,
        child: PageView.builder(
          itemCount: catalog[index].images.length,
          controller: _pageControllers[index],
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, pageIndex) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(catalog[index].images[pageIndex]),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

}
