import 'package:clothes/core/app_constants/app_string.dart';
import 'package:clothes/feature/presentation/widgets/button_to_order.dart';
import 'package:flutter/material.dart';

class AboutUsWidget extends StatelessWidget {
  final bool isMobile;
  final bool isTablet;

  const AboutUsWidget({
    super.key,
    required this.isMobile,
    required this.isTablet,
  });

  @override
  Widget build(BuildContext context) {
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppString.cooperation,
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
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: childAspectRatio,
            children: _buildItems(numberFontSize, itemTitleFontSize, descriptionFontSize),
          ),
          SizedBox(height: 10),
          Center(
            child: buttonToOrder(
              text: AppString.getConsultation,
              width: buttonWidth,
              onTap: () {},
              isColor: false,
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildItems(
      double numberFontSize,
      double titleFontSize,
      double descriptionFontSize,
      ) {
    final items = [
      ['1', 'Производительная мощность', 'Более 10 тыс единиц готовой продукции в неделю, в зависимости от сложности модели'],
      ['2', 'Оперативная калькуляция', 'Отправьте нам фото и узнайте стоимость пошива вашего изделия за 15 минут'],
      ['3', 'Эталонный образец', 'Разработаем лекала и отшьем образец от 2х до 5 дней'],
      ['4', 'Условия сотрудничества', '50% предоплата для запуска производства и 50% оставшейся перед отправкой заказа.'],
    ];

    return items.map((item) => _buildItem(item[0], item[1], item[2], numberFontSize, titleFontSize, descriptionFontSize)).toList();
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
        children: [
          Text(
            number,
            style: TextStyle(
              fontSize: numberFontSize,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: titleFontSize,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: descriptionFontSize,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
