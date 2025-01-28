import 'package:clothes/core/app_colors.dart';
import 'package:clothes/core/app_text_style.dart';
import 'package:clothes/feature/presentation/screens/desktop_body/button_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widgets/button_to_order.dart';

import 'package:flutter/material.dart';

class DesktopDetailScreen extends StatefulWidget {
  const DesktopDetailScreen({super.key});

  @override
  State<DesktopDetailScreen> createState() => _DesktopDetailScreenState();
}

class _DesktopDetailScreenState extends State<DesktopDetailScreen> {
  final PageController _pageController = PageController(); // Контроллер для PageView
  final List<String> images = [
    'assets/image4.jpg',
    'assets/image5.jpg',
    'assets/image6.jpg',
    'assets/image3.jpg',
  ]; // Список изображений

  // Метод для выбора изображения
  void _selectedImage(int index) {
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  // Метод для перехода на следующую страницу
  void _nextPage() {
    _pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  // Метод для перехода на предыдущую страницу
  void _previousPage() {
    _pageController.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text('Больше товаров'),
      ),
      body: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                _buildPageView(),
                const SizedBox(height: 10),
                _buildSmallImages(),
              ],
            ),
          ),
          const Expanded(
            child: Column(
              children: [
                // Здесь можно добавить детали товара
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Виджет для отображения PageView
  Widget _buildPageView() {
    return SizedBox(
      height: 500,
      child: PageView.builder(
        controller: _pageController,
        itemCount: images.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(images[index]),
              ),
            ),
            child: Align(
              alignment: Alignment.center,
              child: _buildPageNavigationButtons(index),
            ),
          );
        },
      ),
    );
  }

  // Кнопки для перехода между страницами
  Widget _buildPageNavigationButtons(int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if (index > 0) // Отображаем кнопку назад, если это не первая страница
          _buildNavigationButton(
            icon: Icons.arrow_back_ios,
            onTap: _previousPage,
          ),
        if (index < images.length - 1) // Отображаем кнопку вперед, если это не последняя страница
          _buildNavigationButton(
            icon: Icons.arrow_forward_ios,
            onTap: _nextPage,
          ),
      ],
    );
  }

  // Шаблон кнопки для навигации
  Widget _buildNavigationButton({required IconData icon, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: CircleAvatar(
        radius: 15,
        backgroundColor: Colors.white,
        child: Icon(
          icon,
          size: 15,
          color: Colors.black,
        ),
      ),
    );
  }

  // Виджет для отображения миниатюр
  Widget _buildSmallImages() {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: images.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () => _selectedImage(index),
            child: Padding(
              padding: const EdgeInsets.only(right: 8),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  images[index],
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

// class DesktopDetailScreen extends StatelessWidget {
//   const DesktopDetailScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//             onPressed: () {
//               Navigator.pop(context);
//             },
//             icon: const Icon(Icons.arrow_back)),
//         title: const Text('Больше товаров'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.only(left: 40, top: 40),
//         child: Column(
//           children: [
//             Row(
//               children: [
//                 _detailImage(),
//                 _detailInfo(),
//               ],
//             ),
//             SizedBox(height: 15,),
//             _smallImages()
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _detailImage() {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       mainAxisAlignment: MainAxisAlignment.start,
//       children: [
//         SizedBox(
//           height: 450,
//           width: 500,
//           child: PageView.builder(
//               scrollDirection: Axis.horizontal,
//               itemBuilder: (context, index){
//                 return Container(
//                   height: 400,
//                   width: 400,
//                   decoration: BoxDecoration(
//                     image: const DecorationImage(
//                         fit: BoxFit.cover,
//                         image: AssetImage(
//                           'assets/image3.jpg',
//                         )),
//                   ),
//                   child: const Align(
//                       alignment: Alignment.centerRight,
//                       child: CircleAvatar(
//                           radius: 15,
//                           backgroundColor: AppColors.white,
//                           child: Icon(
//                             Icons.arrow_forward_ios,
//                             size: 15,
//                           ))),
//                 );
//               }),
//         ),
//       ],
//     );
//   }
//


//   Widget _detailInfo() {
//     return Padding(
//       padding: const EdgeInsets.only(left: 20),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'Бирюзовый костюм двойка',
//             style: AppTextStyle.s22w600,
//           ),
//           SizedBox(
//             height: 15,
//           ),
//           Text(
//             '${200}\$',
//             style: AppTextStyle.s16w400,
//           ),
//           SizedBox(
//             height: 15,
//           ),
//           buttonToOrder(
//               text: 'Добавить в корзину',
//               width: 180,
//               onTap: () {},
//               isColor: true),
//           SizedBox(
//             height: 15,
//           ),
//           const Text(
//             'Стильный костюм двойка актуального кроя',
//             style: AppTextStyle.s12w200,
//           ),
//           SizedBox(
//             height: 15,
//           ),
//           Text('Ткань: Прада')
//         ],
//       ),
//     );
//   }
// }
