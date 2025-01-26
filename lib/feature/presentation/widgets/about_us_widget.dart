import 'package:flutter/material.dart';

import 'button_to_order.dart';

class AboutUsWidget extends StatelessWidget {
  const AboutUsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 550,
      child: Padding(
        padding: const EdgeInsets.only(left: 25, right: 25, top: 25, bottom: 25),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Сотрудничество с нами, это:',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: GridView.count(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 2.5,
                children: [
                  _buildItem(
                    '1',
                    'Производительная мощность',
                    'Более 10 тыс единиц готовой продукции в неделю, в зависимости от сложности модели',
                  ),
                  _buildItem(
                    '2',
                    'Оперативная калькуляция',
                    'Отправьте нам фото и узнайте стоимость пошива вашего изделия за 15 минут',
                  ),
                  _buildItem(
                    '3',
                    'Эталонный образец',
                    'Разработаем лекала и отшьем образец от 2х до 5 дней',
                  ),
                  _buildItem(
                    '4',
                    'Условия сотрудничества',
                    '50% оплачивает заказчик для запуска производства и 50% оставшейся суммы оплачивается перед отправкой заказа.',
                  ),
                  _buildItem(
                    '5',
                    'Развивающееся производство',
                    'Наша фабрика имеет два филиала, а также к концу 2024 года откроется третий филиал фабрики AKULUX brand',
                  ),
                ],
              ),
            ),
            SizedBox(height: 10,),
            Center(
              child: buttonToOrder(text: 'Получить консультацию', width:  180, onTap: (){}, isColor: false),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildItem(String number, String title, String description) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        // boxShadow: [
        //   const BoxShadow(
        //     color: Colors.black12,
        //     blurRadius: 6,
        //     offset: Offset(0, 4),
        //   ),
        // ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            number,
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
