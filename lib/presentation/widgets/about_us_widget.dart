import 'package:clothes/core/app_constants/app_string.dart';
import 'package:clothes/core/utils.dart';
import 'package:flutter/material.dart';

class AboutUsWidget extends StatelessWidget
{
  final GlobalKey key2;
  const AboutUsWidget({
    super.key,
    required this.key2,
  });

  @override
  Widget build(BuildContext context)
  {
    final device = getDevice(MediaQuery.of(context).size.width);
    int crossAxisCount = device == DeviceSize.mobile ? 1 : (device == DeviceSize.tablet ? 2 : 3);
    double childAspectRatio = device == DeviceSize.mobile ? 2.5 : (device == DeviceSize.tablet ? 2.8 : 2.5);
    double titleFontSize = device == DeviceSize.mobile ? 20 : (device == DeviceSize.tablet ? 22 : 24);
    double numberFontSize = device == DeviceSize.mobile ? 24 : (device == DeviceSize.tablet ? 28 : 32);
    double itemTitleFontSize = device == DeviceSize.mobile ? 16 : (device == DeviceSize.tablet ? 17 : 18);
    double descriptionFontSize = device == DeviceSize.mobile ? 12 : (device == DeviceSize.tablet ? 13 : 14);
    double buttonWidth = device == DeviceSize.mobile ? 180 : (device == DeviceSize.tablet ? 200 : 220);

    return Container(
      key: key2,
      padding: EdgeInsets.symmetric(
        horizontal: device == DeviceSize.mobile ? 15 : 25,
        vertical: device == DeviceSize.mobile ? 15 : 25,
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
          SizedBox(height: device == DeviceSize.mobile ? 12 : 16),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: childAspectRatio,
            children: _buildItems(
                numberFontSize, itemTitleFontSize, descriptionFontSize),
          ),
          SizedBox(height: 10),
          // Center(
          //   child: buttonToOrder(
          //     text: AppString.getConsultation,
          //     width: buttonWidth,
          //     onTap: () {},
          //     isColor: false,
          //   ),
          // ),
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
      [
        '1',
        'Производительная мощность',
        'Более 10 тыс единиц готовой продукции в неделю, в зависимости от сложности модели'
      ],
      [
        '2',
        'Оперативная калькуляция',
        'Отправьте нам фото и узнайте стоимость пошива вашего изделия за 15 минут'
      ],
      [
        '3',
        'Эталонный образец',
        'Разработаем лекала и отшьем образец от 2х до 5 дней'
      ],
      [
        '4',
        'Условия сотрудничества',
        '50% предоплата для запуска производства и 50% оставшейся перед отправкой заказа.'
      ],
    ];

    return items
        .map((item) => _buildItem(item[0], item[1], item[2], numberFontSize,
            titleFontSize, descriptionFontSize))
        .toList();
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
