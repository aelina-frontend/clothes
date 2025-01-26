import 'package:clothes/core/app_colors.dart';
import 'package:clothes/core/app_text_style.dart';
import 'package:clothes/feature/presentation/screens/desktop_body/button_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widgets/button_to_order.dart';

class DesktopDetailScreen extends StatelessWidget {
  const DesktopDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
        title: const Text('Больше товаров'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 40, top: 40),
        child: Column(
          children: [
            Row(
              children: [
                _detailImage(),
                _detailInfo(),
              ],
            ),
            SizedBox(height: 15,),
            _smallImages()
          ],
        ),
      ),
    );
  }

  Widget _detailImage() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: 450,
          width: 500,
          child: PageView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index){
                return Container(
                  height: 400,
                  width: 400,
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          'assets/image3.jpg',
                        )),
                  ),
                  child: const Align(
                      alignment: Alignment.centerRight,
                      child: CircleAvatar(
                          radius: 15,
                          backgroundColor: AppColors.white,
                          child: Icon(
                            Icons.arrow_forward_ios,
                            size: 15,
                          ))),
                );
              }),
        ),
      ],
    );
  }

  Widget _smallImages(){
    return
    Container(
      height: 80,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 4,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(right: 8),
                child: Image.asset(
                  'assets/image4.jpg',
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                ),
              );
            }),
    );
  }
  Widget _detailInfo() {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Бирюзовый костюм двойка',
            style: AppTextStyle.s22w600,
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            '${200}\$',
            style: AppTextStyle.s16w400,
          ),
          SizedBox(
            height: 15,
          ),
          buttonToOrder(
              text: 'Добавить в корзину',
              width: 180,
              onTap: () {},
              isColor: true),
          SizedBox(
            height: 15,
          ),
          const Text(
            'Стильный костюм двойка актуального кроя',
            style: AppTextStyle.s12w200,
          ),
          SizedBox(
            height: 15,
          ),
          Text('Ткань: Прада')
        ],
      ),
    );
  }
}
