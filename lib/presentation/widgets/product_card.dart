import 'package:clothes/presentation/cubit/clothes_cubit.dart';
import 'package:clothes/presentation/responsive/product_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/clothes.dart';

class ProductsGrid extends StatelessWidget
{
  final int crossAxisCount;
  final double childAspectRatio;
  final GlobalKey key3;
  const ProductsGrid({
    super.key,
    required this.crossAxisCount,
    required this.childAspectRatio, required this.key3,
  });

  @override
  Widget build(BuildContext context)
  {
    return Padding(
      key: key3,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Наши продукты',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 15),
          BlocBuilder<ClothesCubit, ClothesState>(
            builder: (context, state) {
              if(state is ClothesLoading){
                return const Center(
                  child: Text('данные загружаются'),
                );
              }else if(state is ClothesError){
                return Center(
                  child: Text('${state.error}'),
                );
              }else if(state is ClothesSuccess){
                return GridView.builder(
                  itemCount: state.clothes.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: childAspectRatio,
                  ),
                  itemBuilder: (context, index) {
                    return _productCard(context, state.clothes[index]);
                  },
                );
              }else{
                return const SizedBox();
              }

            },
          ),
        ],
      ),
    );
  }

  Widget _productCard(BuildContext context, Clothes data) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => ProductDetailScreen(clothes: data, isDesktop: true,)));
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 5,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                  image: DecorationImage(
                    image: NetworkImage(data.image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.title,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


// class ProductCard extends StatelessWidget {
//   final bool isDesktop;
//   final bool isTablet;
//   const ProductCard({super.key, required this.isDesktop, required this.isTablet});
//
//   @override
//   Widget build(BuildContext context) {
//
//     // int crossAxisCount = isMobile ? 1 : (isTablet ? 2 : 3);
//     // double childAspectRatio = isMobile ? 2.0 : (isTablet ? 2.8 : 2.5);
//     // double titleFontSize = isMobile ? 20 : (isTablet ? 22 : 24);
//     // double numberFontSize = isMobile ? 24 : (isTablet ? 28 : 32);
//     // double itemTitleFontSize = isMobile ? 16 : (isTablet ? 17 : 18);
//     // double descriptionFontSize = isMobile ? 12 : (isTablet ? 13 : 14);
//     // double buttonWidth = isMobile ? 180 : (isTablet ? 200 : 220);
//
//     return SliverGrid(
//       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: isDesktop ? 4 : 2,
//         mainAxisSpacing: isDesktop ? 8 : 10,
//         crossAxisSpacing: isDesktop ? 8 : 10,
//         childAspectRatio: isDesktop ? 0.7 : 0.8,
//       ),
//       delegate: SliverChildBuilderDelegate(
//         childCount: 8,
//         (BuildContext context, int index) {
//           return Card(
//             child: GestureDetector(
//               onTap: () {},
//               child: Container(
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                   color: AppColors.white,
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Container(
//                       height: 350,
//                       decoration: const BoxDecoration(
//                           image: DecorationImage(
//                               fit: BoxFit.cover,
//                               image: AssetImage(
//                                 'assets/image1.jpeg',
//                               ))),
//                     ),
//                     const Padding(
//                       padding: EdgeInsets.symmetric(horizontal: 10),
//                       child: Column(children: [
//                         Text(
//                           'Платье с рукавами',
//                           style: AppTextStyle.s22w600,
//                         ),
//                         SizedBox(
//                           height: 5,
//                         ),
//                         Text(
//                           'Платье летнее мини А-силуэта',
//                           style: AppTextStyle.s12w200,
//                         ),
//                         SizedBox(
//                           height: 5,
//                         ),
//                       ]),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
