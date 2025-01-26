import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class FooterSection extends StatefulWidget {
  const FooterSection({super.key});

  @override
  State<FooterSection> createState() => _FooterSectionState();
}

class _FooterSectionState extends State<FooterSection> {

  List<IconData> icons = [Bootstrap.whatsapp, Bootstrap.instagram, Bootstrap.telegram, Icons.phone_outlined];

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 400,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Spacer(),
            const Text(
              'Давайте начнем работать вместе, сегодня!\nВы всегда можете связаться с нами',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // _buildSocialIcon(Icons.whatsapp),
                // SizedBox(width: 16),
                _buildSocialIcon(Icons.telegram),
                const SizedBox(width: 16),
                _buildSocialIcon(Icons.photo_camera), // Замените на иконку Instagram
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
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Карта сайта',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text('ГЛАВНАЯ', style: TextStyle(color: Colors.black54)),
                    Text('О НАС', style: TextStyle(color: Colors.black54)),
                    Text('КАТАЛОГ', style: TextStyle(color: Colors.black54)),
                    Text('КОНТАКТЫ', style: TextStyle(color: Colors.black54)),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildTextField('Ваше имя'),
                    const SizedBox(height: 8),
                    _buildTextField('Номер телефона'),
                    const SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: () {
                        // Действие при нажатии
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                        padding:
                        const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      ),
                      child: const Text(
                        'Оставить заявку',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 32),
            const Divider(color: Colors.black26),
            const Text(
              'Сайт создан: Anastasia',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black54, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialIcon(IconData icon) {
    return IconButton(
      onPressed: () {
        // Действие при нажатии
      },
      icon: Icon(icon, color: Colors.black),
      iconSize: 32,
    );
  }

  Widget _buildTextField(String hintText) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black26),
        borderRadius: BorderRadius.circular(16),
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: hintText,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          border: InputBorder.none,
        ),
      ),
    );
  }
}