import 'package:clothes/core/utils.dart';
import 'package:flutter/material.dart';
import '../../core/app_text_style.dart';
import '../../data/clothes.dart';

class ProductDetailScreen extends StatefulWidget {
  final Clothes clothes;

  const ProductDetailScreen({super.key, required this.clothes});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  final PageController _pageController =
      PageController(initialPage: 0); // Контроллер для PageView

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
    final device = getDevice(MediaQuery.of(context).size.width);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text('Больше товаров'),
      ),
      body: device == DeviceSize.desktop || device == DeviceSize.tablet
          ? Row(
              crossAxisAlignment:
                  CrossAxisAlignment.start, // Выравниваем сверху
              children: [
                _buildPageView(widget.clothes, device),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // Выравниваем контент слева
                    children: [
                      _text(widget.clothes),
                      _buildSmallImages(widget.clothes),
                    ],
                  ),
                ),
              ],
            )
          : _mobileDetail(),
    );
  }

  Widget _buildPageView(Clothes data, DeviceSize device) {
    return SizedBox(
      height: device == DeviceSize.desktop ? 550 : 500,
      width: device == DeviceSize.desktop ? 500 : 450,
      child: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: PageView.builder(
          controller: _pageController,
          itemCount: data.images.length,
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(data.images[index]),
                ),
              ),
              child: Align(
                alignment: Alignment.center,
                child: _buildPageNavigationButtons(index, widget.clothes),
              ),
            );
          },
        ),
      ),
    );
  }

  // Кнопки для перехода между страницами
  Widget _buildPageNavigationButtons(int index, Clothes data) {
    return Row(
      children: [
        if (index > 0) // Отображаем кнопку назад, если это не первая страница
          _buildNavigationButton(
            icon: Icons.arrow_back_ios,
            onTap: _previousPage,
          ),
        const Spacer(),
        if (index <
            data.images.length -
                1) // Отображаем кнопку вперед, если это не последняя страница
          _buildNavigationButton(
            icon: Icons.arrow_forward_ios,
            onTap: _nextPage,
          ),
      ],
    );
  }

  // Шаблон кнопки для навигации
  Widget _buildNavigationButton(
      {required IconData icon, required VoidCallback onTap}) {
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
  Widget _buildSmallImages(Clothes data) {
    return SizedBox(
      height: 80,
      child: Padding(
        padding: const EdgeInsets.only(left: 20, top: 15),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: data.images.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () => _selectedImage(index),
              child: Padding(
                padding: const EdgeInsets.only(right: 8),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    data.images[index],
                    height: 80,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _mobileDetail() {
    return Column(
      children: [
        SizedBox(
          height: 470,
          child: PageView.builder(
            controller: _pageController,
            itemCount: widget.clothes.image.length,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      widget.clothes.images[index],
                    ),
                  ),
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: _buildPageNavigationButtons(index, widget.clothes),
                ),
              );
            },
          ),
        ),
        _buildSmallImages(widget.clothes),
        _text(widget.clothes),
      ],
    );
  }

  Widget _text(Clothes data) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            data.title,
            textAlign: TextAlign.start,
            style: AppTextStyle.s20w600,
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            data.description,
            style: AppTextStyle.s14w200,
          ),
        ],
      ),
    );
  }
}
