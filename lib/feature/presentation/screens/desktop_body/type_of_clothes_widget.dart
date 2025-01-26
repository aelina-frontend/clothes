import 'package:flutter/material.dart';

Widget typeofClothesWidget() {
  return SizedBox(
    height: 420,
    child: ListView.builder(
        itemCount: 3,
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
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index){
                        return Container(
                          height: 400,
                          width: 400,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: const DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                  'assets/image3.jpg',
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