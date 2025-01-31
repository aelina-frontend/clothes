import 'package:flutter/material.dart';

import 'button_to_order.dart';

class AboutUsWidget extends StatelessWidget {
  const AboutUsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Получаем размер экрана
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    final isTablet = screenWidth >= 600 && screenWidth < 1200;

    // Настраиваем параметры сетки в зависимости от размера экрана
    int crossAxisCount = isMobile ? 1 : (isTablet ? 2 : 3);
    double childAspectRatio = isMobile ? 2.5 : (isTablet ? 2.8 : 2.5);
    double titleFontSize = isMobile ? 20 : (isTablet ? 22 : 24);
    double numberFontSize = isMobile ? 24 : (isTablet ? 28 : 32);
    double itemTitleFontSize = isMobile ? 16 : (isTablet ? 17 : 18);
    double descriptionFontSize = isMobile ? 12 : (isTablet ? 13 : 14);
    double buttonWidth = isMobile ? 180 : (isTablet ? 200 : 220);

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 15 : 25,
        vertical: isMobile ? 15 : 25,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Сотрудничество с нами, это:',
            style: TextStyle(
              fontSize: titleFontSize,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: isMobile ? 12 : 16),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: isMobile ? 8 : 10,
            mainAxisSpacing: isMobile ? 8 : 10,
            childAspectRatio: childAspectRatio,
            children: [
              _buildItem(
                '1',
                'Производительная мощность',
                'Более 10 тыс единиц готовой\nпродукции в неделю, в\nзависимости от сложности модели',
                numberFontSize,
                itemTitleFontSize,
                descriptionFontSize,
              ),
              _buildItem(
                '2',
                'Оперативная калькуляция',
                'Отправьте нам фото и узнайте\nстоимость пошива вашего\nизделия за 15 минут',
                numberFontSize,
                itemTitleFontSize,
                descriptionFontSize,
              ),
              _buildItem(
                '3',
                'Эталонный образец',
                'Разработаем лекала и отшьем\nобразец от 2х до 5 дней',
                numberFontSize,
                itemTitleFontSize,
                descriptionFontSize,
              ),
              _buildItem(
                '4',
                'Условия сотрудничества',
                '50% предоплата для запуска производства\nи 50% оставшейся перед отправкой заказа.',
                numberFontSize,
                itemTitleFontSize,
                descriptionFontSize,
              ),
            ],
          ),
          SizedBox(height: isMobile ? 8 : 10),
          Center(
            child: buttonToOrder(
              text: 'Получить консультацию',
              width: buttonWidth,
              onTap: () {},
              isColor: false,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildItem(
    String number,
    String title,
    String description,
    double numberFontSize,
    double titleFontSize,
    double descriptionFontSize,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            number,
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: titleFontSize,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.start,
              ),
              const SizedBox(height: 8),
              Text(
                description,
                style: TextStyle(
                  fontSize: descriptionFontSize,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.start,
              )
            ],
          ),
        ],
      ),
    );
  }
}
