import 'package:clothes/feature/presentation/widgets/button_to_order.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../../../core/app_colors.dart';
import '../../../../core/app_text_style.dart';

List<IconData> icons = [
  Bootstrap.whatsapp,
  Bootstrap.instagram,
  Bootstrap.telegram,
  Icons.phone_outlined
];

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
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              _text(),
              const SizedBox(height: 10),
              _location(),
              SizedBox(
                height: 25,
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
      alignment: Alignment.center,
      child: const Text(
        'Давайте начнем работать вместе, сегодня!\nВы всегда можете связаться с нами',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _location() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
            children: icons
                .map((icon) => Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: InkWell(
                        onTap: () {},
                        child: CircleAvatar(
                          radius: 20,
                          backgroundColor: AppColors.black,
                          child: Icon(
                            icon,
                            color: AppColors.white,
                          ),
                        ),
                      ),
                    ))
                .toList()),
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
          '© Права защищены от копирования 2025',
          style: TextStyle(color: Colors.black54, fontSize: 14),
        ),
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
