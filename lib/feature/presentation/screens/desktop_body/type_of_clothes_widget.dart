import 'dart:async';

import 'package:flutter/material.dart';

class TypeOfClothes extends StatefulWidget {
  const TypeOfClothes({super.key});

  @override
  State<TypeOfClothes> createState() => _TypeOfClothesState();
}

class _TypeOfClothesState extends State<TypeOfClothes> {

  double progress = 0.0;
  late Timer timer;

  void startProgress(){
    timer = Timer.periodic(Duration(milliseconds: 100),(_timer){
      if(progress >= 1.0){
        timer.cancel();
        Navigator.pop(context);
      }else{
        setState(() {
          progress += 0.05;
        });
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
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
}
