
import 'package:clothes/feature/presentation/widgets/button_to_order.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../../../core/app_colors.dart';
import '../../../../core/app_text_style.dart';

List<IconData> icons = [Bootstrap.whatsapp, Bootstrap.instagram, Bootstrap.telegram, Icons.phone_outlined];

class FooterSection extends StatefulWidget {
  const FooterSection({super.key});

  @override
  State<FooterSection> createState() => _FooterSectionState();
}

class _FooterSectionState extends State<FooterSection> {
  List<IconData> icons = [
    Bootstrap.whatsapp,
    Bootstrap.instagram,
    Bootstrap.telegram,
    Icons.phone_outlined
  ];

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(
          top: 60,
          left: 20,
          right: 20,
        ),
        child: SizedBox(
          height: 380,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              _text(),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _location(),
                  _mapMenu(),
                  Column(
                    children: [
                      _textField('Ваше имя'),
                      _textField("Номер телефона"),
                      buttonToOrder(text: 'Оставить заявку', width: 220, onTap: (){}, isColor: false),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              _developer(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _text() {
    return Align(
      alignment: Alignment.topLeft,
      child: const Text(
        'Давайте начнем работать вместе, сегодня!\nВы всегда можете связаться с нами',
        textAlign: TextAlign.start,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _location() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            // _buildSocialIcon(Icons.whatsapp),
            // SizedBox(width: 16),
            _buildSocialIcon(Icons.telegram),
            const SizedBox(width: 16),
            _buildSocialIcon(Icons.photo_camera),
            // Замените на иконку Instagram
            const SizedBox(width: 16),
            _buildSocialIcon(Icons.phone),
          ],
        ),
        const SizedBox(height: 16),
        const Text(
          'Кыргызстан, Бишкек',
          style: TextStyle(color: Colors.black54, fontSize: 14),
        ),
        const Text(
          'Политика конфиденциальности',
          style: TextStyle(color: Colors.black54, fontSize: 14),
        ),
        const Text(
          '© Права защищены от копирования 2024',
          style: TextStyle(color: Colors.black54, fontSize: 14),
        ),
      ],
    );
  }

  Widget _mapMenu() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'КАРТА САЙТА',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5,),
        Text('ГЛАВНАЯ', style: AppTextStyle.s18w500),
        Text('О НАС', style: AppTextStyle.s18w500),
        Text('КАТАЛОГ', style: AppTextStyle.s18w500),
        Text('КОНТАКТЫ', style: AppTextStyle.s18w500),
      ],
    );
  }

  Widget _buildSocialIcon(IconData icon) {
    return CircleAvatar(
      radius: 17,
      backgroundColor: Colors.black,
      child: Icon(
        icon,
        color: AppColors.white,
        size: 15,
      ),
    );
    // IconButton(
    //   onPressed: () {
    //     // Действие при нажатии
    //   },
    //   icon: Icon(icon, color: Colors.black),
    //   iconSize: 32,
    // );
  }

  Widget _textField(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(text),
          Container(
            height: 50,
            width: 220,
            decoration: BoxDecoration(
              color: AppColors.white,
              border: Border.all(color: AppColors.black),
              borderRadius: BorderRadius.circular(25),
            ),
            child: TextField(
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _developer() {
    return Container(
      height: 60,
      width: double.infinity,
      color: AppColors.black,
      child: Center(
        child: const Text(
          'Сайт создан: Aelina',
          style: TextStyle(color: AppColors.white, fontSize: 14),
        ),
      ),
    );
  }
}
