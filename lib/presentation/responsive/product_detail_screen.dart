import 'package:flutter/material.dart';
import '../../core/app_text_style.dart';
import '../../data/clothes.dart';

class ProductDetailScreen extends StatefulWidget {
  final Clothes clothes;
  final bool isDesktop;
  const ProductDetailScreen({super.key, required this.clothes, required this.isDesktop});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  final PageController _pageController =
      PageController(); // Контроллер для PageView

  // Метод для выбора изображения
  void _selectedImage(int index) {
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  // Метод для перехода на следующую страницу
  void _nextPage()
  {
    _pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  // Метод для перехода на предыдущую страницу
  void _previousPage()
  {
    _pageController.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context)
  {
    print(widget.isDesktop);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text('Больше товаров'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20),
        child:  widget.isDesktop ? Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  _buildPageView(widget.clothes, widget.isDesktop),
                  const SizedBox(height: 10),
                  _buildSmallImages(widget.clothes),
                ],
              ),
            ),
            const Expanded(
              child: Column(
                children: [
                  Text(
                    'Бирюзовый костюм двойка',
                    style: AppTextStyle.s22w600,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  const Text(
                    'Стильный костюм двойка актуального кроя',
                    style: AppTextStyle.s12w200,
                  ),
                ],
              ),
            ),
          ],
        ) : SizedBox(
          height: 300,
          width: double.infinity,
          child: PageView.builder(
            controller: _pageController,
            itemCount: widget.clothes.image.length,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(widget.clothes.images[index]),
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
      ),
    );
  }

  Widget _buildPageView(Clothes data, bool isDesktop) {
    return SizedBox(
      height: isDesktop ? 550 : 250,
      width: isDesktop ? 500 : 200,
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
    );
  }

  // Кнопки для перехода между страницами
  Widget _buildPageNavigationButtons(int index, Clothes data) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if (index > 0) // Отображаем кнопку назад, если это не первая страница
          _buildNavigationButton(
            icon: Icons.arrow_back_ios,
            onTap: _previousPage,
          ),
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
        padding: const EdgeInsets.only(left: 20),
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
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
